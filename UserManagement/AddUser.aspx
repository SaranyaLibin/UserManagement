<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddUser.aspx.cs" Inherits="UserManagement.AddUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel = "stylesheet" type = "text/css" href = "usermanagement.css" />

</head>
<body>
    <form id="form1" runat="server">
      <div>
        <table>
            <tr>
                <td>
                    <asp:Label ID="labeladduseremail" runat="server" Text="Email Address" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtadduseremail" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeladduserpswd" runat="server" Text="Password" ForeColor="White"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtadduserpswd" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeladduserfirstname" runat="server" Text="First Name" ForeColor="White"></asp:Label>
                </td>
                <td>
                   <asp:TextBox ID="txtdduserfirstname" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeladduserlastname" runat="server" Text="Last Name" ForeColor="White"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtadduserlastname" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeladduserdob" runat="server" Text="Date of Birth" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:Calendar ID="adduserCalendar2" runat="server" BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#003399" Height="200px" Width="220px">
                        <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                        <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                        <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                        <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                        <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                        <WeekendDayStyle BackColor="#CCCCFF" />
                    </asp:Calendar>
                 </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labelaccesstype" runat="server" Text="Access Type" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="adduserDropDownList1" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Engineer</asp:ListItem>
                        <asp:ListItem>Supervisor</asp:ListItem>
                        <asp:ListItem>Administrator</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeladduserphno" runat="server" Text="Phone Number" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtadduserphno" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeladduserdept" runat="server" Text="Department" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="adduserDropDownList2" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Electrical</asp:ListItem>
                        <asp:ListItem>Technology</asp:ListItem>
                        <asp:ListItem>Mechanical</asp:ListItem>
                        <asp:ListItem>Civil</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeladduseraddress" runat="server" Text="Address" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtadduseraddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    <asp:Button ID="btnadduserSave" runat="server" Text="Save" />
                   
                </td>
                 <td>
                      <asp:Button ID="btnadduserCancel" runat="server" Text="Cancel" />
                 </td>
            </tr>
        </table>
          </div>
    </form>
</body>
</html>
