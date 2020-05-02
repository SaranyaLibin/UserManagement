<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="UserManagement.WelcomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <script src="Scripts/jquery.min.js" type="text/javascript"></script>
    <script src="Scripts/popper.min.js" type="text/javascript"></script>
    <script src="Scripts/bootstrap.min.js" type="text/javascript"></script>
    <link rel="stylesheet" type="text/css" href="usermanagement.css" />
</head>
<body>
    <div class="container">
        
        <form id="form1" runat="server">
            <nav class="navbar navbar-expand-md bg-dark navbar-dark">
               
                <!-- Toggler/collapsibe Button -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="nav nav-tabs nav-justified">
              <%--      <ul class="navbar-nav">--%>
                        <li class="nav-item">

                          <asp:Button Text="Welcome" BorderStyle="None" ID="welcome" runat="server" CssClass="nav-link active btn btn-primary"
                                OnClick="welcome_Click" />
                        </li>
                        <li class="nav-item">
                            <asp:Button Text="My Profile" BorderStyle="None" ID="myprofile" runat="server" CssClass="nav-link active btn btn-primary"
                                OnClick="MyProfile_Click" />
                        </li>
                        <li class="nav-item">
                            <asp:Button Text="Users" BorderStyle="None" ID="users" runat="server" CssClass="nav-link active btn btn-primary"
                                OnClick="Users_Click" />
                        </li>
                        <li class="nav-item">
                            <asp:Button Text="Access Request" BorderStyle="None" ID="accessrequest" runat="server" CssClass="nav-link active btn btn-primary"
                                OnClick="AccessRequest_Click" />
                        </li>

                    </ul>
                </div>
            </nav>
            <%--<div class="tab-content">--%>
            <asp:MultiView ID="MainView" runat="server">
                <asp:View ID="View1" runat="server">
                    <div class="form-group">
                        <asp:Label ID="labelwelcome" runat="server" Text="Label" ForeColor="#FFFFCC"></asp:Label>
                    </div>
                </asp:View>
                <asp:View ID="View2" runat="server">
                    <div class="row">
                        <div class="col">
                            <div class="form-group">
                                <asp:Label ID="labelprofilemailaddress" runat="server" Text="Email Address" ForeColor="White" CssClass="col-form-label col-xs-3 mr-3"></asp:Label>
                                <div class="col-xs-9">
                                    <asp:TextBox ID="txtprofileemail" runat="server" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="labelprofilepswd" runat="server" Text="Password" ForeColor="White" CssClass="col-form-label col-xs-3 mr-3"></asp:Label>
                                <div class="col-xs-9">
                                    <asp:TextBox ID="txtprofilepassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="labelprofilefirstname" CssClass="col-form-label col-xs-3 mr-3" runat="server" Text="First Name" ForeColor="White"></asp:Label>
                                <div class="col-xs-9">
                                    <asp:TextBox ID="txtprofilefirstname" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="labelprofilelastname" CssClass="col-form-label col-xs-3 mr-3" runat="server" Text="Last Name" ForeColor="White"></asp:Label>
                                <div class="col-xs-9">
                                    <asp:TextBox ID="txtprofilelastname" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="labelprofiledateofbirth" CssClass="col-form-label col-xs-3 mr-3" runat="server" Text="DateofBirth" ForeColor="White"></asp:Label>
                                <div class="col-xs-9">
                                    <asp:TextBox ID="txtprofileCalendar" CssClass="form-control" runat="server" TextMode="Date"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="labelprofileaccesstype" CssClass="col-form-label col-xs-3 mr-3" runat="server" Text="Access Type" ForeColor="White"></asp:Label>
                                <div class="col-xs-9">
                                    <asp:TextBox ID="txtprofileAccessType" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <asp:Label ID="labelprofilephoneno" CssClass="col-form-label col-xs-3 mr-3" runat="server" Text="PhoneNumber" ForeColor="White"></asp:Label>
                                <div class="col-xs-9">
                                    <asp:TextBox ID="txtprofilephoneno" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="labelprofiledept" CssClass="col-form-label col-xs-3 mr-3" runat="server" Text="Department" ForeColor="White"></asp:Label>
                                <div class="col-xs-9">
                                    <asp:TextBox ID="txtprofiledepartment" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label ID="labelprofileaddress" CssClass="col-form-label col-xs-3 mr-3" runat="server" Text="Address" ForeColor="White"></asp:Label>
                                <div class="col-xs-9">
                                    <asp:TextBox ID="txtprofileaddress" CssClass="form-control" runat="server"></asp:TextBox>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-xs-6 mr-3">
                                        <asp:Button ID="btnreqelevatedaccess" runat="server" Text="Request Elevated Access " CssClass="btn btn-primary" OnClick="btnreqelevatedaccess_Click" />
                                    </div>
                                    <div class="col-xs-6 mr-3">
                                        <asp:Button ID="btnEditprofile" runat="server" Text="Edit" CssClass="btn btn-primary" OnClick="btnEditprofile_Click" />

                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="col">
                            <asp:Label ID="labelmyprofilereqstatus" runat="server" CssClass="col-form-label col-xs-3 mr-3 float-right text-center text-info font-italic" Text="RequestStatus" Visible="False" ForeColor="White"></asp:Label>
                        </div>
                    </div>
                </asp:View>
                <asp:View ID="View3" runat="server">
                    <div class="btn-group mr-3">
                        <asp:Button ID="Create" runat="server" Text="Create" CssClass="btn btn-primary " OnClick="Create_Click" />
                        <asp:Button ID="View" runat="server" Text="View" CssClass="btn btn-primary " OnClick="View_Click" />
                        <asp:Button ID="Edit" runat="server" Text="Edit" CssClass="btn btn-primary " OnClick="Edit_Click" />
                        <asp:Button ID="Delete" runat="server" Text="Delete" CssClass="btn btn-primary " OnClick="Delete_Click" />
                    </div>
                    <div class="form-group mt-3">
                        <div class="row">
                            <div class="mr-3 col-xs-6">
                                <asp:Label ID="Dept" CssClass="col-form-label col-xs-3" runat="server" ForeColor="White" Text="Department"></asp:Label>
                            </div>
                            <div class="mr-3 col-xs-6">
                                <div class="dropdown">
                                    <asp:DropDownList ID="DropDownListUserDept" runat="server" CssClass="form-control dropdown-toggle" AutoPostBack="True" OnSelectedIndexChanged="DropDownListUserDept_SelectedIndexChanged">
                                        <asp:ListItem>All</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="mr-3 col-xs-6">
                                <div class="input-group">
                                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control"></asp:TextBox>
                                    <div class="input-group-append">
                                        <asp:Button ID="btnSearch" runat="server" CssClass="btn btn-success" Text="Search" OnClick="btnSearch_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <asp:GridView ID="UsersGridView1" runat="server" AutoGenerateColumns="False" AllowSorting="True" OnSorting="OnSorting" EmptyDataText="No records available" EmptyDataRowStyle-ForeColor="White" OnRowCreated="UsersGridView1_RowCreated" CssClass="table table-striped">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="UsersCheckBox1" runat="server" AutoPostBack="False" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Userid" HeaderStyle-ForeColor="White">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="UserName" DataField="UserName" SortExpression="UserName">
                                    <HeaderStyle ForeColor="White" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="FirstName" DataField="FirstName" SortExpression="FirstName">
                                    <HeaderStyle ForeColor="White" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="LastName" DataField="LastName" SortExpression="LastName">
                                    <HeaderStyle ForeColor="White" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="AccessType" DataField="AccessType" SortExpression="AccessType">
                                    <HeaderStyle ForeColor="White" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Department" DataField="Department" SortExpression="Department">
                                    <HeaderStyle ForeColor="White" />
                                </asp:BoundField>
                            </Columns>
                            <HeaderStyle BackColor="#4CAF50" ForeColor="White" HorizontalAlign="Left"></HeaderStyle>
                            <RowStyle ForeColor="White" />
                        </asp:GridView>
                    </div>
                </asp:View>
                <asp:View ID="View4" runat="server">
                    <div class="form-group">
                        <div class="row">
                            <div class="mr-3 col-xs-6">
                                <asp:Label ID="AccessLabel" runat="server" ForeColor="White" Text="Department"></asp:Label>
                            </div>
                            <div class="col-xs-3 mr-3">
                                <div class="dropdown">
                                    <asp:DropDownList ID="AccessDropDownList" CssClass="form-control dropdown-toggle" runat="server" OnSelectedIndexChanged="AccessDropDownList_SelectedIndexChanged" AutoPostBack="True">
                                        <asp:ListItem>All</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="mr-3 col-xs-3">
                                <div class="input-group mb-3">
                                    <asp:TextBox ID="txtaccessSearch" runat="server" CssClass="form-control"></asp:TextBox>
                                    <div class="input-group-append">
                                        <asp:Button ID="btnaccessSearch" runat="server" CssClass="btn btn-success" Text="Search" OnClick="btnaccessSearch_Click1" />
                                    </div>
                                </div>
                            </div>
                            <div class="mr-3 col-xs-3">
                                <asp:Button ID="Approve" runat="server" CssClass="btn btn-success" Text="Approve" OnClick="Approve_Click" />
                            </div>
                            <div class="mr-3 col-xs-3">
                                <asp:Button ID="Decline" runat="server" Text="Decline" CssClass="btn btn-danger" OnClick="Decline_Click" />
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <asp:GridView ID="AccessGridView1" runat="server" AutoGenerateColumns="False" OnRowCreated="AccessRequestGridView1_RowCreated" AllowSorting="True" OnSorting="AccessGridView1_Sorting" EmptyDataText="No records available" EmptyDataRowStyle-ForeColor="White" CssClass="table table-striped">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:CheckBox ID="AccessCheckBox1" runat="server" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Requestid" HeaderStyle-ForeColor="White">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex + 1 %>
                                    </ItemTemplate>
                                    <HeaderStyle ForeColor="White" />
                                </asp:TemplateField>
                                <asp:BoundField HeaderText="UserName" DataField="UserName" SortExpression="UserName">
                                    <HeaderStyle ForeColor="White" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="FirstName" DataField="FirstName" SortExpression="FirstName">
                                    <HeaderStyle ForeColor="White" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="LastName" DataField="LastName" SortExpression="LastName">
                                    <HeaderStyle ForeColor="White" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="Department" DataField="Department" SortExpression="Department">
                                    <HeaderStyle ForeColor="White" />
                                </asp:BoundField>
                                <asp:BoundField HeaderText="RequestStatus" DataField="RequestStatus" SortExpression="RequestStatus">
                                    <HeaderStyle ForeColor="White" />
                                </asp:BoundField>
                            </Columns>
                            <EmptyDataRowStyle ForeColor="White" />
                            <RowStyle ForeColor="White" />
                        </asp:GridView>
                    </div>
                </asp:View>
            </asp:MultiView>
            <%-- </div>--%>
        </form>
    </div>
</body>
</html>
