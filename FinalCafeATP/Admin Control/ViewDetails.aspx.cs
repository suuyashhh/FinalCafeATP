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
    public partial class ViewDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["id"] != null)
            {
                getdetails();
                //lname.Text = Session["username"].ToString();
                gridv.DataSource = order();
                gridv.DataBind();
            }
        }
        protected void getdetails()
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("select date,order_total from orderfirst where order_id=@id", con);
            cmd.Parameters.AddWithValue("@id", Request.QueryString[0]);
            con.Open();
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.HasRows)
            {
                sdr.Read();
                DateTime dt = DateTime.Parse(sdr.GetValue(0).ToString());
                ldate.Text = dt.ToString("dd/MM/yyyy");
                ltotal.Text = sdr.GetValue(1).ToString();

            }

            con.Close();
            SqlCommand cmdqty = new SqlCommand("select SUM(quantity) from ordersecond where order_id=@id", con);
            con.Open();
            cmdqty.Parameters.AddWithValue("@id", Request.QueryString[0]);
            SqlDataReader sqlDataReader = cmdqty.ExecuteReader();
            if (sqlDataReader.HasRows)
            {
                sqlDataReader.Read();
                ltotal_qty.Text = sqlDataReader.GetValue(0).ToString();
            }

            con.Close();
            SqlCommand cmdgetname = new SqlCommand("select name from Register where contact=@contact",con);
            cmdgetname.Parameters.AddWithValue("@contact", Request.QueryString[1].ToString());
            con.Open();
            SqlDataReader sdrname = cmdgetname.ExecuteReader();
            if(sdrname.HasRows)
            {
                sdrname.Read();
                lname.Text=sdrname.GetValue(0).ToString();
            }

        }

        protected DataSet order()
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("select * from ordersecond where order_id=@id", con);
            cmd.Parameters.AddWithValue("@id", Request.QueryString[0]);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            return ds;
        }

    }
}