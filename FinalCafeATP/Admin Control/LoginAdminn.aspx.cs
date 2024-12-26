using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalCafeATP.Admin_Control
{
    public partial class LoginAdmin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnbutton_Click(object sender, EventArgs e)
        {
            con.Close();

            SqlCommand sqlCommand = new SqlCommand("select * from adminlogin where userid=@contact and password=@pass", con);
            sqlCommand.Parameters.AddWithValue("@contact", txtcontact.Text);
            sqlCommand.Parameters.AddWithValue("@pass", txtpass.Text);
            con.Open();
            SqlDataReader reader = sqlCommand.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                Session["user"] = reader.GetValue(1);
                txtcontact.Text = "";
                txtpass.Text = "";
                if (Request.QueryString["type"] != null)
                {
                    if (Request.QueryString["type"] == "access")
                    {
                        Response.Redirect("RegistrationAdminn.aspx");
                        Response.Redirect("BurgerAdmin.aspx");
                        Response.Redirect("ContactAmin.aspx");
                        Response.Redirect("FeedbackAdmin.aspx");
                        Response.Redirect("SpecialmenuAdmin.aspx");
                    }
                }
                else
                {
                    Response.Redirect("RegistrationAdminn.aspx");

                }

            }
            else
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Invalid Login..!','','error');", true);
            }
        }
    }
}