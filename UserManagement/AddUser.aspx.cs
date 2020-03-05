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
    public partial class AddUser : System.Web.UI.Page
    {
        string username = null;
        protected void Page_Load(object sender, EventArgs e)
        { 
        
            if (Session["username"] == null)
            {
                username = null;
                Response.Redirect("Login.aspx");
            }
            else
            {
                username = (string)Session["username"];
            }
        }

        protected void btnadduserSave_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;username=root;password=N!ved!tas0;database=usermanagement");
            try
            {
                conn.Open();
                if (conn != null)
                {
                    MySqlCommand cmd = new MySqlCommand();
                    MySqlCommand cmduser = new MySqlCommand();
                    MySqlCommand cmdrequest = new MySqlCommand();
                    string addusername = txtaddusername.Text.ToString();
                    string adduseremail = txtadduseremail.Text.ToString();
                    string selectquery = @"SELECT * FROM usermanagement.register WHERE username = '" + addusername + "'";
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
                            label_adduser_errormsg.Text = "User doesnot have account!!!\n";
                            label_adduser_errormsg.Visible = true;
                        }
                        else
                        {
                            string strinsertuser = @"insert into users(username,emailaddress,password,confirmpassword,calendar,accesstype,department) 
                            values('" + addusername + "','"
                            + txtadduseremail.Text.ToString() + "','"
                            + txtadduserpswd.Text.ToString() + "','"
                            + txtaddusercnfrmpswd.Text.ToString() + "','"
                            + txt_adduser_calendar_selecteddate.Text.ToString() + "','"
                            + adduserDropDownaccesstype.Text.ToString() + "','"
                            + adduserDropDowndepartment.Text.ToString()  + "')";
                            cmduser = new MySqlCommand(strinsertuser, conn);
                            if (cmduser != null)
                            {
                                cmduser.ExecuteNonQuery();
                            }
                            else
                            {
                                label_adduser_errormsg.Text = "Failed to insert request Table\n";
                            }
                           // bool clicked = (bool)Session["buttonclicked"];
                            string reqstatus = null;
                            /*if (clicked)
                            {
                                reqstatus = "Active";
                            }
                            else
                            {*/
                                reqstatus = "NA";
                           // }
                        
                            string strinserteq = @"insert into request(username,emailaddress,requeststatus) 
                            values('" + addusername + "','"
                            + txtadduseremail.Text.ToString() + "','"
                            + reqstatus + "')";
                            cmdrequest = new MySqlCommand(strinserteq, conn);
                            if (cmdrequest != null)
                            {
                                cmdrequest.ExecuteNonQuery();
                            }
                            else
                            {
                                label_adduser_errormsg.Text = "Failed to insert request Table\n";
                            }
                        }
                    }
                    else
                    {
                        label_adduser_errormsg.Text = "Failed to insert users table\n";
                    }
                }
                else
                {
                    label_adduser_errormsg.Text = "Failed to connect to Database\n";
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                label_adduser_errormsg.Text = ex.Message;
                label_adduser_errormsg.Visible = true;
            }

        }

        protected void btnadduserCancel_Click(object sender, EventArgs e)
        {

            Response.Redirect("Welcome.aspx");
        }
    }
}