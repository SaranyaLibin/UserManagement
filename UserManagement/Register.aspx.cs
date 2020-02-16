using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;
namespace UserManagement
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            register_calendar.Visible = false;
        }

        protected void btn_register_Click(object sender, EventArgs e)
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
                        string strcreate = @"insert into register(username,password,confirmpassword,firstname,lastname,dateofbirth,phonenumber,address) 
                          values('" + txt_register_emailaddress.Text.ToString() + "','"
                            + txt_register_pswd.Text.ToString() + "','"
                            + txt_register_confirmpswd.Text.ToString() + "','"
                            + txt_register_first_name.Text.ToString() + "'" + ",'"
                            + txt_register_last_name.Text.ToString() + "','"
                            + txt_calendar_selecteddate.Text.ToString() + "','"
                            + txt_register_phno.Text.ToString() + "','"
                            + txt_register_address.Text.ToString() + "')";
                        cmd = new MySqlCommand(strcreate, conn);
                        if (cmd != null)
                        {
                            cmd.ExecuteNonQuery();
                        }
                        else
                        {

                            labelreg_errormsg.Text = "Failed to insert register Table\n";
                        }
                    }
                    else
                    {
                        labelreg_errormsg.Text = "Failed to connect to Database\n";
                    }
                    conn.Close();
                }
                catch (Exception ex)
                {
                    labelreg_errormsg.Text = ex.Message;
                }
            }
            else
            {

            }

        }

        protected void CalendarSelectionChanged(object sender, EventArgs e)
        {
            txt_calendar_selecteddate.Text = register_calendar.SelectedDate.ToString("yyyy/MM/dd");
         }

        protected void imagebtn_calendar_Click(object sender, ImageClickEventArgs e)
        {
            register_calendar.Visible = true;
        }
    }
}