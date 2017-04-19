<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeFile="Profile.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
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
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
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
                    ErrorMessage="Username Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Password:<br />
                <br />
                <br />
                <asp:Label ID="Label1" runat="server" Text="Confirm Password :"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" Height="24px" Width="145px" TextMode="Password"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword"
                    ErrorMessage="Password Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <br />
                <asp:TextBox ID="txtConfirm" runat="server" Height="24px" Width="145px" TextMode="Password"></asp:TextBox>
                &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtPassword"
                    ControlToValidate="txtConfirm" ErrorMessage="Password Does Not Match" ForeColor="Red"></asp:CompareValidator>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td>
            </td>
            <td>
                <asp:CheckBox ID="chkPassword" runat="server" Text="Change Password" OnCheckedChanged="chkPassword_CheckedChanged"
                    AutoPostBack="true" />
                &nbsp;
                <asp:Button ID="btnChange" runat="server" OnClick="btnChange_Click" Text="Change Password"
                    Width="110px" />
            </td>
        </tr>
        <tr>
            <td class="style1">
                First Name:
            </td>
            <td>
                <asp:TextBox ID="txtFirst" runat="server" Height="24px" Width="145px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtFirst"
                    ErrorMessage="First Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
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
                    ErrorMessage="Middle Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
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
                    ErrorMessage="Last Name Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td class="style1">
                Address:
            </td>
            <td>
                <asp:TextBox ID="txtAddress" runat="server" Height="90px" Width="195px"></asp:TextBox>
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
                    ErrorMessage="Email Id Required" ForeColor="Red"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"
                    ForeColor="Red" ControlToValidate="txtEmail" ErrorMessage="Invalid Email ID"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
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
                    ErrorMessage="Contact No Required" ForeColor="Red"></asp:RequiredFieldValidator>
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                    ControlToValidate="txtContact" ErrorMessage="Invalid Contact No:" ValidationExpression="[0-9]{10}"
                    ForeColor="Red"></asp:RegularExpressionValidator>
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
</asp:Content>
