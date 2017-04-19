<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Here!!!</title>
    <link href="Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="page">
        <div class="header">
            <div class="title">
                <h1>
                    Sentiment Analysis For Car Review
                </h1>
            </div>
            <div class="loginDisplay">
                <asp:LoginView ID="HeadLoginView" runat="server" EnableViewState="false">
                    <AnonymousTemplate>
                        [ <a href="~/Account/Login.aspx" id="HeadLoginStatus" runat="server">Log In</a>
                        ]
                    </AnonymousTemplate>
                    <LoggedInTemplate>
                        Welcome <span class="bold">
                            <asp:LoginName ID="HeadLoginName" runat="server" />
                        </span>! [
                        <asp:LoginStatus ID="HeadLoginStatus" runat="server" LogoutAction="Redirect" LogoutText="Log Out"
                            LogoutPageUrl="~/" />
                        ]
                    </LoggedInTemplate>
                </asp:LoginView>
            </div>
            <div class="clear hideSkiplink">
                <asp:Menu ID="NavigationMenu" runat="server" CssClass="menu" EnableViewState="false"
                    IncludeStyleBlock="false" Orientation="Horizontal">
                    <Items>
                        <%--<asp:MenuItem NavigateUrl="~/Default.aspx" Text="Home" />
                    <asp:MenuItem NavigateUrl="~/About.aspx" Text="About" />--%>
                    </Items>
                </asp:Menu>
            </div>
        </div>
        <div class="clear">
        </div>
        <div class="main">
            <fieldset>
                <legend>Login Information</legend>
                <table>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <asp:Label ID="lblShow" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Username :
                        </td>
                        <td>
                            <asp:TextBox ID="txtUsername" runat="server" Height="30px" Width="150px"></asp:TextBox>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            Password :
                        </td>
                        <td>
                            <asp:TextBox ID="txtPassword" runat="server" Height="30px" Width="150px" 
                                TextMode="Password"></asp:TextBox>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                        </td>
                        <td>
                            <asp:Button ID="btnLogin" runat="server" Height="32px" Text="Login" Width="82px"
                                OnClick="btnLogin_Click" />
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                        <a href="Registration.aspx">Create New Account Here</a>
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
        <div class="clear">
        </div>
    </div>
    </form>
</body>
</html>
