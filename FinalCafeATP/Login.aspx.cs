using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalCafeATP
{    
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnbutton_Click(object sender, EventArgs e)
        {
            con.Close();

            SqlCommand sqlCommand = new SqlCommand("select * from Register where Contact=@contact and Password=@pass", con);
            sqlCommand.Parameters.AddWithValue("@contact", txtcontact.Text);
            sqlCommand.Parameters.AddWithValue("@pass", txtpass.Text);
            con.Open();
            SqlDataReader reader = sqlCommand.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                Session["username"] = reader.GetValue(1);
                Session["user"] = reader.GetValue(3);
                txtcontact.Text = "";
                txtpass.Text = "";
                if (Request.QueryString["type"] != null)
                {
                    if (Request.QueryString["type"] == "feedback")
                    {
                        Response.Redirect("Feedback.aspx");
                    }
                    else if (Request.QueryString["type"] == "menu")
                    {
                        Response.Redirect("Menu.aspx");
                    }
                    else if (Request.QueryString["type"] == "Beverages")
                    {
                        Response.Redirect("Beverages.aspx");
                    }
                    else if (Request.QueryString["type"] == "burger")
                    {
                        Response.Redirect("Burger.aspx");
                    }
                    else if (Request.QueryString["type"] == "sides")
                    {
                        Response.Redirect("Sides.aspx");
                    }
                    else if (Request.QueryString["type"] == "dessert")
                    {
                        Response.Redirect("Desserts.aspx");
                    }
                    

                }
                else
                {
                    Response.Redirect("Home.aspx");

                }

            }
            else
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Invalid Login..!','','error');", true);
            }
        }
    }
}