<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="UserManagement.Register" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <script src="Scripts/jquery.min.js"></script>
    <script src="Content/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="usermanagement.css" />
</head>
<body>
    <div class="container">
        <form id="form1" runat="server">
            <div class="form-group">
                <asp:Label ID="label_error_register" runat="server" Text="Label" ForeColor="Red" Visible="False" CssClass="col-form-label col-xs-12 mr-12"></asp:Label>
            </div>
            <div class="form-group">
                <asp:Label ID="label_register_emailaddress" runat="server" ForeColor="White" Text="EmailAddress" CssClass="col-form-label col-xs-3 mr-3"></asp:Label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txt_register_emailaddress" runat="server" CssClass="form-control" TextMode="Email" ViewStateMode="Disabled"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator1" runat="server" ControlToValidate="txt_register_emailaddress" ErrorMessage="Enter Emailaddress " ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="label_register_password" runat="server" ForeColor="White" Text="Password" CssClass="col-form-label col-xs-3 mr-3"></asp:Label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txt_register_pswd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator1" runat="server" ControlToValidate="txt_register_pswd" ErrorMessage="Enter Password" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txt_register_confirmpswd" ControlToValidate="txt_register_pswd" ErrorMessage="Password should be same" ForeColor="Red"></asp:CompareValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="label_register_confrmpswd" runat="server" ForeColor="White" Text="ConfirmPassword" CssClass="col-form-label col-xs-2 mr-2"></asp:Label>
                <div class="col-xs-10">
                    <asp:TextBox ID="txt_register_confirmpswd" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="confrmpswdRequiredFieldValidator2" runat="server" ControlToValidate="txt_register_confirmpswd" ErrorMessage="Enter Confirm password" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="label_register_first_name" runat="server" ForeColor="White" Text="FirstName" CssClass="col-form-label col-xs-2 mr-2"></asp:Label>
                <div class="col-xs-10">
                    <asp:TextBox ID="txt_register_first_name" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorFirstName" runat="server" ControlToValidate="txt_register_first_name" ErrorMessage="Enter first name" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="label_register_lastname" runat="server" ForeColor="White" Text="LastName" CssClass="col-form-label col-xs-2 mr-2"></asp:Label>
                <div class="col-xs-10">
                    <asp:TextBox ID="txt_register_last_name" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidatorLastname" runat="server" ControlToValidate="txt_register_last_name" ErrorMessage="Enter lastname" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="label_register_dateofbirth" runat="server" ForeColor="White" Text="Date of Birth" CssClass="col-form-label col-xs-2 mr-2"></asp:Label>
                <div class="col-xs-10">
                    <asp:TextBox ID="txt_calendar_selecteddate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="DOBRequiredFieldValidator3" runat="server" ControlToValidate="txt_calendar_selecteddate" ErrorMessage="Enter Date of Birth " ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="label_register_phno" runat="server" ForeColor="White" Text="PhoneNumber" CssClass="col-form-label col-xs-2 mr-2"></asp:Label>
                <div class="col-xs-10">
                    <asp:TextBox ID="txt_register_phno" runat="server" CssClass="form-control" TextMode="Phone"></asp:TextBox>
                    &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_register_phno" ErrorMessage="RegularExpressionValidator" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="Label2" runat="server" ForeColor="White" Text="Address" CssClass="col-form-label col-xs-2 mr-2"></asp:Label>
                <div class="col-xs-10">
                    <asp:TextBox ID="txt_register_address" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>
            <div class="form-group row">
                <BotDetect:WebFormsCaptcha ID="captchaBox" runat="server" BackColor="#99CCFF" Height="90px" CssClass="col-form-label col-xs-2 mr-2" />
                <div class="col-xs-10">
                    <asp:TextBox ID="txtCaptcha" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>

            <div class="form-group">
                <div class="offset-xs-3 col-xs-9">
                    <asp:Button ID="btn_register" runat="server" CssClass="btn btn-primary" OnClick="btn_register_Click" Text="Create your Usermanagement account" Width="517px" />
                </div>
            </div>
        </form>
    </div>
</body>
</html>

