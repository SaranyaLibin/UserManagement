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
    public partial class EditUser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            viewUserdetails();
        }
        protected void viewUserdetails()
        {
            string datetime = null;
            string viewusername = (string)Session["viewusername"];
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;username=root;password=N!ved!tas0;database=usermanagement");
            try
            {
                conn.Open();
                if (conn != null)
                {
                    MySqlCommand cmd = new MySqlCommand();
                    string selectquery = @"SELECT user.*,reg.firstname ,
                    reg.lastname FROM  usermanagement.register reg INNER JOIN  usermanagement.users user ON  reg.username= user.username AND user.emailaddress='" + viewusername + "'";
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
                            //label_login_errmsg.Text = "Username does not exist!!!Click on SignUp to register\n";
                            //label_login_errmsg.Visible = true;
                        }
                        else
                        {
                            foreach (DataRow row in dt.Rows)
                            {
                                labelviewfnvalue.Text = row["firstname"].ToString();
                                labelviewln.Text = row["lastname"].ToString();
                                viewusernamevalue.Text = row["username"].ToString();
                                viewemailvalue.Text = row["emailaddress"].ToString();
                                viewaccesstypevalue.Text = row["accesstype"].ToString();
                                viewdeptvalue.Text = row["department"].ToString();
                                datetime = row["calendar"].ToString();
                                datetime = DateTime.Parse(datetime).ToString("yyyy-MM-dd");
                                viewcalendarvalue.Text = datetime;

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
                //label_login_errmsg.Text = ex.Message;
            }
            }
        }
    
}