﻿using System;
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
        string usertype = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            label_login_errmsg.Visible = false;
            if (!IsPostBack)
            {
                if (createSchema())
                {
                    label_login_errmsg.Text = "UserManagement Schema created successfully";
                    MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;username=root;password=N!ved!tas0;database=usermanagement");
                    if (createRegisterTable(conn))
                    {
                         label_login_errmsg.Text = "Database created successfully\n";
                    }

                    if (createuserstable(conn))
                    {
                         label_login_errmsg.Text = "Database created successfully\n";
                    }

                    if (createdepartmenttable(conn))
                    {
                        label_login_errmsg.Text = "Database created successfully\n";
                        if(insertdepartmenttable(conn))
                        {
                            label_login_errmsg.Text = "Department inserted successfully\n";
                        }

                    }

                   
                    if (createrequesttable(conn))
                    {
                        label_login_errmsg.Text = "Database created successfully\n";
                    }

                }
                else
                {
                    label_login_errmsg.Text = "Failed to create schema\n";
                }
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
                        string selectquery = null;
                        //string selectquery = @"SELECT * FROM usermanagement.register WHERE username = '" + username +"'  and password= '" + password + "'";
                        //string selectquery = @"SELECT * FROM usermanagement.register WHERE username = '" + username + "'";
                       if (username.Equals("admin@admin.com"))
                        {
                             selectquery = @"SELECT * FROM  usermanagement.register WHERE username = '" + username + "'";
                        }
                        else
                        {
                            selectquery = @"SELECT reg.*,user.accesstype FROM  usermanagement.register reg INNER JOIN  usermanagement.users user ON reg.username = user.username
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
                                        Session["username"] = username;
                                        if (username.Equals("admin@admin.com"))
                                        {
                                            usertype = "SuperUser";
                                        }
                                        else
                                        {
                                            string dbusertype = row["accesstype"].ToString();
                                            usertype = dbusertype;
                                        }
                                        Session["usertype"] = usertype;
                                        Response.Redirect("Welcome.aspx", false);
                                    }
                                    else
                                    {
                                        label_login_errmsg.Text = "Username or password is incorrect\n";
                                        label_login_errmsg.Visible = true;
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

        protected bool createuserstable(MySqlConnection conn)
        {
            try
            {
                conn.Open();
                if (conn != null)
                {
                    MySqlCommand cmd = new MySqlCommand();
                    string strcreateusertable = @"CREATE TABLE IF NOT EXISTS users (userid INT NOT NULL AUTO_INCREMENT,username varchar(50)
                    ,emailaddress varchar(50),password varchar(45) NOT NULL, confirmpassword varchar(45) NOT NULL, 
                    calendar date NOT NULL,accesstype varchar(45) NOT NULL,
                    department varchar(45) NOT NULL,PRIMARY KEY(emailaddress),KEY(userid),
                    UNIQUE KEY unique_username (username))";
                    cmd = new MySqlCommand(strcreateusertable, conn);
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

        protected bool createrequesttable(MySqlConnection conn)
        {
            try
            {
                if (conn.State == ConnectionState.Closed)
                {
                    conn.Open();
                }
             //   conn.Open();
                if (conn != null)
                {
                    MySqlCommand cmd = new MySqlCommand();
                    string strcreateusertable = @"CREATE TABLE IF NOT EXISTS request (requestid INT NOT NULL AUTO_INCREMENT,username varchar(50)
                    ,emailaddress varchar(50) NOT NULL,requeststatus varchar(50),PRIMARY KEY(emailaddress),KEY(requestid),
                    UNIQUE KEY unique_username (username))";
                    cmd = new MySqlCommand(strcreateusertable, conn);
                    if (cmd != null)
                    {
                        cmd.ExecuteNonQuery();
                    }
                    else
                    {
                        label_login_errmsg.Text = "Failed to create request Table\n";
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

        protected bool createdepartmenttable(MySqlConnection conn)
        {
            try
            {
                conn.Open();
                if (conn != null)
                {
                    MySqlCommand cmd = new MySqlCommand();
                    string strcreatedepttable = @"CREATE TABLE IF NOT EXISTS department (departmentid INT NOT NULL AUTO_INCREMENT,departmentname varchar(50)
                                                ,PRIMARY KEY(departmentid),
                                                CONSTRAINT dept_unique UNIQUE (departmentname))";
                    cmd = new MySqlCommand(strcreatedepttable, conn);
                    if (cmd != null)
                    {
                        cmd.ExecuteNonQuery();
                    }
                    else
                    {
                        label_login_errmsg.Text = "Failed to create Department Table\n";
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


        protected bool insertdepartmenttable(MySqlConnection conn)
        {
               try
                {
                    conn.Open();
                    if (conn != null)
                    {
                        MySqlCommand cmd = new MySqlCommand();
                        string strinsertdept = @"insert into department(departmentname) 
                        values('All'),('Electrical'),('Information Technology'),('Mechanical'),('Civil')";
                        cmd = new MySqlCommand(strinsertdept, conn);
                        if (cmd != null)
                        {
                            cmd.ExecuteNonQuery();
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

            return true;
        }

    }

}