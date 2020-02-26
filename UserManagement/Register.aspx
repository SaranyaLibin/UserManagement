<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="UserManagement.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel = "stylesheet" type = "text/css" href = "usermanagement.css" />
    <style>
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="scrptSignUp" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="SignUpUpdatePanel" runat="server">
    <ContentTemplate>
    <div class="container">
        <asp:Label ID="label_error_register" runat="server" Text="Label" ForeColor="Red" Visible="False"></asp:Label>
        <table>
            <tr>
                <td>
                    <asp:Label ID="label_register_emailaddress" runat="server" ForeColor="White" Text="EmailAddress"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_register_emailaddress" runat="server" CssClass="uitextbox" TextMode="Email" ViewStateMode="Disabled"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator1" runat="server" ControlToValidate="txt_register_emailaddress" ErrorMessage="Enter Emailaddress " ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="label_register_password" runat="server" ForeColor="White" Text="Password"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_register_pswd" runat="server" CssClass="uitextbox" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator1" runat="server" ControlToValidate="txt_register_pswd" ErrorMessage="Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_register_confirmpswd" ControlToValidate="txt_register_pswd" ErrorMessage="Password should be same" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="label_register_confrmpswd" runat="server" ForeColor="White" Text="ConfirmPassword"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_register_confirmpswd" runat="server" CssClass="uitextbox" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="confrmpswdRequiredFieldValidator2" runat="server" ControlToValidate="txt_register_confirmpswd" ErrorMessage="Enter Confirm password" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="label_register_first_name" runat="server" ForeColor="White" Text="FirstName"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="txt_register_first_name" runat="server" CssClass="uitextbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ControlToValidate="txt_register_first_name" ErrorMessage="Enter first name" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="label_register_lastname" runat="server" ForeColor="White" Text="LastName"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="txt_register_last_name" runat="server" CssClass="uitextbox"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastname" runat="server" ControlToValidate="txt_register_last_name" ErrorMessage="Enter lastname" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="label_register_dateofbirth" runat="server" ForeColor="White" Text="Date of Birth"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="txt_calendar_selecteddate" runat="server" CssClass="uitextbox" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="DOBRequiredFieldValidator3" runat="server" ControlToValidate="txt_calendar_selecteddate" ErrorMessage="Enter Date of Birth " ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="label_register_phno" runat="server" ForeColor="White" Text="PhoneNumber"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_register_phno" runat="server" CssClass="uitextbox" TextMode="Phone"></asp:TextBox>
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_register_phno" ErrorMessage="RegularExpressionValidator" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" ForeColor="White" Text="Address"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="txt_register_address" runat="server" CssClass="uitextbox" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <BotDetect:WebFormsCaptcha ID="captchaBox" runat="server" BackColor="#99CCFF" Height="90px" />
                </td>
                <td>
                    <asp:TextBox ID="txtCaptcha" runat="server" CssClass="uitextbox"></asp:TextBox>
                    <br />
                </td>
            </tr>
        </table>
        <asp:Button ID="btn_register" runat="server" CssClass="uibutton" OnClick="btn_register_Click" Text="Sign Up" Width="517px" />
       </div>
          </ContentTemplate> 
       </asp:UpdatePanel>
    </form>
</body>
</html>
