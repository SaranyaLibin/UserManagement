<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewUser.aspx.cs" Inherits="UserManagement.EditUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel = "stylesheet" type = "text/css" href = "usermanagement.css" />
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="labelviewfirstname" runat="server" Text="FirstName:" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="labelviewfnvalue" runat="server" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labelviewlastname" runat="server" Text="LastName:" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="labelviewln" runat="server" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labelviewusername" runat="server" Text="Username:" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="viewusernamevalue" runat="server" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labelviewemail" runat="server" Text="EmailAddress:" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="viewemailvalue" runat="server" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="labelviewcalendar" runat="server" Text="BusinessCalendar:" ForeColor="White"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="viewcalendarvalue" runat="server" ForeColor="White"></asp:Label>
                </td>
                </tr>
            <tr>
                    <td>
                        <asp:Label ID="labelviewaccesstype" runat="server" Text="AccessType:" ForeColor="White"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="viewaccesstypevalue" runat="server" ForeColor="White"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="labelviewdept" runat="server" Text="Department:" ForeColor="White"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="viewdeptvalue" runat="server" ForeColor="White"></asp:Label>
                    </td>
                </tr>
        </table>
    </div>
    </form>
</body>
</html>
