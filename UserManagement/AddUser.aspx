<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="UserManagement.AddUser" %>

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
                <asp:Label ID="labeladdusername" runat="server" Text="Username" ForeColor="White" CssClass="col-form-label col-xs-3 mr-3"></asp:Label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txtaddusername" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtaddusername" ErrorMessage="Enter username"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="labeladduseremail" CssClass="col-form-label col-xs-3 mr-3" runat="server" Text="Email Address" ForeColor="White"></asp:Label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txtadduseremail" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="adduserreqfieldemail" runat="server" ControlToValidate="txtadduseremail" ErrorMessage="PLease enter email adress"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="labeladduserpswd" CssClass="col-form-label col-xs-3 mr-3" runat="server" Text="Password" ForeColor="White"></asp:Label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txtadduserpswd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="labeladdusercnfrmpswd" runat="server" CssClass="col-form-label col-xs-3 mr-3" Text="Confirm Password" ForeColor="White"></asp:Label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txtaddusercnfrmpswd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox></td>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="labeladduserdob" runat="server" Text="Business Calendar" CssClass="col-form-label col-xs-3 mr-3" ForeColor="White"></asp:Label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txt_adduser_calendar_selecteddate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="labelaccesstype" CssClass="col-form-label col-xs-3 mr-3" runat="server" Text="Access Type" ForeColor="White"></asp:Label>
                <div class="col-xs-9">
                    <asp:DropDownList ID="adduserDropDownaccesstype" runat="server" CssClass="form-control">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Regular User</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="labeladduserdept" runat="server" CssClass="col-form-label col-xs-3 mr-3" Text="Department" ForeColor="White"></asp:Label>
                <div class="col-xs-9">
                    <asp:DropDownList ID="adduserDropDowndepartment" runat="server" CssClass="form-control">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Electrical</asp:ListItem>
                        <asp:ListItem>Technology</asp:ListItem>
                        <asp:ListItem>Mechanical</asp:ListItem>
                        <asp:ListItem>Civil</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-xs-6 mr-3">
                        <asp:Button ID="btnadduserSave" runat="server" Text="Save" OnClick="btnadduserSave_Click"  CssClass="btn btn-primary" />
                    </div>
                    <div class="col-xs-6 mr-3">
                        <asp:Button ID="btnadduserCancel" runat="server" Text="Cancel"  CssClass="btn btn-primary" OnClick="btnadduserCancel_Click" />
                    </div>
                </div>
            </div>
            <asp:Label ID="label_adduser_errormsg" runat="server" ForeColor="White" Text="Label" Visible="False"></asp:Label>
        </form>
        </div>
</body>
</html>
