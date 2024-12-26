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
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnbutton_Click(object sender, EventArgs e)
        {
            con.Close();
            SqlCommand cmdcheck = new SqlCommand("select * from Register where contact=@contact", con);
            cmdcheck.Parameters.AddWithValue("@contact",txtcontact.Text);
            con.Open();
            SqlDataReader reader = cmdcheck.ExecuteReader();
            if (reader.HasRows)
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('This contact allrady taken','','warning');", true);

            }
            else
            {
                con.Close();

                SqlCommand cmd = new SqlCommand("insert into Register values (@name,@email,@contact,@pass,@dt)", con);
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@email", txtemail.Text);
                cmd.Parameters.AddWithValue("@contact", txtcontact.Text);
                cmd.Parameters.AddWithValue("@pass", txtpass.Text);
                cmd.Parameters.AddWithValue("@dt", DateTime.Now);

                con.Open();
                cmd.ExecuteNonQuery();

                txtname.Text = "";
                txtemail.Text = "";
                txtcontact.Text = "";
                txtpass.Text = "";
                txtcon.Text = "";
                Response.Write("<script>alert('You are registered successfully..!')</script>");
                //Response.Redirect("Login.aspx");
            }

        }
    }
}