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
    public partial class EditUser1 : System.Web.UI.Page
    {
        string editusername = null;
        protected void Page_Load(object sender, EventArgs e)
        {
                MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;username=root;password=N!ved!tas0;database=usermanagement");
                if (!string.IsNullOrEmpty(Request.QueryString["editusername"]))
                {
                    editusername = Request.QueryString["editusername"];
                }
                else
                {
                    //label_login_errmsg = "NO DATA PROVIDED OR COULD NOT BE READ";
                }

                try
                {
                    conn.Open();
                    if (conn != null)
                    {
                        MySqlCommand cmd = new MySqlCommand();
                        string selectquery = @"SELECT * FROM usermanagement.users WHERE emailaddress = '" + editusername + "'";
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
                                // label_login_errmsg.Text = "Username does not exist!!!Click on SignUp to register\n";
                                //label_login_errmsg.Visible = true;
                            }
                            else
                            {
                                foreach (DataRow row in dt.Rows)
                                {
                                    txteditusername.Text = row["username"].ToString();
                                    txteditusername.Enabled = false;
                                    txtedituseremail.Text = editusername;
                                    txtedituserpswd.Text = row["password"].ToString();
                                    txteditusercnfrmpswd.Text = row["confirmpassword"].ToString();
                                    txt_edituser_calendar_selecteddate.Text = row["calendar"].ToString();
                                    txtedituseraccesstype.Text = row["accesstype"].ToString();
                                    edituserDropDowndepartment.Text = row["department"].ToString();


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
                catch (Exception ex)
                {
                    //label_login_errmsg.Text = ex.Message;
                }
            

        }

        protected void btnedituserSave_Click(object sender, EventArgs e)
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
                        string selectquery = @"UPDATE usermanagement.users SET accesstype='" + txtedituseraccesstype.Text +
                                            "',emailaddress ='" + txtedituseremail.Text + 
                                            "',password ='" + txtedituserpswd.Text +
                                            "',confirmpassword ='" + txteditusercnfrmpswd.Text +
                                            "',calendar ='" + txt_edituser_calendar_selecteddate.Text +
                                             "',department ='" + edituserDropDowndepartment.Text +
                                              "' WHERE emailaddress ='" + editusername;
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

        protected void btnedituserCancel_Click(object sender, EventArgs e)
        {

        }
    }
}