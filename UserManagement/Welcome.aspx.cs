﻿using MySql.Data.MySqlClient;
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
        bool buttonclicked = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    username = null;
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    username = (string)Session["username"];
                    usertype = (string)Session["usertype"];
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
                        btnreqelevatedaccess.Visible = true;
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
            string username = (string)Session["username"];
            string usertype = (string)Session["usertype"];
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
                        selectquery = @"SELECT reg.*,user.department FROM  usermanagement.register reg INNER JOIN  usermanagement.users user ON reg.username = user.username
                        WHERE reg.username = '" + username + "'";
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
                                txtprofileAccessType.Text = usertype;
                                datetime = row["dateofbirth"].ToString();
                                datetime = DateTime.Parse(datetime).ToString("yyyy-MM-dd");
                                txtprofileCalendar.Text = datetime;
                                txtprofilepassword.Attributes["value"] = row["password"].ToString();
                                txtprofilefirstname.Text = row["firstname"].ToString();
                                txtprofilelastname.Text = row["lastname"].ToString();
                                txtprofilephoneno.Text = row["phonenumber"].ToString();
                                txtprofileaddress.Text = row["address"].ToString();
                                if (usertype.Equals("SuperUser"))
                                {

                                    txtprofileAccessType.Text = usertype;
                                    txtprofiledepartment.Visible = false;
                                    labelprofiledept.Visible = false;

                                }
                                else
                                {
                                    txtprofiledepartment.Text = row["department"].ToString();
                                    txtprofileAccessType.Text = usertype;
                                    txtprofiledepartment.Visible = true;
                                    labelprofiledept.Visible = true;
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
            string username = (string)Session["username"];
            Session["username"] = username;
            bool strbuttonclicked = buttonclicked;
            Session["buttonclicked"] = strbuttonclicked;
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
                    Response.Redirect("EditUser.aspx?editusername=" + editusername);
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
                    // string selectquery= @"SELECT user.emailaddress AS UserName,reg.firstname AS FirstName ,reg.lastname AS LastName,user.accesstype AS AccessType,user.department AS Department
                    // FROM  usermanagement.register reg INNER JOIN  usermanagement.users user ON  reg.username= user.username;";
                    //string selectquery = @"SELECT user.emailaddress AS UserName,reg.firstname AS FirstName ,reg.lastname AS LastName,user.accesstype AS AccessType,user.department AS Department
                    //FROM  usermanagement.register reg INNER JOIN  usermanagement.users user ON  reg.username= user.username WHERE CONCAT(user.emailaddress,reg.firstname ,reg.lastname,user.accesstype,user.department ) 
                    //like '" + valuetoSearch + "%'";
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
            buttonclicked = true;
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
    }
}