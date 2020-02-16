using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserManagement
{
    public partial class WelcomePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                MainView.ActiveViewIndex = 0;
                UsersGridView1.DataSource = new object[] { null };
                UsersGridView1.DataBind();
                AccessGridView1.DataSource = new object[] { null };
                AccessGridView1.DataBind();
            }
        }

        protected void welcome_Click(object sender, EventArgs e)
        {
            MainView.ActiveViewIndex = 0;
        }

        protected void MyProfile_Click(object sender, EventArgs e)
        {
            MainView.ActiveViewIndex = 1;
        }

        protected void Users_Click(object sender, EventArgs e)
        {
            MainView.ActiveViewIndex = 2;
        }

        protected void AccessRequest_Click(object sender, EventArgs e)
        {
            MainView.ActiveViewIndex = 3;
        }

        protected void Create_Click(object sender, EventArgs e)
        {
            
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddUser.aspx");
        }

        protected void View_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddUser.aspx");
        }
    }
}