using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalCafeATP
{
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                btn_sign.Visible = false;
                logout_btn.Text = "Logout";
            }
            else
            {
                btn_sign.Visible = true;
            }
        }

        protected void btn_contact_Click(object sender, EventArgs e)
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("insert into contact values (@name,@email,@contact,@message,@dt)", con);
            cmd.Parameters.AddWithValue("@name", txtname.Text);
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@contact", txtcontact.Text);
            cmd.Parameters.AddWithValue("@message", txtmsg.Text);
            cmd.Parameters.AddWithValue("@dt", DateTime.Now);
            con.Open();
            cmd.ExecuteNonQuery();

            txtname.Text = "";
            txtemail.Text = "";
            txtcontact.Text = "";
            txtmsg.Text = "";
            this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Enquiry Sent Successfully,Thank You..! We will contact you very soon..!','','success');", true);

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Contact.aspx");
        }
    }
}