<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUser.aspx.cs" Inherits="UserManagement.EditUser1" %>

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
                    <asp:Label ID="labeleditusername" runat="server" Text="Username" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txteditusername" runat="server" CssClass="uitextbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeledituseremail" runat="server" Text="Email Address" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtedituseremail" runat="server" CssClass="uitextbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeledituserpswd" runat="server" Text="Password" ForeColor="White"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtedituserpswd" runat="server" CssClass="uitextbox" TextMode="Password"></asp:TextBox></td>
            </tr>
              <tr>
                <td>
                    <asp:Label ID="labeleditusercnfrmpswd" runat="server" Text="Confirm Password" ForeColor="White"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txteditusercnfrmpswd" runat="server" CssClass="uitextbox" TextMode="Password"></asp:TextBox></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeledituserdob" runat="server" Text="Business Calendar" ForeColor="White"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txt_edituser_calendar_selecteddate" runat="server" CssClass="uitextbox" TextMode="Date"></asp:TextBox>
                 </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeleditaccesstype" runat="server" Text="Access Type" ForeColor="White"></asp:Label>
                </td>
                <td>
                     <asp:TextBox ID="txtedituseraccesstype" runat="server" CssClass="uitextbox" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labeledituserdept" runat="server" Text="Department" ForeColor="White"></asp:Label>
                </td>
              
                 <td>
                    <asp:DropDownList ID="edituserDropDowndepartment" runat="server" CssClass="uitextbox">
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
                    <asp:Button ID="btnedituserSave" runat="server" Text="Save" OnClick="btnedituserSave_Click" CssClass="uibutton" />
                   
                </td>
                 <td>
                      <asp:Button ID="btnedituserCancel" runat="server" Text="Cancel" CssClass="uibutton" OnClick="btnedituserCancel_Click"/>
                 </td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
