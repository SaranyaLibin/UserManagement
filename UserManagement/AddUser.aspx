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
                    <asp:Label ID="labeladdusername" runat="server" Text="Username" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtaddusername" runat="server" CssClass="uitextbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtaddusername" ErrorMessage="PLease enter username"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeladduseremail" runat="server" Text="Email Address" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtadduseremail" runat="server" CssClass="uitextbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="adduserreqfieldemail" runat="server" ControlToValidate="txtadduseremail" ErrorMessage="PLease enter email adress"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeladduserpswd" runat="server" Text="Password" ForeColor="White"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtadduserpswd" runat="server" CssClass="uitextbox" TextMode="Password"></asp:TextBox></td>
            </tr>
              <tr>
                <td>
                    <asp:Label ID="labeladdusercnfrmpswd" runat="server" Text="Confirm Password" ForeColor="White"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtaddusercnfrmpswd" runat="server" CssClass="uitextbox" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeladduserdob" runat="server" Text="Business Calendar" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_adduser_calendar_selecteddate" runat="server" CssClass="uitextbox" TextMode="Date"></asp:TextBox>
                 </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labelaccesstype" runat="server" Text="Access Type" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="adduserDropDownaccesstype" runat="server" CssClass="uitextbox">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Regular User</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeladduserdept" runat="server" Text="Department" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="adduserDropDowndepartment" runat="server" CssClass="uitextbox">
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
                    <asp:Button ID="btnadduserSave" runat="server" Text="Save" OnClick="btnadduserSave_Click" CssClass="uibutton" />
                   
                </td>
                 <td>
                      <asp:Button ID="btnadduserCancel" runat="server" Text="Cancel" CssClass="uibutton" OnClick="btnadduserCancel_Click"/>
                 </td>
            </tr>
        </table>
          </div>
        <asp:Label ID="label_adduser_errormsg" runat="server" ForeColor="White" Text="Label" Visible="False"></asp:Label>
    </form>
</body>
</html>
