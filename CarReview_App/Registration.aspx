<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register Here!</title>
    <link href="~/Styles/Site.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #newtable
        {
            border: 0px;
            border-left: 0px;
            border-right: 0px;
        }
        table tbody td
        {
            border-collapse: collapse;
            border-left: 0px solid #cccccc;
            border-right: 0px solid #cccccc;
            vertical-align: top;
        }
        .style1
        {
            width: 120px;
        }
    </style>
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
                    </Items>
                </asp:Menu>
            </div>
        </div>
        <div class="main">
            <fieldset>
                <legend>Personal Information</legend>
                <table id="newtable">
                    <tr>
                        <td class="style1">
                        </td>
                        <td>
                            <asp:Label ID="lblShow" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            Username:
                        </td>
                        <td>
                            <asp:TextBox ID="txtUsername" runat="server" Height="24px" Width="145px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername"
                                ErrorMessage="Username Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            Password:
                        </td>
                        <td>
                            <asp:TextBox ID="txtPassword" runat="server" Height="24px" Width="145px" TextMode="Password"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                                ErrorMessage="Password Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            First Name:
                        </td>
                        <td>
                            <asp:TextBox ID="txtFirst" runat="server" Height="24px" Width="145px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFirst"
                                ErrorMessage="First Name Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            Middle Name:
                        </td>
                        <td>
                            <asp:TextBox ID="txtMiddle" runat="server" Height="24px" Width="145px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtMiddle"
                                ErrorMessage="Middle Name Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            Last Name:
                        </td>
                        <td>
                            <asp:TextBox ID="txtLast" runat="server" Height="24px" Width="145px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtLast"
                                ErrorMessage="Last Name Required"></asp:RequiredFieldValidator>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            Address:
                        </td>
                        <td>
                            <asp:TextBox ID="txtAddress" runat="server" Height="90px" Width="195px" 
                                TextMode="MultiLine"></asp:TextBox>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            Email ID:
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmail" runat="server" Height="24px" Width="194px"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtEmail"
                                ErrorMessage="Email Id Required"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                                ControlToValidate="txtEmail" ErrorMessage="Invalid Email ID" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            Contact No:
                        </td>
                        <td>
                            <asp:TextBox ID="txtContact" runat="server" Height="24px" Width="145px" MaxLength="10"></asp:TextBox>
                            &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txtContact"
                                ErrorMessage="Contact No Required"></asp:RequiredFieldValidator>
                            &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                                ControlToValidate="txtContact" ErrorMessage="Invalid Contact No:" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                        </td>
                        <td>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                        </td>
                        <td>
                            <asp:Button ID="btnSave" runat="server" Height="38px" Text="Save" Width="105px" OnClick="btnSave_Click" />
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btnClear" runat="server" Height="38px" Text="Clear" Width="105px"
                                OnClick="btnClear_Click" />
                        </td>
                        <td>
                        </td>
                    </tr>
                </table>
            </fieldset>
        </div>
    </div>
    </form>
</body>
</html>
