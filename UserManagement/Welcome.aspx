<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome.aspx.cs" Inherits="UserManagement.WelcomePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <link rel = "stylesheet" type = "text/css" href = "usermanagement.css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
    <div>
    <table style="width: 50%; border-width: 1px; text-align:match-parent;border-color: #666; border-style: solid">
      <tr>
        <td>
          <asp:Button Text="Welcome" BorderStyle="None" ID="welcome" CssClass="uibutton" runat="server"

              OnClick="welcome_Click" />
          <asp:Button Text="My Profile" BorderStyle="None" ID="myprofile" CssClass="uibutton" runat="server"

              OnClick="MyProfile_Click" />
          <asp:Button Text="Users" BorderStyle="None" ID="users" CssClass="uibutton" runat="server"

              OnClick="Users_Click" />
             <asp:Button Text="Access Request" BorderStyle="None" ID="accessrequest" CssClass="uibutton" runat="server"

              OnClick="AccessRequest_Click" />
          <asp:MultiView ID="MainView" runat="server">
            <asp:View ID="View1" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
                      <h3 style="color:white;">
                          <span>Welcome User</span>
                      </h3>
                  </td>
                </tr>
              </table>
            </asp:View>
              <asp:View ID="View2" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                <tr>
                  <td>
                      <asp:Label ID="labelprofilemailaddress" runat="server" Text="Email Address" ForeColor="White"></asp:Label>
                 </td>
                    
                  <td>
                      <asp:TextBox ID="txtprofileemail" runat="server"></asp:TextBox>
                 </td>
                </tr>
                   <tr>
                  <td>
                      <asp:Label ID="labelprofilepswd" runat="server" Text="Password" ForeColor="White"></asp:Label>
                 </td>
                    
                  <td>
                      <asp:TextBox ID="txtprofilepassword" runat="server"></asp:TextBox>
                 </td>
                </tr>
                   <tr>
                  <td>
                      <asp:Label ID="labelprofilefirstname" runat="server" Text="First Name" ForeColor="White"></asp:Label>
                 </td>
                    
                  <td>
                      <asp:TextBox ID="txtprofilefirstname" runat="server"></asp:TextBox>
                 </td>
                </tr>
                   <tr>
                  <td>
                      <asp:Label ID="labelprofilelastname" runat="server" Text="Last Name" ForeColor="White"></asp:Label>
                 </td>
                    
                  <td>
                      <asp:TextBox ID="txtprofilelastname" runat="server"></asp:TextBox>
                 </td>
                </tr>
                   <tr>
                  <td>
                      <asp:Label ID="labelprofiledateofbirth" runat="server" Text="DateofBirth" ForeColor="White"></asp:Label>
                 </td>
                    
                  <td>
                      <asp:Calendar ID="profileCalendar1" runat="server" BackColor="#66CCFF" SelectionMode="DayWeekMonth"></asp:Calendar>
                 </td>
                </tr>
                   <tr>
                  <td>
                      <asp:Label ID="labelprofileaccesstype" runat="server" Text="Access Type" ForeColor="White"></asp:Label>
                 </td>
                    
                  <td>
                      <asp:TextBox ID="txtprofileAccessType" runat="server"></asp:TextBox>
                 </td>
                </tr>
                   <tr>
                  <td>
                      <asp:Label ID="labelprofilephoneno" runat="server" Text="PhoneNumber" ForeColor="White"></asp:Label>
                 </td>
                    
                  <td>
                      <asp:TextBox ID="txtprofilephoneno" runat="server"></asp:TextBox>
                 </td>
                </tr>
                   <tr>
                  <td>
                      <asp:Label ID="labelprofiledept" runat="server" Text="Department" ForeColor="White"></asp:Label>
                 </td>
                    
                  <td>
                      <asp:TextBox ID="txtprofiledepartment" runat="server"></asp:TextBox>
                 </td>
                </tr>
                   <tr>
                  <td>
                      <asp:Label ID="labelprofileaddress" runat="server" Text="Address" ForeColor="White"></asp:Label>
                 </td>
                    
                  <td>
                      <asp:TextBox ID="txtprofileaddress" runat="server"></asp:TextBox>
                 </td>
                </tr>
              </table>
                


              </asp:View>
            <asp:View ID="View3" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
      
                <tr>
                        <td>
                        <asp:Button ID="Create" runat="server" Text="Create" Cssclass="uibutton" OnClick="Create_Click"/>
                        </td>
                        <td>
                        <asp:Button ID="View" runat="server" Text="View" Cssclass="uibutton" OnClick="View_Click"/>
                        </td>
                        <td>
                            <asp:Button ID="Edit" runat="server" Text="Edit" Cssclass="uibutton" OnClick="Edit_Click"/>
                        </td>
                        <td>
                            <asp:Button ID="Delete" runat="server" Text="Delete" Cssclass="uibutton"/>
                        </td>
                     </tr>
                    </table>
                    <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
    
                          <tr>
                              <td>
                                  <asp:Label ID="Dept" runat="server" ForeColor="White" Text="Department"></asp:Label>
                              </td>
                              <td>
                                  <asp:DropDownList ID="DropDownList1" runat="server">
                                      <asp:ListItem>All</asp:ListItem>
                                  </asp:DropDownList>
                              </td>
                              <td>
                                  <asp:TextBox ID="txtSearch" runat="server" CssClass="btnSearch"></asp:TextBox>
                                   <asp:Button ID="btnSearch" runat="server" CssClass="uibutton" Text="Search" />

                              </td>
                          </tr>
                       
                      <asp:GridView ID="UsersGridView1" runat="server" AutoGenerateColumns="False">
                          <Columns>
                              <asp:TemplateField>
                                  <ItemTemplate>
                                      <asp:CheckBox ID="CheckBox1" runat="server" />
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:BoundField HeaderText="UserId" >
                              <HeaderStyle ForeColor="White" />
                              </asp:BoundField>
                              <asp:BoundField HeaderText="FirstName" >
                              <HeaderStyle ForeColor="White" />
                              </asp:BoundField>
                              <asp:BoundField HeaderText="LastName">
                              <HeaderStyle ForeColor="White" />
                              </asp:BoundField>
                              <asp:BoundField HeaderText="Access Type">
                              <HeaderStyle ForeColor="White" />
                              </asp:BoundField>
                              <asp:BoundField HeaderText="Department">
                              <HeaderStyle ForeColor="White" />
                              </asp:BoundField>
                          </Columns>
                      </asp:GridView>
            </asp:View>
            <asp:View ID="View4" runat="server">
              <table style="width: 100%; border-width: 1px; border-color: #666; border-style: solid">
                           <tr>
                              <td>
                                  <asp:Label ID="AccessLabel" runat="server" ForeColor="White" Text="Department"></asp:Label>
                              </td>
                              <td>
                                  <asp:DropDownList ID="AccessDropDownList" runat="server">
                                      <asp:ListItem>Add</asp:ListItem>
                                  </asp:DropDownList>
                              </td>
                              <td>
                                  <asp:TextBox ID="txtaccessSearch" runat="server"  CssClass="btnSearch"></asp:TextBox>
                                  <asp:Button ID="btnaccessSearch" runat="server" CssClass="uibutton" Text="Search" />
                              </td>
                              <td>
                                <asp:Button ID="Approve" runat="server" Text="Approve" Cssclass="uibutton" OnClick="Create_Click"/>
                                <asp:Button ID="Decline" runat="server" Text="Decline" Cssclass="uibutton"/>
                                </td>
                          </tr>
                            
                      <asp:GridView ID="AccessGridView1" runat="server" AutoGenerateColumns="False">
                          <Columns>
                              <asp:TemplateField>
                                  <ItemTemplate>
                                      <asp:CheckBox ID="CheckBox1" runat="server" />
                                  </ItemTemplate>
                              </asp:TemplateField>
                              <asp:BoundField HeaderText="UserId" >
                              <HeaderStyle ForeColor="White" />
                              </asp:BoundField>
                              <asp:BoundField HeaderText="FirstName" >
                              <HeaderStyle ForeColor="White" />
                              </asp:BoundField>
                              <asp:BoundField HeaderText="LastName">
                              <HeaderStyle ForeColor="White" />
                              </asp:BoundField>
                              <asp:BoundField HeaderText="Access Type">
                              <HeaderStyle ForeColor="White" />
                              </asp:BoundField>
                              <asp:BoundField HeaderText="Request Status">
                              <HeaderStyle ForeColor="White" />
                              </asp:BoundField>
                          </Columns>
                      </asp:GridView>
                     </table>
            </asp:View>
          </asp:MultiView>
 

    </div>
    </ContentTemplate>
    </asp:UpdatePanel>
    </form>
</body>
</html>
