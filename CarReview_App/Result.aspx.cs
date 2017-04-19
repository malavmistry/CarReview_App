using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.DataVisualization.Charting;

public partial class Default2 : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["connString"].ConnectionString);
    protected void Page_Load(object sender, EventArgs e)
    {
        string query = "select Feature,COUNT(*) as countOfColoumn , COUNT(PositivePolarity)as PositivePolarity,COUNT(NegativePolarity)as NegativePolarity from FO_Table  where value is not null group by feature";

        SqlDataAdapter da = new SqlDataAdapter(query, conn);
        DataTable dt = new DataTable();
        da.Fill(dt);

        GridView1.DataSource = dt;
        GridView1.DataBind();
        int xAxisValue = 0;
        int yAxisPositiveValue = 0;
        int yAxisNegativeValue = 0;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            xAxisValue += Convert.ToInt32(dt.Rows[i]["countOfColoumn"]);
            yAxisPositiveValue += Convert.ToInt32(dt.Rows[i]["PositivePolarity"]);
            yAxisNegativeValue += Convert.ToInt32(dt.Rows[i]["NegativePolarity"]);
        }
        //Chart1.Series["Series1"].Legend = "Positive Polarity";
        Chart1.Series["Series1"].IsValueShownAsLabel = true;
        
        Chart1.Series["Series1"].Points.AddXY(xAxisValue, yAxisPositiveValue);
        Chart1.Series["Series1"].Points.AddXY(xAxisValue, yAxisNegativeValue);
        Chart1.DataBind();
        Chart1.Series["Series1"].Points[0].LabelToolTip = "Positive Polarity";
        Chart1.Series["Series1"].Points[1].LabelToolTip = "Negative Polarity";
        Chart1.Series["Series1"].Points[0].LegendText = "Positive Polarity";
        Chart1.Series["Series1"].Points[1].LegendText = "Negative Polarity";

        Chart1.Series["Series1"].Points[0].LegendToolTip = "Positive Polarity";
        Chart1.Series["Series1"].Points[1].LegendToolTip = "Negative Polarity";

    }
}