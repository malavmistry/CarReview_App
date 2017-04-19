<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Review.aspx.cs" Inherits="_Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <table>
        <tr>
            <td>
            </td>
            <td>
                Company name
            </td>
            <td>
                Model Name
            </td>
        </tr>
        <tr>
            <td>
                Select Car:
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="DropDownList1" runat="server" Height="28px" Width="121px" AutoPostBack="True"
                            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" DataSourceID="SqlDataSource1"
                            DataTextField="Name" DataValueField="C_Id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>"
                            SelectCommand="SELECT [C_Id], [Name] FROM [CompanyMaster]"></asp:SqlDataSource>
                    </ContentTemplate>
                    <%--  <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="DropDownList1" EventName="DropDownList1_SelectedIndexChanged" />
                    </Triggers>--%>
                </asp:UpdatePanel>
            </td>
            <td>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server" Height="28px" Width="121px" AutoPostBack="True"
                            DataSourceID="SqlDataSource2" DataTextField="Model" DataValueField="M_Id" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged" />
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnString %>"
                            SelectCommand="SELECT c.c_id,m.m_id,m.model FROM [ModelMaster]m join [companymaster]c on(m.c_id=c.c_id) WHERE (m.[C_Id] = @C_Id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" DefaultValue="1" Name="C_Id" PropertyName="SelectedValue"
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="DropDownList1" EventName="SelectedIndexChanged" />
                    </Triggers>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit"
                    Width="67px" />
            </td>
            <td>
            </td>
        </tr>
    </table>
    <div>
        <asp:Panel ID="Panel1" runat="server">
        </asp:Panel>
    </div>
    <div>
        <asp:TextBox ID="txtPara" runat="server" Height="132px" Width="926px" 
            TextMode="MultiLine"></asp:TextBox></div>
    <div>
        <br />
        <asp:Button ID="btnPos" runat="server" Height="25px" Width="120px" OnClick="btnPos_Click"
            Text="POS Taging" />
        <br />
        <br />
        <asp:Button ID="btnFeature" runat="server" Height="25px" Width="120px" OnClick="btnFeature_Click"
            Text="Feature Score" />
    </div>
</asp:Content>
