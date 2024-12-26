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
    public partial class SpecialmenuAdminn : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showgalleryphotos();
            }

            if (Session["user"] != null)
            {

            }
            else
            {
                Response.Redirect("LoginAdminn.aspx?type=access");
            }
        }

        protected void showgalleryphotos()
        {
            try
            {

                using (con)
                {
                    using (SqlCommand cmd = new SqlCommand("Select Srno,header,image,title,text,mainprice from homespecial", con))
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

        protected void btnbutton_Click(object sender, EventArgs e)
        {
            foreach (var files in file.PostedFiles)
            {
                string ex = System.IO.Path.GetFileName(files.FileName);
                Guid g = Guid.NewGuid();
                string imgName = g + ex;
                string pathimg = "../specialmenu/" + imgName;
                //saving original img
                files.SaveAs(Server.MapPath(pathimg));

                con.Close();
                SqlCommand cmd = new SqlCommand("insert into homespecial values (@header,@image,@title,@text,@mainprice)", con);
                cmd.Parameters.AddWithValue("@header", txtitem.Text);
                cmd.Parameters.AddWithValue("@image", pathimg);
                cmd.Parameters.AddWithValue("@title", txtiname.Text);
                cmd.Parameters.AddWithValue("@text", txtprise.Text);
                cmd.Parameters.AddWithValue("@mainprice", txtmain.Text);
                con.Open();
                cmd.ExecuteNonQuery();
                showgalleryphotos();

                txtitem.Text = "";
                txtiname.Text = "";
                txtprise.Text = "";
                txtmain.Text = "";
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Upload Successfully,Thank You..!','','success');", true);

            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {

                RepeaterItem a = (sender as LinkButton).Parent as RepeaterItem;

                int b = int.Parse((a.FindControl("lphotos") as Label).Text.ToString());



                con.Close();
                string qry = "delete from homespecial where Srno=" + b;
                SqlCommand cmd = new SqlCommand(qry, con);
                con.Open();
                cmd.ExecuteNonQuery();
                showgalleryphotos();

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
    }
}