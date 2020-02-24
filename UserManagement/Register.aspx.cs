using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data;
using MySql.Data.MySqlClient;
using BotDetect.Web.Mvc;

namespace UserManagement
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                register_calendar.Visible = false;
                
            }
        }

        protected void btn_register_Click(object sender, EventArgs e)
        {
            MySqlConnection conn = new MySqlConnection("datasource=localhost;port=3306;username=root;password=N!ved!tas0;database=usermanagement");
            bool isHuman = captchaBox.Validate(txtCaptcha.Text);
            txtCaptcha.Text = null; // clear previous user input
            string usertype = null;
            string username = txt_register_emailaddress.Text.ToString();
            if ((Page.IsValid) && (isHuman))
            {
                    try
                    {
                        conn.Open();
                        if (conn != null)
                        {
                            MySqlCommand cmd = new MySqlCommand();
                            if(username.Equals("admin@admin.com"))
                            {
                                usertype = "SuperUser";
                            }
                            else
                            {
                                usertype = "RegularUser";
                            }
                    string strcreate = @"insert into register(username,usertype,password,confirmpassword,firstname,lastname,dateofbirth,phonenumber,address) 
                    values('" + txt_register_emailaddress.Text.ToString() + "','"
                        + usertype + "','"
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
                                label_error_register.Text = "Failed to insert register Table\n";
                            }
                        }
                        else
                        {
                            label_error_register.Text = "Failed to connect to Database\n";
                        }
                        conn.Close();
                    }
                    catch (Exception ex)
                    {
                        label_error_register.Text = ex.Message;
                    }
                }
                if(!isHuman)
                {
                    label_error_register.Text = "Error occured:Invalid value entered for Captcha!!Please try again";
                    label_error_register.Visible = true;
                }
                else
                {
                    // TODO: captcha validation succeeded; execute the protected action
                    MvcCaptcha.ResetCaptcha("captchaBox");
                    label_error_register.Visible = false;
                }
        }
        protected void CalendarSelectionChanged(object sender, EventArgs e)
        {
            txt_calendar_selecteddate.Text = register_calendar.SelectedDate.ToString("yyyy/MM/dd");
            register_calendar.Visible = false;
        }

        protected void imagebtn_calendar_Click(object sender, ImageClickEventArgs e)
        {
                  register_calendar.Visible = true;
        }
    }
}