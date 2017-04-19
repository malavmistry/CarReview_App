<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Result.aspx.cs" Inherits="Default2" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div>
        <h3 style="background: none !important;">
            Result</h3>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White"
            BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black"
            Width="100%" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="Feature" HeaderText="Feature" SortExpression="Feature">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="PositivePolarity" HeaderText="Positive Polarity" SortExpression="PositivePolarity">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="NegativePolarity" HeaderText="Negative Polarity" SortExpression="NegativePolarity">
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>
    </div>
    <div>
        <div>
            <h3>
                Graph</h3>
        </div>
        <br />
        <asp:Chart ID="Chart1" runat="server" Width="578px">
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
            <Series>
                <asp:Series IsValueShownAsLabel=true Name="Series1" 
                    BorderColor="180, 26, 59, 105" ChartType="Pie" Legend="Positive Polarity">
                </asp:Series>
            </Series>
            <Legends>
                <asp:Legend Name="Positive Polarity">
                </asp:Legend>
            </Legends>
        </asp:Chart>
    </div>
</asp:Content>
