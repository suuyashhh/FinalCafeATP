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
    public partial class OrderHistory : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gridv.DataSource = gvuser();
                gridv.DataBind();
            }
            if (Session["user"] != null)
            {

            }
            else
            {
                Response.Redirect("LoginAdminn.aspx?type=access");
            }
        }

        protected DataSet gvuser()
        {
            con.Close();
            SqlCommand sql = new SqlCommand("select srno,date,order_total,order_id,user_contact from orderfirst", con);
            con.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(sql);
            adapter.Fill(ds);
            return ds;
        }
    }
}