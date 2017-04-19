using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Text.RegularExpressions;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using HtmlAgilityPack;
using java.io;
using edu.stanford.nlp.tagger.maxent;
using edu.stanford.nlp.ling;
using javac = com.sun.tools.javac.util;
using java.util;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text.RegularExpressions;
public partial class _Default : System.Web.UI.Page
{
    String posstring;
    string newString;
    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ConnString"].ConnectionString);


    public const string Model =
      @"E:\CarReview_App\Bin\english-caseless-left3words-distsim.tagger";
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string htmlCode;

        List<string> lst = new List<string>();
        // var result = arr[0]["imdbID"];
        string xyz = String.Format("http://www.zigwheels.com/reviews/user-reviews/{0}/{1}", DropDownList1.SelectedItem, DropDownList2.SelectedItem);
        var getHtmlWeb = new HtmlWeb();
        var document = getHtmlWeb.Load(xyz);
        Literal Literal1 = new Literal();
        Literal1.ID = "Literal1";


        foreach (HtmlNode para in document.DocumentNode.SelectNodes("//div[@class='col-lg-12 col-md-12 col-sm-12 rw-description MT10']//div[@class='rw-heading']//a[@href]"))
        {
            HtmlAttribute att = para.Attributes["href"];

            lst.Add(att.Value);
        }
        foreach (var item in lst)
        {
            string newuri = string.Format("{0}", item);
            var htmlwebdoc = new HtmlWeb();
            var doc = htmlwebdoc.Load(newuri);
            foreach (HtmlNode para in doc.DocumentNode.SelectNodes("//div[@class='col-lg-12 col-md-12 col-sm-12 rw-description MT10']//p[@class='rwt-para']"))
            {
                int paracount = doc.DocumentNode.SelectNodes("//div[@class='col-lg-12 col-md-12 col-sm-12 rw-description MT10']//p[@class='rwt-para']").Count;
                Literal1.Text += String.Format(@"<p>{0}</p>", para.InnerText);
            }
        }
        Panel1.Controls.Add(Literal1);
    }
    private void TagReader(Reader reader)
    {
        var tagger = new MaxentTagger(Model);
        //List obj = (List)MaxentTagger.tokenizeText(reader);
        foreach (ArrayList sentence in MaxentTagger.tokenizeText(reader).toArray())
        {
            var tSentence = tagger.tagSentence(sentence);
            System.Console.WriteLine(Sentence.listToString(tSentence, false));
            posstring = (Sentence.listToString(tSentence, false));
            newString = newString + posstring;
            System.Console.WriteLine();
        }

    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void btnPos_Click(object sender, EventArgs e)
    {

        string replacestr = Regex.Replace(txtPara.Text, "[^a-zA-Z0-9_]+", " ");
        TagReader(new StringReader(replacestr));
        txtPara.Text = newString;
    }
    protected void btnFeature_Click(object sender, EventArgs e)
    {
        truncate();
        string[] para = txtPara.Text.Split('.');
        List<string> lstNN = new List<string>();
        List<string> lstJJ = new List<string>();
        for (int i = 0; i < para.Length; i++)
        {
            //if (lstNN.Count > lstJJ.Count && lstNN.Count > 0 && lstJJ.Count > 0)
            //{
            //    lstJJ.RemoveAt(lstJJ.Count - 1);
            //}
            //else if (lstNN.Count < lstJJ.Count && lstJJ.Count > 0 && lstNN.Count > 0)
            //{ lstNN.RemoveAt(lstNN.Count - 1); }


            string line = para[i];
            string[] word = line.Split(new[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);


            for (int j = 0; j < word.Length; j++)
            {

                int startindex = word[j].IndexOf("/");
                if (startindex < 0) { startindex = 0; }
                int lastindex = word[j].Length;
                string NewPos = word[j].Remove(0, startindex);
                string NewWord = word[j].Substring(0, startindex);
                switch (NewPos)
                {
                    case "/NN":
                        {
                            System.Console.Write("NN");
                            lstNN.Add(NewWord);

                            break;
                        }
                    case "/NNS":
                        {
                            System.Console.Write("NNS");
                            lstNN.Add(NewWord);

                            break;
                        }
                    case "/JJ":
                        {
                            System.Console.Write("JJ");
                            lstJJ.Add(NewWord);
                            string query = "select * from SentiWordNet where SynsetTerms='" + NewWord + "'";

                            break;
                        }
                    case "/JJR":
                        {
                            System.Console.Write("JJR");
                            lstJJ.Add(NewWord);
                            string query = "select * from SentiWordNet where SynsetTerms='" + NewWord + "'";

                            break;
                        }

                    case "/JJS":
                        {
                            System.Console.Write("JJS");
                            lstJJ.Add(NewWord);
                            string query = "select * from SentiWordNet where SynsetTerms='" + NewWord + "'";

                            break;
                        }

                    default:
                        { break; }

                }


            }
            for (int jj = 0; lstJJ.Count < lstNN.Count; jj++)
            {
                if (lstNN.Count > lstJJ.Count && lstNN.Count > 0)
                {
                    lstNN.RemoveAt(lstNN.Count - 1);
                }
            }
            for (int nn = 0; lstNN.Count < lstJJ.Count; nn++)
            {
                if (lstJJ.Count > lstNN.Count && lstJJ.Count > 0)
                {
                    lstJJ.RemoveAt(lstJJ.Count - 1);
                }
            }

            for (int k = 0; k < lstNN.Count; k++)
            {
                // int n= lstJJ.Count;


                SqlDataAdapter da = new SqlDataAdapter("insert into FO_Table(Feature) values('" + lstNN[k] + "')", conn);
                conn.Open();
                da.SelectCommand.ExecuteNonQuery();
                conn.Close();


                string query = "select * from SentiWordNet where SynsetTerms='" + lstJJ[k] + "'";
               // string query = "select max(PosScore)as PosScore,max(NegScore)as NegScore from SentiWordNet where SynsetTerms='" + lstJJ[k] + "'";
                SqlDataAdapter da1 = new SqlDataAdapter(query, conn);
                conn.Open();
                da1.SelectCommand.ExecuteNonQuery();
                DataTable dt = new DataTable();
                da1.Fill(dt);
                conn.Close();
                if (dt.Rows.Count > 0)
                {
                    double posvalue = Convert.ToDouble(dt.Rows[0]["PosScore"]);
                    double Negvalue = Convert.ToDouble(dt.Rows[0]["NegScore"]);
                    if (posvalue > Negvalue)
                    {
                        string feature = lstNN[k];
                        string NewWord = lstJJ[k];
                        conn.Open();
                        SqlDataAdapter da3 = new SqlDataAdapter(new SqlCommand("update FO_Table set PositivePolarity=" + 1 + ",value='" + NewWord + "' where Feature='" + feature + "'", conn));
                        da3.SelectCommand.ExecuteNonQuery();
                        conn.Close();
                    }
                    else if (Negvalue > posvalue || Negvalue != 0)
                    {
                        string feature = lstNN[k];
                        string NewWord = lstJJ[k];
                        conn.Open();
                        SqlDataAdapter da3 = new SqlDataAdapter("update FO_Table set NegativePolarity=" + 1 + ",value='" + NewWord + "' where feature='" + feature + "'", conn);
                        da3.SelectCommand.ExecuteNonQuery();
                        conn.Close();
                    }
                }

            }

            lstNN.RemoveAll(item => item == lstNN[0]);
            lstJJ.RemoveAll(item => item == lstJJ[0]);

        }
        Response.Redirect("Result.aspx");
    }

    protected void truncate()
    {
        SqlCommand cmd = new SqlCommand("truncate table FO_Table", conn);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
    }
}
