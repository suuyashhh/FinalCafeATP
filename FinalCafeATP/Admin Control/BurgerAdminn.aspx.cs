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
    public partial class BurgerAdminn : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showfooditems();
            }

            if (Session["user"] != null)
            {

            }
            else
            {
                Response.Redirect("LoginAdminn.aspx?type=access");
            }
        }

        protected void showfooditems()
        {
            try
            {

                using (conn)
                {
                    using (SqlCommand cmd = new SqlCommand("Select Srno,food,price from burger", conn))
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
        protected void btnnonveg_Click(object sender, EventArgs e)
        {
            conn.Close();
            SqlCommand cmd = new SqlCommand("insert into burger values (@food,@price)", conn);
            cmd.Parameters.AddWithValue("@food", txtm.Text);
            cmd.Parameters.AddWithValue("@price", txtmh.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
            showfooditems();

            txtm.Text = "";
            txtmh.Text = "";
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            try
            {

                RepeaterItem a = (sender as LinkButton).Parent as RepeaterItem;

                int b = int.Parse((a.FindControl("lphotos") as Label).Text.ToString());



                conn.Close();
                string qry = "delete from burger where Srno=" + b;
                SqlCommand cmd = new SqlCommand(qry, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                showfooditems();

                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Item deleted Successfully','','success');", true);

            }
            catch (Exception es)
            {

            }
            finally
            {
                conn.Close();
            }
        }
    }
}