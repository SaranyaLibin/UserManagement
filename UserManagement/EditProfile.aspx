<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="UserManagement.EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title> </title>
    <link rel = "stylesheet" type = "text/css" href = "usermanagement.css" />
    <style type="text/css">
        .auto-style1 {
            height: 26px;
        }
        .auto-style2 {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table style="width: 50%;border-width: 1px; border-color: #666; border-style: solid">
        <tr>
            <td>
                <asp:Label ID="labeleditprofilemailaddress" runat="server" Text="Email Address" ForeColor="White"></asp:Label>
            </td>

            <td>
                <asp:TextBox ID="txteditprofileemail" runat="server" CssClass="auto-style2"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="labeleditprofilepswd" runat="server" Text="Password" ForeColor="White"></asp:Label>
            </td>

            <td class="auto-style1">
                <asp:TextBox ID="txteditprofilepassword" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="labeleditprofileconfrmpswd" runat="server" Text="Confirm Password" ForeColor="White"></asp:Label>
            </td>

            <td>
                <asp:TextBox ID="txteditprofileconfrmpswd" runat="server" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="labeleditprofilefirstname" runat="server" Text="First Name" ForeColor="White"></asp:Label>
            </td>

            <td>
                <asp:TextBox ID="txteditprofilefirstname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="labeleditprofilelastname" runat="server" Text="Last Name" ForeColor="White"></asp:Label>
            </td>

            <td>
                <asp:TextBox ID="txteditprofilelastname" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="labeleditprofiledateofbirth" runat="server" Text="DateofBirth" ForeColor="White"></asp:Label>
            </td>

            <td>
                <asp:TextBox ID="txteditprofileCalendar" runat="server" TextMode="Date"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="labeleditprofilephoneno" runat="server" Text="PhoneNumber" ForeColor="White"></asp:Label>
            </td>

            <td>
                <asp:TextBox ID="txteditprofilephoneno" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="labeleditprofileaddress" runat="server" Text="Address" ForeColor="White"></asp:Label>
            </td>

            <td>
                <asp:TextBox ID="txteditprofileaddress" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnprofileSave" runat="server" Text="Save" CssClass="uibutton" OnClick="btnprofileSave_Click"/>

            </td>
            <td>
                <asp:Button ID="btnprofilecancel" runat="server" Text="Cancel" CssClass="uibutton" OnClick="btnprofilecancel_Click"/>

            </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
