using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalCafeATP.Admin_Control
{
    public partial class FeedbackAdminn : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showFeedbackphotos();
            }

            if (Session["user"] != null)
            {

            }
            else
            {
                Response.Redirect("LoginAdminn.aspx?type=access");
            }
        }

        protected void showFeedbackphotos()
        {
            try
            {

                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand("Select Srno,name,photos,message from feedback", con))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            rgallery.DataSource = dt;
                            rgallery.DataBind();
                        }
                    }
                }
            }
            catch (Exception es)
            {

            }
        }
        protected void LinkButton_Click(object sender, EventArgs e)
        {
            try
            {

                RepeaterItem a = (sender as LinkButton).Parent as RepeaterItem;

                int b = int.Parse((a.FindControl("lphotos") as Label).Text.ToString());



                con.Close();
                string qry = "delete from feedback where Srno=" + b;
                SqlCommand cmd = new SqlCommand(qry, con);
                con.Open();
                cmd.ExecuteNonQuery();
                showFeedbackphotos();

                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Photo deleted Successfully','','success');", true);

            }
            catch (Exception es)
            {

            }
            finally
            {
                con.Close();
            }
        }

        protected void btnbutton_Click(object sender, EventArgs e)
        {
            foreach (var files in file.PostedFiles)
            {
                string ex = System.IO.Path.GetFileName(files.FileName);
                Guid g = Guid.NewGuid();
                string imgName = g + ex;
                string pathimg = "../Feedbackphotos/" + imgName;
                //saving original img
                files.SaveAs(Server.MapPath(pathimg));


                con.Close();
                SqlCommand cmd = new SqlCommand("insert into feedback values (@name,@message,@photos,@dt)", con);
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@message", txtmsg.Text);
                cmd.Parameters.AddWithValue("@photos", pathimg);
                cmd.Parameters.AddWithValue("@dt", DateTime.Now);
                con.Open();
                cmd.ExecuteNonQuery();
                showFeedbackphotos();

                txtname.Text = "";
                txtmsg.Text = "";
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Upload Successfully,Thank You..!','','success');", true);

            }
        }
    }
}