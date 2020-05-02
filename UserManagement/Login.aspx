<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UserManagement.Login" %>

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
        <form runat="server">
            <div class="form-group">
                <asp:Label ID="label_login_username" runat="server" Text="Username" ForeColor="White" CssClass="col-form-label col-xs-3 mr-3"></asp:Label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txt_login_username" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="label_login_password" runat="server" Text="Password" ForeColor="White" CssClass="col-form-label col-xs-3 mr-3"></asp:Label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txt_login_password" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-xs-6 mr-3">
                        <asp:Button ID="btnLogin" runat="server" CssClass="btn btn-primary" Text="Login" OnClick="btnLogin_Click" />
                    </div>
                    <div class="col-xs-6 mr-3">
                        <asp:Button ID="btn_SignUp" runat="server" CssClass="btn btn-primary" OnClick="btn_SignUp_Click" Text="SignUp" />
                    </div>
                </div>
            </div>
            <asp:Label ID="label_login_errmsg" runat="server" ForeColor="White" Visible="False"></asp:Label>
        </form>
    </div>
</body>
</html>
