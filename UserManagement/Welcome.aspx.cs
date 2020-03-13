using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UserManagement
{
    public partial class WelcomePage : System.Web.UI.Page
    {
        string username = null;
        string usertype = null;
      
        protected void Page_Load(object sender, EventArgs e)
        {
            username = (string)Session["username"];
            usertype = (string)Session["usertype"];
            if (!IsPostBack)
            {
                if ((username == null) || (usertype == null))
                {
                    username = null;
                    usertype = null;
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    
                    labelwelcome.Text = "Welcome " + username;
                    labelwelcome.Visible = true;
                    welcome.Visible = false;
                    myprofile.Visible = false;
                    users.Visible = false;
                    accessrequest.Visible = false;
                    if (usertype.Equals("SuperUser"))
                    {
                        welcome.Visible = true;
                        myprofile.Visible = true;
                        users.Visible = true;
                        accessrequest.Visible = true;
                        btnreqelevatedaccess.Visible = false;

                    }
                    else if (usertype.Equals("ElevatedAccessUser"))
                    {
                        welcome.Visible = true;
                        myprofile.Visible = true;
                        users.Visible = true;
                        btnreqelevatedaccess.Visible = false;
                        Create.Visible = false;
                        Delete.Visible = false;
                        //view information of only regular users(disable users in gridview if
                        //accesstype=ELevatedacccessuser

                    }
                    else
                    {
                        //regularuser
                        //update register while updating request status
                        welcome.Visible = true;
                        myprofile.Visible = true;
                        Create.Visible = false;
                        Delete.Visible = false;
                       

                    }

                    populateuserdetails(null);
                    populaterequestdetails(null);
                    populatedepartment();
                }
                MainView.ActiveViewIndex = 0;
            }
           
        }

        protected void welcome_Click(object sender, EventArgs e)
        {

            if (Session != null)
            {
                string username = Session["username"].ToString();
                labelwelcome.Text = "Welcome " + username;
                labelwelcome.Visible = true;
                MainView.ActiveViewIndex = 0;
            }
        }

        protected void MyProfile_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;username=root;password=N!ved!tas0;database=usermanagement");
            string datetime = null;
            try
            {
                conn.Open();
                if (conn != null)
                {
                    MySqlCommand cmd = new MySqlCommand();
                    string selectquery = null;
                    //string selectquery = @"SELECT * FROM usermanagement.register WHERE username = '" + username + "'";
                    if (usertype.Equals("SuperUser"))
                    {
                         selectquery = @"SELECT * FROM  usermanagement.register WHERE username = '" + username + "'";
                    }
                    else
                    {
                        //selectquery = @"SELECT reg.*,user.department FROM  usermanagement.register reg INNER JOIN  usermanagement.users user ON reg.username = user.username
                        //WHERE reg.username = '" + username + "'";
                        selectquery = @"SELECT reg.*,user.department ,req.requeststatus 
                        FROM  usermanagement.register reg INNER JOIN  usermanagement.users user ON  reg.username= user.username
                        INNER JOIN  usermanagement.request req ON req.emailaddress= user.emailaddress WHERE reg.username ='" + username + "'";
                    }
                    cmd = new MySqlCommand(selectquery, conn);
                    if (cmd != null)
                    {
                        cmd.ExecuteNonQuery();
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        int count = dt.Rows.Count;
                        if (count == 1)
                        {
                            foreach (DataRow row in dt.Rows)
                            {
                                txtprofileemail.Text = username;
                                txtprofileemail.Enabled = false;
                                txtprofileAccessType.Text = usertype;
                                txtprofileAccessType.Enabled = false;
                                datetime = row["dateofbirth"].ToString();
                                datetime = DateTime.Parse(datetime).ToString("yyyy-MM-dd");
                                txtprofileCalendar.Text = datetime;
                                txtprofileCalendar.Enabled = false;
                                txtprofilepassword.Attributes["value"] = row["password"].ToString();
                                txtprofilepassword.Enabled = false;
                                txtprofilefirstname.Text = row["firstname"].ToString();
                                txtprofilefirstname.Enabled = false;
                                txtprofilelastname.Text = row["lastname"].ToString();
                                txtprofilelastname.Enabled = false;
                                txtprofilephoneno.Text = row["phonenumber"].ToString();
                                txtprofilephoneno.Enabled = false;
                                txtprofileaddress.Text = row["address"].ToString();
                                txtprofileaddress.Enabled = false;
                                if (usertype.Equals("SuperUser"))
                                {
                                    txtprofileAccessType.Text = usertype;
                                    txtprofileAccessType.Enabled = false;
                                    txtprofiledepartment.Visible = false;
                                    labelprofiledept.Visible = false;

                                }
                                else
                                {
                                    string reqstatus = null;
                                    reqstatus = row["requeststatus"].ToString();
                                    if (usertype.Equals("RegularUser"))
                                    {
                                        if (reqstatus.Equals("Approved"))
                                        {
                                            btnreqelevatedaccess.Visible = false;
                                        }
                                        else
                                        {
                                            btnreqelevatedaccess.Visible = true;
                                        }
                                    }
                                    txtprofiledepartment.Text = row["department"].ToString();
                                    labelmyprofilereqstatus.Text = "Access request is " + reqstatus;
                                    labelmyprofilereqstatus.Visible = true;
                                    txtprofileAccessType.Text = usertype;
                                    txtprofileAccessType.Enabled = false;
                                    //visible except superuser
                                    labelprofiledept.Visible = true;
                                    txtprofiledepartment.Visible = true;
                                    txtprofiledepartment.Enabled = false;
                                }
                               
                            }
                        }
                    }
                    else
                    {
                        //label_login_errmsg.Text = "Failed to connect to Database\n";
                    }
                    conn.Close();
                }
            }
            catch (Exception ex)
            {
                // label_login_errmsg.Text = ex.Message;
            }
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
            Session["username"] = username;
            Response.Redirect("AddUser.aspx");

        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow item in UsersGridView1.Rows)
            { 
                CheckBox chkbox = (CheckBox)item.FindControl("UsersCheckBox1");
                if (chkbox.Checked)
                {
                    //Do stuff
                    string editusername = item.Cells[2].Text;
                    Session["editusername"] = editusername;
                    Response.Redirect("EditUser.aspx");
                }
                else
                {
                    //label_adduser_errormsg.Text = "Please select to display the user\n";
                }
            }


        }

        protected void View_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow item in UsersGridView1.Rows)
            {
                CheckBox chkbox = (CheckBox)item.FindControl("UsersCheckBox1");
                if (chkbox.Checked)
                {
                    //Do stuff
                    string viewusername = item.Cells[2].Text;
                    Session["viewusername"] = viewusername;
                    Response.Redirect("ViewUser.aspx?viewusername=" + viewusername);
                }
                else
                {
                    //label_adduser_errormsg.Text = "Please select to display the user\n";
                }
            }
        }

        protected void welcomeLogOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("Login.aspx");
        }

        protected bool populateuserdetails(string sortExpression = null)
        {
            string lstdeptdropdown = null;
            if (DropDownListUserDept.Text.ToString().Equals("All"))
            {
                lstdeptdropdown = "";
            }
            else
            {
                lstdeptdropdown = DropDownListUserDept.Text.ToString();
            }

            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;username=root;password=N!ved!tas0;database=usermanagement");
            try
            {
                conn.Open();
                if (conn != null)
                {
                    MySqlCommand cmd = new MySqlCommand();
                    string query = @"SELECT user.emailaddress AS UserName,reg.firstname AS FirstName ,reg.lastname AS LastName,user.accesstype AS AccessType,user.department AS Department
                    FROM  usermanagement.register reg INNER JOIN  usermanagement.users user ON  reg.username= user.username";
                    query += " WHERE user.department LIKE '%" + lstdeptdropdown + "%'";
                    query += " AND (user.emailaddress LIKE '%" + txtSearch.Text + "%'";
                    query += " OR reg.firstname LIKE '%" + txtSearch.Text + "%'";
                    query += " OR reg.lastname LIKE '%" + txtSearch.Text + "%'";
                    query += " OR user.accesstype LIKE '%" + txtSearch.Text + "%'";
                    query += " OR user.department LIKE '%" + txtSearch.Text + "%')";
                    cmd = new MySqlCommand(query, conn);
                    if (cmd != null)
                    {
                        cmd.ExecuteNonQuery();
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        int count = dt.Rows.Count;
                        if (count == 0)
                        {
                            // label_errormsg.Text = "NO user data!!!\n";
                            DataTable emptydt = new DataTable();
                            UsersGridView1.DataSource = emptydt;
                            UsersGridView1.DataBind();
                        }
                        else
                        {
                                if (sortExpression != null)
                                {
                                    DataView dv = dt.AsDataView();
                                    this.SortDirection = this.SortDirection == "ASC" ? "DESC" : "ASC";
                                    dv.Sort = sortExpression + " " + this.SortDirection;
                                    UsersGridView1.DataSource = dv;
                                    UsersGridView1.DataBind();
                                }
                                else
                                {
                                    UsersGridView1.DataSource = dt;
                                    UsersGridView1.DataBind();
                                }
                            
                        }
                    }
                    else
                    {
                        //label_adduser_errormsg.Text = "Failed to insert users table\n";
                    }
                }
                else
                {
                   // label_adduser_errormsg.Text = "Failed to connect to Database\n";
                }
                conn.Close();
            }
            catch (Exception ex)
            {
               // label_adduser_errormsg.Text = ex.Message;
            }

            return true;
        }



        protected void OnSorting(object sender, GridViewSortEventArgs e)
        {
            populateuserdetails( e.SortExpression);
        }
        protected bool populatedepartment()
        {
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;username=root;password=N!ved!tas0;database=usermanagement");
            try
            {
                conn.Open();
                if (conn != null)
                {
                    MySqlCommand cmd = new MySqlCommand();
                    string selectquery = @"SELECT * FROM usermanagement.department ";
                    cmd = new MySqlCommand(selectquery, conn);
                    if (cmd != null)
                    {
                        cmd.ExecuteNonQuery();
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        int count = dt.Rows.Count;
                        if (count == 0)
                        {
                            // label_errormsg.Text = "NO user data!!!\n";
                            DropDownListUserDept.DataSource = new object[] { null };
                            DropDownListUserDept.DataBind();
                        }
                        else
                        {
                            DropDownListUserDept.DataSource = dt;
                            DropDownListUserDept.DataTextField  = "departmentname";
                            DropDownListUserDept.DataValueField = "departmentname";
                            DropDownListUserDept.DataBind();

                            AccessDropDownList.DataSource = dt;
                            AccessDropDownList.DataTextField = "departmentname";
                            AccessDropDownList.DataValueField = "departmentname";
                            AccessDropDownList.DataBind();

                        }
                    }
                    else
                    {
                        //label_adduser_errormsg.Text = "Failed to insert users table\n";
                    }
                }
                else
                {
                    // label_adduser_errormsg.Text = "Failed to connect to Database\n";
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                // label_adduser_errormsg.Text = ex.Message;
            }

            return true;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            populateuserdetails( null);
        }

        protected void DropDownListUserDept_SelectedIndexChanged(object sender, EventArgs e)
        {
            populateuserdetails(null);
        }

        protected void btnreqelevatedaccess_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;username=root;password=N!ved!tas0;database=usermanagement");
            if (Page.IsValid)
            {
                try
                {
                    conn.Open();
                    if (conn != null)
                    {
                        MySqlCommand cmd = new MySqlCommand();
                        string selectquery = @"UPDATE usermanagement.request SET requeststatus = 'Active' WHERE username ='" + txtprofileemail.Text.ToString() + "'";
                        cmd = new MySqlCommand(selectquery, conn);
                        if (cmd != null)
                        {
                            cmd.ExecuteNonQuery();
                        }
                    }
                    else
                    {
                        //label_login_errmsg.Text = "Failed to connect to Database\n";
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    //label_login_errmsg.Text = ex.Message;
                }
            
        }
    }

         protected bool populaterequestdetails(string sortExpression = null)
        {
            string lstdeptdropdown = null;
            if (AccessDropDownList.Text.ToString().Equals("All"))
            {
                lstdeptdropdown = "";
            }
            else
            {
                lstdeptdropdown = AccessDropDownList.Text.ToString();
            }

            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;username=root;password=N!ved!tas0;database=usermanagement");
            try
            {
                conn.Open();
                if (conn != null)
                {
                    MySqlCommand cmd = new MySqlCommand();
                    string query = @"SELECT user.emailaddress AS UserName,reg.firstname AS FirstName ,reg.lastname AS LastName,user.department AS Department,
                    req.requeststatus AS RequestStatus FROM  usermanagement.register reg INNER JOIN  usermanagement.users user ON  reg.username= user.username
                     INNER JOIN  usermanagement.request req ON req.emailaddress= user.emailaddress";
                    query += " WHERE user.department LIKE '%" + lstdeptdropdown + "%'";
                    query += " AND (req.emailaddress LIKE '%" + txtaccessSearch.Text + "%'";
                    query += " OR reg.firstname LIKE '%" + txtaccessSearch.Text + "%'";
                    query += " OR reg.lastname LIKE '%" + txtaccessSearch.Text + "%'";
                    query += " OR req.requeststatus LIKE '%" + txtaccessSearch.Text + "%'";
                    query += " OR user.department LIKE '%" + txtaccessSearch.Text + "%')";
                    cmd = new MySqlCommand(query, conn);
                    if (cmd != null)
                    {
                        cmd.ExecuteNonQuery();
                        MySqlDataAdapter da = new MySqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        int count = dt.Rows.Count;
                        if (count == 0)
                        {
                            // label_errormsg.Text = "NO req data!!!\n";
                            DataTable emptydt = new DataTable();
                            AccessGridView1.DataSource = emptydt;
                            AccessGridView1.DataBind();
                        }
                        else
                        {
                            if (sortExpression != null)
                            {
                                DataView dv = dt.AsDataView();
                                this.SortDirection = this.SortDirection == "ASC" ? "DESC" : "ASC";
                                dv.Sort = sortExpression + " " + this.SortDirection;
                                AccessGridView1.DataSource = dv;
                                AccessGridView1.DataBind();
                            }
                            else
                            {
                                AccessGridView1.DataSource = dt;
                                AccessGridView1.DataBind();
                            }


                        }
                    }
                    else
                    {
                        //label_adduser_errormsg.Text = "Failed to insert users table\n";
                    }
                }
                else
                {
                    // label_adduser_errormsg.Text = "Failed to connect to Database\n";
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                // label_adduser_errormsg.Text = ex.Message;
            }

            return true;
        }

        private string SortDirection
        {
            get { return ViewState["SortDirection"] != null ? ViewState["SortDirection"].ToString() : "ASC"; }
            set { ViewState["SortDirection"] = value; }
        }

        protected void AccessDropDownList_SelectedIndexChanged(object sender, EventArgs e)
        {
            populaterequestdetails(null);
        }

        protected void AccessGridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            populaterequestdetails(e.SortExpression);
        }

        protected void btnaccessSearch_Click1(object sender, EventArgs e)
        {
            populaterequestdetails(null);
        }

        protected void Approve_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;username=root;password=N!ved!tas0;database=usermanagement");
            foreach (GridViewRow item in AccessGridView1.Rows)
            {
                CheckBox chkbox = (CheckBox)item.FindControl("AccessCheckBox1");
                if (chkbox.Checked)
                {
                    //Do stuff
                    string approveusername = item.Cells[2].Text;
                    string requeststatus = item.Cells[6].Text;
                    if (requeststatus.Equals("Active"))
                    {
                        try
                        {
                            conn.Open();
                            if (conn != null)
                            {
                                MySqlCommand cmd = new MySqlCommand();
                                string updatequery = @"UPDATE usermanagement.users INNER JOIN usermanagement.request ON usermanagement.users.emailaddress = usermanagement.request.emailaddress
                            SET usermanagement.users.accesstype = 'ElevatedAccessUser', usermanagement.request.requeststatus = 'Approved'
                            WHERE usermanagement.users.emailaddress ='" + approveusername + "'";
                                cmd = new MySqlCommand(updatequery, conn);
                                if (cmd != null)
                                {
                                    cmd.ExecuteNonQuery();
                                }
                            }
                            else
                            {
                                //label_login_errmsg.Text = "Failed to connect to Database\n";
                            }
                            populaterequestdetails(null);
                            conn.Close();
                        }
                        catch (Exception ex)
                        {
                            //label_login_errmsg.Text = ex.Message;
                        }
                    }
                    else
                    {
                        //label_adduser_errormsg.Text = "Please select to display the user\n";
                    }
                }
                else
                {
                   // label_adduser_errormsg.Text = "User didnt request";
                }
            }
        
    }

        protected void Decline_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;username=root;password=N!ved!tas0;database=usermanagement");
            foreach (GridViewRow item in AccessGridView1.Rows)
            {
                CheckBox chkbox = (CheckBox)item.FindControl("AccessCheckBox1");
                if (chkbox.Checked)
                {
                    //Do stuff
                    string declineusername = item.Cells[2].Text;
                    string requeststatus = item.Cells[6].Text;
                    if (requeststatus.Equals("Active"))
                    {
                        //check status is active
                        try
                        {
                            conn.Open();
                            if (conn != null)
                            {
                                MySqlCommand cmd = new MySqlCommand();
                                string updatequery = @"UPDATE usermanagement.request SET requeststatus = 'Declined' WHERE emailaddress ='" + declineusername + "'";
                                cmd = new MySqlCommand(updatequery, conn);
                                if (cmd != null)
                                {
                                    cmd.ExecuteNonQuery();
                                }
                            }
                            else
                            {
                                //label_login_errmsg.Text = "Failed to connect to Database\n";
                            }
                            populaterequestdetails(null);
                            conn.Close();
                        }
                        catch (Exception ex)
                        {
                            //label_login_errmsg.Text = ex.Message;
                        }
                    }
                    else
                    {
                        //label_adduser_errormsg.Text = "Please select to display the user\n";
                    }
                }
                else
                {
                    //label_adduser_errormsg.Text = "Can't Decline !!! Not requested yet\n";

                }
            }

        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;username=root;password=N!ved!tas0;database=usermanagement");
            foreach (GridViewRow item in UsersGridView1.Rows)
            {
                CheckBox chkbox = (CheckBox)item.FindControl("UsersCheckBox1");
                if (chkbox.Checked)
                {
                    //Do stuff
                    //check status is active....
                    string deleteusername = item.Cells[2].Text;
                    try
                    {
                        conn.Open();
                        if (conn != null)
                        {
                            MySqlCommand cmd = new MySqlCommand();
                            string selectquery = @"DELETE usermanagement.users, usermanagement.request
                            FROM usermanagement.users 
                            INNER JOIN usermanagement.request ON usermanagement.users.emailaddress = usermanagement.request.emailaddress
                            WHERE usermanagement.users.emailaddress ='" + deleteusername + "'";
                            cmd = new MySqlCommand(selectquery, conn);
                            if (cmd != null)
                            {
                                cmd.ExecuteNonQuery();
                            }
                        }
                        else
                        {
                            //label_login_errmsg.Text = "Failed to connect to Database\n";
                        }
                        populateuserdetails(null);
                        conn.Close();
                    }
                    catch (Exception ex)
                    {
                        //label_login_errmsg.Text = ex.Message;
                    }
                }
                else
                {
                    //label_adduser_errormsg.Text = "Please select to display the user\n";
                }
            }

        }

        protected void btnEditprofile_Click(object sender, EventArgs e)
        {
            string editusername = txtprofileemail.Text.ToString();
            Session["editusername"] = editusername;
            Response.Redirect("EditProfile.aspx");
        }

        protected void UsersGridView1_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                foreach (TableCell tc in e.Row.Cells)
                {
                    if (tc.HasControls())
                    {
                        LinkButton lb = (LinkButton)tc.Controls[0];
                        if (lb != null)
                        {
                            Image icon = new Image();
                            if(UsersGridView1.SortDirection.ToString().Equals(SortDirection))
                            {
                                icon.ImageUrl = "~/Images/down_arrow.png";
                            }
                            else
                            {
                                icon.ImageUrl = "~/Images/up_arrow.png";
                            }
                            tc.Controls.Add(new LiteralControl(" "));
                            tc.Controls.Add(icon);

                        }
                    }
                }
            }
        }
    }
}