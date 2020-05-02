<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="UserManagement.EditUser1" %>

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
            <asp:ScriptManager ID="scrptEditUser" runat="server"></asp:ScriptManager>
            <asp:UpdatePanel ID="EditUserUpdatePanel" runat="server">
                <ContentTemplate>
                    <div class="form-group">
                        <asp:Label ID="labeleditusername" CssClass="col-form-label col-xs-3 mr-3" runat="server" Text="Username" ForeColor="White"></asp:Label>
                        <div class="col-xs-9">
                            <asp:TextBox ID="txteditusername" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="labeledituseremail" runat="server" CssClass="col-form-label col-xs-3 mr-3" Text="Email Address" ForeColor="White"></asp:Label>
                        <div class="col-xs-9">
                            <asp:TextBox ID="txtedituseremail" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="labeledituserpswd" runat="server" CssClass="col-form-label col-xs-3 mr-3" Text="Password" ForeColor="White"></asp:Label>
                        <div class="col-xs-9">
                            <asp:TextBox ID="txtedituserpswd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox></td>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="labeleditusercnfrmpswd" runat="server" CssClass="col-form-label col-xs-3 mr-3" Text="Confirm Password" ForeColor="White"></asp:Label>
                        <div class="col-xs-9">
                            <asp:TextBox ID="txteditusercnfrmpswd" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox></td>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="labeledituserdob" runat="server" CssClass="col-form-label col-xs-3 mr-3" Text="Business Calendar" ForeColor="White"></asp:Label>
                        <div class="col-xs-9">
                            <asp:TextBox ID="txt_edituser_calendar_selecteddate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="labeleditaccesstype" CssClass="col-form-label col-xs-3 mr-3" runat="server" Text="Access Type" ForeColor="White"></asp:Label>
                        <div class="col-xs-9">
                            <asp:TextBox ID="txtedituseraccesstype" runat="server" CssClass="form-control"></asp:TextBox>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="labeledituserdept" CssClass="col-form-label col-xs-3 mr-3" runat="server" Text="Department" ForeColor="White"></asp:Label>
                        <div class="col-xs-9">
                            <asp:DropDownList ID="edituserDropDowndepartment" runat="server" CssClass="form-control">
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
                                <asp:Button ID="btnedituserSave" CssClass="col-form-label col-xs-3 mr-3" runat="server" Text="Save" OnClick="btnedituserSave_Click" />
                            </div>
                            <div class="col-xs-6 mr-3">
                                <asp:Button ID="btnedituserCancel" runat="server" Text="Cancel" CssClass="form-control" OnClick="btnedituserCancel_Click" />
                            </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </form>
    </div>
</body>
</html>
