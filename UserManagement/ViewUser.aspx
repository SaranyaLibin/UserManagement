<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewUser.aspx.cs" Inherits="UserManagement.EditUser" %>

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
                <div class="row">
                    <div class="col-xs-6 mr-3">
                        <asp:Label ID="labelviewfirstname" runat="server" Text="FirstName:" ForeColor="White"></asp:Label>
                    </div>
                    <div class="col-xs-6 mr-3">
                        <asp:Label ID="labelviewfnvalue" runat="server" ForeColor="White"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-xs-6 mr-3">
                        <asp:Label ID="labelviewlastname" runat="server" Text="LastName:" ForeColor="White"></asp:Label>
                    </div>
                    <div class="col-xs-6 mr-3">
                        <asp:Label ID="labelviewln" runat="server" ForeColor="White"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-xs-6 mr-3">
                        <asp:Label ID="labelviewusername" runat="server" Text="Username:" ForeColor="White"></asp:Label>
                    </div>
                    <div class="col-xs-6 mr-3">
                        <asp:Label ID="viewusernamevalue" runat="server" ForeColor="White"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-xs-6 mr-3">
                        <asp:Label ID="labelviewemail" runat="server" Text="EmailAddress:" ForeColor="White"></asp:Label>
                    </div>
                    <div class="col-xs-6 mr-3">
                        <asp:Label ID="viewemailvalue" runat="server" ForeColor="White"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-xs-6 mr-3">
                        <asp:Label ID="labelviewcalendar" runat="server" Text="BusinessCalendar:" ForeColor="White"></asp:Label>
                    </div>
                    <div class="col-xs-6 mr-3">
                        <asp:Label ID="viewcalendarvalue" runat="server" ForeColor="White"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-xs-6 mr-3">
                        <asp:Label ID="labelviewaccesstype" runat="server" Text="AccessType:" ForeColor="White"></asp:Label>
                    </div>
                    <div class="col-xs-6 mr-3">
                        <asp:Label ID="viewaccesstypevalue" runat="server" ForeColor="White"></asp:Label>
                    </div>
                </div>
            </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-xs-6 mr-3">
                        <asp:Label ID="labelviewdept" runat="server" Text="Department:" ForeColor="White"></asp:Label>
                    </div>
                    <div class="col-xs-6 mr-3">
                        <asp:Label ID="viewdeptvalue" runat="server" ForeColor="White"></asp:Label>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>
