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
        string usertype = null;
        protected void Page_Load(object sender, EventArgs e)
        { 
        
            if (Session["username"] == null)
            {
                username = null;
                usertype = null;
                Response.Redirect("Login.aspx");
            }
            else
            {
                username = (string)Session["username"];
                usertype = (string)Session["usertype"];
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
                            string strcreate = @"insert into users(username,usertype,emailaddress,password,confirmpassword,calendar,accesstype,department) 
                            values('" + addusername + "','"
                             + usertype + "','"
                            + txtadduseremail.Text.ToString() + "','"
                           
                            + txtadduserpswd.Text.ToString() + "','"
                            + txtaddusercnfrmpswd.Text.ToString() + "','"
                            + txt_adduser_calendar_selecteddate.Text.ToString() + "','"
                            + adduserDropDownaccesstype.Text.ToString() + "','"
                            + adduserDropDowndepartment.Text.ToString()  + "')";
                            cmd = new MySqlCommand(strcreate, conn);
                            if (cmd != null)
                            {
                                cmd.ExecuteNonQuery();
                            }
                            else
                            {
                                label_adduser_errormsg.Text = "Failed to insert users Table\n";
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
            }

        }

        protected void btnadduserCancel_Click(object sender, EventArgs e)
        {

            Response.Redirect("Welcome.aspx");
        }
    }
}