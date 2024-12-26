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
    public partial class About : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    showOwnerphoto();

            //}
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

        //protected void showOwnerphoto()
        //{
        //    con.Close();
        //    SqlCommand cmd = new SqlCommand("select * from SelfHome where srno='2' ", con);
        //    con.Open();
        //    SqlDataReader reader = cmd.ExecuteReader();
        //    if (reader.HasRows)
        //    {
        //        while (reader.Read())
        //        {

        //            lowner.Text += "<img src='" + reader.GetValue(1) + "' class='img-fluid w-100 rounded-circle' alt='' / > ";

        //        }
        //    }
        //}
        protected void Unnamed_Click(object sender, EventArgs e)
        {
            Session.RemoveAll();
            Response.Redirect("About.aspx");
        }
    }
}