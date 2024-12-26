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
    public partial class Feedback : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                menushow();
            }

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

        protected void menushow()
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("select * from feedback", con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {
                    Mmenus.Text += "<div class='col-md-6 col-lg-4'><div class='services-item bg-light fe-1'><div style='padding: 1rem !important;'><div><div class='testimonial-item border p-4'><div class='d-flex align-items-center'><div class=''><img src = 'images/Proflie.png' alt=''></div><div class='ms-4'><h4 class='text-secondary'>" + reader.GetValue(1) + "</h4><div class='d-flex pe-5'><i class='fas fa-star me-1 text-primary'></i><i class='fas fa-star me-1 text-primary'></i><i class='fas fa-star me-1 text-primary'></i><i class='fas fa-star me-1 text-primary'></i><i class='fas fa-star me-1 text-primary'></i></div></div></div><div class='border-top mt-4 pt-3 bq-1'><p class='mb-0' style='height:130px;'>" + reader.GetValue(2) + "</p></div><a href='" + reader.GetValue(3) + "'><img src = '" + reader.GetValue(3) + "' style='width: 100%; height: 400px;' alt=''></a></div></div></div></div></div>";
                }
            }
        }

        protected void btnbutton_Click(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                foreach (var files in file.PostedFiles)
                {
                    string ex = System.IO.Path.GetFileName(files.FileName);
                    Guid g = Guid.NewGuid();
                    string imgName = g + ex;
                    string pathimg = "Feedbackphotos/" + imgName;
                    //saving original img
                    files.SaveAs(Server.MapPath(pathimg));


                    con.Close();
                    SqlCommand cmd = new SqlCommand("insert into feedback values (@name,@message,@photos,@dt)", con);
                    cmd.Parameters.AddWithValue("@name", txtname.Text);
                    cmd.Parameters.AddWithValue("@message", txtmsg.Text);
                    cmd.Parameters.AddWithValue("@photos","../"+ pathimg);
                    cmd.Parameters.AddWithValue("@dt", DateTime.Now);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    Mmenus.Text = "";
                    menushow();

                    txtname.Text = "";
                    txtmsg.Text = "";
                    this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Upload Successfully,Thank You..!','','success');", true);

                }
            }
            else
            {
                //this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Please Login First,Thank You..!','','warning');", true);
                Response.Redirect("Login.aspx?type=feedback");
            }
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("Feedback.aspx");
        }
    }
}