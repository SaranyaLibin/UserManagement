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
        <asp:Label ID="label_error_register" runat="server" Text="Label" ForeColor="Black"></asp:Label>

    <table>
        <tr>
            <td>
                <asp:Label ID="label_register_emailaddress" runat="server" ForeColor="White" Text="EmailAddress"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_register_emailaddress" runat="server" CssClass="uitextbox" TextMode="Email" ViewStateMode="Disabled"></asp:TextBox>
                <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator1" runat="server" ControlToValidate="txt_register_emailaddress" ErrorMessage="Emailaddress cannot be empty" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="label_register_password" runat="server" Text="Password" ForeColor="White"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_register_pswd" runat="server" CssClass="uitextbox" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator1" runat="server" ControlToValidate="txt_register_pswd" ErrorMessage="Password cannot be empty" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_register_confirmpswd" ControlToValidate="txt_register_pswd" ErrorMessage="Password should be same"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="label_register_confrmpswd" runat="server" Text="ConfirmPassword" ForeColor="White"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_register_confirmpswd" runat="server" CssClass="uitextbox" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="confrmpswdRequiredFieldValidator2" runat="server" ControlToValidate="txt_register_confirmpswd" ErrorMessage="Confirm password cannot be empty" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="label_register_first_name" runat="server" Text="FirstName" ForeColor="White"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_register_first_name" runat="server" CssClass="uitextbox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td >
                <asp:Label ID="label_register_lastname" runat="server" Text="LastName" ForeColor="White"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_register_last_name" runat="server" CssClass="uitextbox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="label_register_dateofbirth" runat="server" Text="DateofBirth" ForeColor="White"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_calendar_selecteddate" runat="server" CssClass="uitextbox" TextMode="Date"></asp:TextBox>
                <asp:ImageButton ID="imagebtn_calendar" runat="server" OnClick="imagebtn_calendar_Click" Height="38px" ImageUrl="~/Images/calendar.png" CausesValidation="False" />
                <asp:RequiredFieldValidator ID="DOBRequiredFieldValidator3" runat="server" ControlToValidate="txt_calendar_selecteddate" ErrorMessage="Date of Birth cannot be empty" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:Calendar ID="register_calendar" runat="server" SelectionMode="DayWeekMonth" OnSelectionChanged="CalendarSelectionChanged" style="margin-left: 227px" CssClass="auto-style5" BackColor="#99CCFF"></asp:Calendar>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="label_register_phno" runat="server" Text="PhoneNumber" ForeColor="White"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_register_phno" runat="server" CssClass="uitextbox" TextMode="Phone"></asp:TextBox>
                <asp:RangeValidator ID="PhoneRangeValidator1" runat="server" ControlToValidate="txt_register_phno" ErrorMessage="Enter phone number between 0 and 9" MaximumValue="9" MinimumValue="0" ForeColor="Red"></asp:RangeValidator>
                &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_register_phno" ErrorMessage="RegularExpressionValidator"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Address" ForeColor="White"></asp:Label>
            </td>
            <td>
                <asp:TextBox ID="txt_register_address" runat="server" CssClass="uitextbox" TextMode="MultiLine"></asp:TextBox>
            </td>
        </tr>

        <tr>
           <td>
            <BotDetect:WebFormsCaptcha ID="captchaBox" runat="server" BackColor="#99CCFF" Height="90px"></BotDetect:WebFormsCaptcha>
               </td>
               <td>
             <asp:textbox ID="txtCaptcha" runat="server"  CssClass="uitextbox" ></asp:textbox>
            </td>
        </tr>
        
    </table>
        <asp:Button ID="btn_register" runat="server" OnClick="btn_register_Click" Text="Sign Up" CssClass="uibutton" Width="517px"/>
        <asp:Label ID="labelreg_errormsg" runat="server" Text="Label" Visible="False"></asp:Label>
            </div>

          </ContentTemplate> 
       </asp:UpdatePanel>
    </form>
</body>
</html>
