using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

namespace UserManagement
{
    public partial class Login : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
                if (createSchema())
                {
                    //label_login_errmsg.Text = "UserManagement Schema created successfully";

                    MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;username=root;password=N!ved!tas0;database=usermanagement");
                    if (createRegisterTable(conn))
                    {
                       // label_login_errmsg.Text = "Database created successfully\n";
                     }
                }
                else
                {
                    label_login_errmsg.Text = "Failed to create schema\n";
                }
          
        }

        protected void btn_SignUp_Click(object sender, EventArgs e)
        {
           Response.Redirect("Register.aspx");
        }


        protected bool createSchema()
        {
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;username=root;password=N!ved!tas0");
            try
            {
                conn.Open();
                if (conn != null)
                {
                    MySqlCommand cmd = new MySqlCommand();
                    string strcreatedb = @"CREATE DATABASE IF NOT EXISTS usermanagement";
                    cmd = new MySqlCommand(strcreatedb, conn);
                    if (cmd != null)
                    {
                        cmd.ExecuteNonQuery();
                    }
                    else
                    {
                        label_login_errmsg.Text = "Failed to create Database\n";
                        label_login_errmsg.Visible = true;
                        return false;
                    }
                    
                }
                else
                {
                    label_login_errmsg.Text = "Failed to connect to Database\n";
                    label_login_errmsg.Visible = true;
                    return false;
                }

                conn.Close();
                return true;
            }
            catch (Exception ex)
            {
                label_login_errmsg.Text = ex.Message;
                return false;
            }

        }
        protected bool createRegisterTable(MySqlConnection conn)
        {
            try
            {
                conn.Open();
                if (conn != null)
                {
                    MySqlCommand cmd = new MySqlCommand();
                    string strcreate = @"CREATE TABLE IF NOT EXISTS register (id INT NOT NULL AUTO_INCREMENT,username varchar(50),
                    password varchar(45) NOT NULL, confirmpassword varchar(45) NOT NULL, 
                    firstname varchar(45) NOT NULL,lastname varchar(45) NOT NULL,
                    dateofbirth date NOT NULL,phonenumber varchar(45) NOT NULL,
                    address varchar(60) NOT NULL,PRIMARY KEY(username),KEY(id))";
                    cmd = new MySqlCommand(strcreate, conn);
                    if (cmd != null)
                    {
                        cmd.ExecuteNonQuery();
                    }
                    else
                    {
                        label_login_errmsg.Text = "Failed to create Users Table\n";
                        label_login_errmsg.Visible = true;
                        return false;
                    }
                }
                else
                {
                    label_login_errmsg.Text = "Failed to connect to Database\n";
                    label_login_errmsg.Visible = true;
                    return false;
                }
                conn.Close();
                return true;
            }
            catch (Exception ex)
            {
                label_login_errmsg.Text = ex.Message;
                return false;
            }
            

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;username=root;password=N!ved!tas0;database=usermanagement");
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
                        if (count == 0)
                        {
                            label_login_errmsg.Text = "Username does not exist!!!Click on SignUp to register\n";
                            label_login_errmsg.Visible = true;
                        }
                        else
                        {
                            foreach (DataRow row in dt.Rows)
                            {
                                string dbusername = row["username"].ToString();
                                string dbpassword = row["password"].ToString();
                                if (username.Equals(dbusername) && (password.Equals(dbpassword)))
                                {
                                    Response.Redirect("Welcome.aspx",false);
                                }
                                else
                                {

                                    label_login_errmsg.Text = "Username or password is incorrect\n";
                                }
                            }
                        }
                    }
                    
                    else
                    {
                        label_login_errmsg.Text = "Failed to insert register Table\n";
                    }
                }
                else
                {
                    label_login_errmsg.Text = "Failed to connect to Database\n";
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                label_login_errmsg.Text = ex.Message;
            }

        }
    }
    
}