<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="UserManagement.EditProfile" %>

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
                <asp:Label ID="labeleditprofilemailaddress" CssClass="col-form-label col-xs-3 mr-3" runat="server" Text="Email Address" ForeColor="White"></asp:Label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txteditprofileemail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="labeleditprofilepswd" CssClass="col-form-label col-xs-3 mr-3" runat="server" Text="Password" ForeColor="White"></asp:Label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txteditprofilepassword" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="labeleditprofileconfrmpswd" CssClass="col-form-label col-xs-3 mr-3" runat="server" Text="Confirm Password" ForeColor="White"></asp:Label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txteditprofileconfrmpswd" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="labeleditprofilefirstname" CssClass="col-form-label col-xs-3 mr-3" runat="server" Text="First Name" ForeColor="White"></asp:Label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txteditprofilefirstname" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="labeleditprofilelastname" CssClass="col-form-label col-xs-3 mr-3" runat="server" Text="Last Name" ForeColor="White"></asp:Label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txteditprofilelastname" CssClass="form-control" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="labeleditprofiledateofbirth" runat="server" Text="DateofBirth" ForeColor="White"></asp:Label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txteditprofileCalendar" runat="server" TextMode="Date"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="labeleditprofilephoneno" runat="server" Text="PhoneNumber" ForeColor="White"></asp:Label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txteditprofilephoneno" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <asp:Label ID="labeleditprofileaddress" runat="server" Text="Address" ForeColor="White"></asp:Label>
                <div class="col-xs-9">
                    <asp:TextBox ID="txteditprofileaddress" runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-xs-6 mr-3">
                        <asp:Button ID="btnprofileSave" CssClass="btn btn-primary" runat="server" Text="Save"  OnClick="btnprofileSave_Click" />
                    </div>
                    <div class="col-xs-6 mr-3">
                        <asp:Button ID="btnprofilecancel" CssClass="btn btn-primary" runat="server" Text="Cancel" OnClick="btnprofilecancel_Click" />

                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
