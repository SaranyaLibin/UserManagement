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
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = null;
            if (Session["username"] == null)
            {
                username = null;
                Response.Redirect("Login.aspx");
            }
            else
            {
                username = (string)Session["username"];
                MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;username=root;password=N!ved!tas0;database=usermanagement");
                if (Page.IsValid)
                {
                    try
                    {
                        conn.Open();
                        if (conn != null)
                        {
                            MySqlCommand cmd = new MySqlCommand();
                            string username = txt_login_username.Text.ToString();
                            string password = txt_login_password.Text.ToString();
                            //string selectquery = @"SELECT * FROM usermanagement.register WHERE username = '" + username +"'  and password= '" + password + "'";
                            string selectquery = @"SELECT * FROM usermanagement.register WHERE username = '" + username + "'";
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
                                    label_adduser_errormsg.Text = "User already exist!!!\n";
                                    label_adduser_errormsg.Visible = true;
                                }
                                else
                                {
                                    string strcreate = @"insert into users(username,password,confirmpassword,firstname,lastname,dateofbirth,accesstype,phonenumber,department,address) 
                                    values('" + txtadduseremail.Text.ToString() + "','"
                                       + txtadduserpswd.Text.ToString() + "','"
                                       + txtaddusercnfrmpswd.Text.ToString() + "','"
                                       + txtdduserfirstname.Text.ToString() + "'" + ",'"
                                       + txtadduserlastname.Text.ToString() + "','"
                                       + txt_calendar_selecteddate.Text.ToString() + "','"
                                       + adduserDropDownaccesstype.Text.ToString() + "','"
                                       + txtadduserphno.Text.ToString() + "','"
                                       + adduserDropDowndepartment.Text.ToString() + "','"
                                       + txtadduseraddress.Text.ToString() + "')";
                                        cmd = new MySqlCommand(strcreate, conn);
                                        if (cmd != null)
                                        {
                                            cmd.ExecuteNonQuery();
                                        }
                                        else
                                        {
                                            label_adduser_errormsg.Text = "Failed to insert register Table\n";
                                        }
                                }
                            }

                            else
                            {
                                label_adduser_errormsg.Text = "Failed to insert register Table\n";
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

            }
        }
}