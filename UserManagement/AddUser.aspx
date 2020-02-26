<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="UserManagement.AddUser" %>

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
                    <asp:Label ID="labeladduseremail" runat="server" Text="Email Address" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtadduseremail" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeladduserpswd" runat="server" Text="Password" ForeColor="White"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtadduserpswd" runat="server"></asp:TextBox></td>
            </tr>
              <tr>
                <td>
                    <asp:Label ID="labeladdusercnfrmpswd" runat="server" Text="Confirm Password" ForeColor="White"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtaddusercnfrmpswd" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeladduserfirstname" runat="server" Text="First Name" ForeColor="White"></asp:Label>
                </td>
                <td>
                   <asp:TextBox ID="txtdduserfirstname" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeladduserlastname" runat="server" Text="Last Name" ForeColor="White"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtadduserlastname" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeladduserdob" runat="server" Text="Date of Birth" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_adduser_calendar_selecteddate" runat="server" CssClass="uitextbox" TextMode="Date"></asp:TextBox>
                    <asp:Calendar ID="adduser_register_calendar" runat="server" OnSelectionChanged="CalendarSelectionChanged" SelectionMode="DayWeekMonth" style="margin-left: 227px"></asp:Calendar>
                 </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labelaccesstype" runat="server" Text="Access Type" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="adduserDropDownaccesstype" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Regular User</asp:ListItem>
                        <asp:ListItem>Elevated Access User</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeladduserphno" runat="server" Text="Phone Number" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtadduserphno" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeladduserdept" runat="server" Text="Department" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="adduserDropDowndepartment" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Electrical</asp:ListItem>
                        <asp:ListItem>Technology</asp:ListItem>
                        <asp:ListItem>Mechanical</asp:ListItem>
                        <asp:ListItem>Civil</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeladduseraddress" runat="server" Text="Address" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtadduseraddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Button ID="btnadduserSave" runat="server" Text="Save" />
                   
                </td>
                 <td>
                      <asp:Button ID="btnadduserCancel" runat="server" Text="Cancel" />
                 </td>
            </tr>
        </table>
          </div>
        <asp:Label ID="label_adduser_errormsg" runat="server" ForeColor="White" Text="Label" Visible="False"></asp:Label>
    </form>
</body>
</html>
