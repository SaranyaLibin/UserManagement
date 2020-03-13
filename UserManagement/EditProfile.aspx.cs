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
    public partial class EditProfile : System.Web.UI.Page
    {
        string username = null;
        string usertype = null;
        string datetime = null;
        protected void Page_Load(object sender, EventArgs e)
        {
             username = (string)Session["username"];
             usertype = (string)Session["usertype"];
             datetime = null;
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;username=root;password=N!ved!tas0;database=usermanagement");
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
                        try
                        {
                            conn.Open();
                            if (conn != null)
                            {
                                MySqlCommand cmd = new MySqlCommand();
                                string selectquery = null;
                                if (usertype.Equals("SuperUser"))
                                {
                                    selectquery = @"SELECT * FROM  usermanagement.register WHERE username = '" + username + "'";
                                }
                                else
                                {
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
                                            txteditprofileemail.Text = username;
                                            txteditprofileemail.Enabled = false;
                                            datetime = row["dateofbirth"].ToString();
                                            datetime = DateTime.Parse(datetime).ToString("yyyy-MM-dd");
                                            txteditprofileCalendar.Text = datetime;
                                            txteditprofilepassword.Attributes["value"] = row["password"].ToString();
                                            txteditprofileconfrmpswd.Attributes["value"] = row["confirmpassword"].ToString();
                                            txteditprofilefirstname.Text = row["firstname"].ToString();
                                            txteditprofilelastname.Text = row["lastname"].ToString();
                                            txteditprofilephoneno.Text = row["phonenumber"].ToString();
                                            txteditprofileaddress.Text = row["address"].ToString();

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

                    }
                }


                }

        protected void btnprofileSave_Click(object sender, EventArgs e)
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
                        string selectquery = @"UPDATE usermanagement.register reg SET reg.firstname='" + txteditprofilefirstname.Text +
                                            "',reg.lastname ='" + txteditprofilelastname.Text +
                                            "',reg.password ='" + txteditprofilepassword.Text +
                                            "',reg.confirmpassword ='" + txteditprofileconfrmpswd.Text +
                                            "',reg.dateofbirth ='" + txteditprofileCalendar.Text +
                                             "',reg.phonenumber ='" + txteditprofilephoneno.Text +
                                              "',reg.address ='" + txteditprofileaddress.Text +
                                              "' WHERE reg.username ='" + username + "'"; 
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

        protected void btnprofilecancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Welcome.aspx");
        }
    }
}
