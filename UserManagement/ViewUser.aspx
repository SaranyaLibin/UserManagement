<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewUser.aspx.cs" Inherits="UserManagement.EditUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel = "stylesheet" type = "text/css" href = "usermanagement.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="labeleditusername" runat="server" Text="Username" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="editusernamevalue" runat="server" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeleditemail" runat="server" Text="EmailAddress" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="editemailvalue" runat="server" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeledituserpswd" runat="server" Text="Password" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="editpswdvalue" runat="server" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labelcnfrmpswd" runat="server" Text="ConfirmPassword" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="editconfrmpswdvalue" runat="server" ForeColor="White"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeleditcalendar" runat="server" Text="BusinessCalendar  " ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="editcalendarvalue" runat="server" ForeColor="White"></asp:Label>
                </td>
                </tr>
            <tr>
                    <td>
                        <asp:Label ID="labeleditaccesstype" runat="server" Text="AccessType" ForeColor="White"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="accesstypevalue" runat="server" ForeColor="White"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="labeleditdept" runat="server" Text="Department" ForeColor="White"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="editdeptvalue" runat="server" ForeColor="White"></asp:Label>
                    </td>
                </tr>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
