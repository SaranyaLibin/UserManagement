<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UserManagement.Login" %>
  
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link rel = "stylesheet" type = "text/css" href = "usermanagement.css" />
    <style type="text/css">
        .auto-style1 {
            border-style: none;
            border-color: inherit;
            border-width: medium;
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0 8px 120px;
            cursor: pointer;
        }
        .auto-style2 {
            margin-left: 76px;
        }
    </style>
    </head>
<body style="height: 581px">
    <form id="form1" runat="server">
    <asp:ScriptManager ID="scrptLogin" runat="server"></asp:ScriptManager> 
    <asp:UpdatePanel ID="LoginUpdatePanel" runat="server">
        <ContentTemplate> 
           <div class="imgcontainer">
               <asp:Image ID="imglogin" runat="server" ImageUrl="~/Images/imglogin.png" Height="205px" Width="247px" CssClass="auto-style2" />
          </div>
      <div class="container">
        <table>
            <tr>
                <td>
                    <asp:Label ID="label_login_username" runat="server" Text="Username" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_login_username"  runat="server" CssClass="uitextbox" TextMode="Email"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="usernameRequiredFieldValidator1" runat="server" ControlToValidate="txt_login_username" ErrorMessage="Field cannot be empty"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="label_login_password" runat="server" Text="Password" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_login_password" runat="server" CssClass="uitextbox" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="passwordRequiredFieldValidator1" runat="server" ControlToValidate="txt_login_password" ErrorMessage="Field cannot be empty"></asp:RequiredFieldValidator>
                </td>
            </tr>

            </table>
            <asp:Button ID="btnLogin" runat="server" Cssclass="uibutton" Text="Login" OnClick="btnLogin_Click"  Height="57px" Width="234px" />
            <asp:Button ID="btn_SignUp" runat="server" Cssclass="uibutton" OnClick="btn_SignUp_Click" Text="SignUp" Width="233px" Height="58px" />
            <br />
          <br />
          <br />
          <br />
            <asp:Label ID="label_login_errmsg" runat="server" ForeColor="White" Visible="False"></asp:Label>
     
          </div>
          </ContentTemplate> 
       </asp:UpdatePanel>
        </form>
</body>

</html>
