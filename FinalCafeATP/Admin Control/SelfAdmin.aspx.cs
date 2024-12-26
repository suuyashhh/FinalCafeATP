using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace FinalCafeATP.Admin_Control
{
    public partial class SelfAdmin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showSelfHomephotos();
                showSelfAboutphotos();
            }
            if (Session["user"] != null)
            {

            }
            else
            {
                Response.Redirect("LoginAdminn.aspx?type=access");
            }
        }
        protected void showSelfHomephotos()
        {
            try
            {

                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand("Select Srno,photo from SelfHome where srno='1' ", con))
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

        protected void showSelfAboutphotos()
        {
            try
            {

                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand("Select Srno,photo from SelfHome where srno='2' ", con))
                    {
                        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            Aboutgallery.DataSource = dt;
                            Aboutgallery.DataBind();
                        }
                    }
                }
            }
            catch (Exception es)
            {

            }
        }

        protected void btnbutton_Click(object sender, EventArgs e)
        {
            foreach (var files in file.PostedFiles)
            {
                string ex = System.IO.Path.GetFileName(files.FileName);
                Guid g = Guid.NewGuid();
                string imgName = g + ex;
                string pathimg = "../SelfHome/" + imgName;
                //saving original img
                files.SaveAs(Server.MapPath(pathimg));


                con.Close();
                SqlCommand cmd = new SqlCommand("update SelfHome set photo=@photos,dt=@dt where srno='1' ", con);
               
                cmd.Parameters.AddWithValue("@photos", pathimg);
                cmd.Parameters.AddWithValue("@dt", DateTime.Now);
                con.Open();
                cmd.ExecuteNonQuery();
                showSelfHomephotos();

                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Upload Successfully,Thank You..!','','success');", true);

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            foreach (var files in Fileupload.PostedFiles)
            {
                string ex = System.IO.Path.GetFileName(files.FileName);
                Guid g = Guid.NewGuid();
                string imgName = g + ex;
                string pathimg = "../SelfHome/" + imgName;
                //saving original img
                files.SaveAs(Server.MapPath(pathimg));


                con.Close();
                SqlCommand cmd = new SqlCommand("update SelfHome set photo=@photos,dt=@dt where srno='2' ", con);

                cmd.Parameters.AddWithValue("@photos", pathimg);
                cmd.Parameters.AddWithValue("@dt", DateTime.Now);
                con.Open();
                cmd.ExecuteNonQuery();
                showSelfAboutphotos();

                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Upload Successfully,Thank You..!','','success');", true);

            }
        }
    }
}