using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalCafeATP
{
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                showphotos();

            }
            if (!IsPostBack)
            {
                showOwnerphoto();

            }
            if (!IsPostBack)
            {
                gridv.DataSource = gvuser();
                gridv.DataBind();
            }
            if (Request.QueryString["id"] != null)
            {
                GridView1.DataSource = order();
                GridView1.DataBind();
            }

        }

        protected DataSet gvuser()
        {
            con.Close();
            SqlCommand sql = new SqlCommand("select * from menu", con);
            con.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(sql);
            adapter.Fill(ds);
            return ds;
        }

         protected void showOwnerphoto()
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("select * from SelfHome where srno='1' ", con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lowner.Text += "<img src='" + reader.GetValue(1) + "' width='100%' />";

                }
            }
        }
        protected void showphotos()
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("select * from homespecial", con);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                while (reader.Read())
                {

                    lphotos.Text += "<div class='col-md-4'><div class='card menue '><div class='card-header' style='text-transform: uppercase;color:black;'>" + reader.GetValue(1) + "</div><img src = '" + reader.GetValue(2) + "' /><div class='card-body'><h5 class='card-title' style='text-transform: uppercase;'>" + reader.GetValue(3) + "</h5><p class='card-text'><strong>₹" + reader.GetValue(4) + "</strong> <del>₹" + reader.GetValue(5) + "</del></p><button type = 'button' class='btn btn-success'><a href='#Omenu' style='color:white!important;' >Place Order</a></button></div></div></div>";

                }
            }
        }
              

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {


                float billTotal = 0;

                foreach (GridViewRow row in gridv.Rows)
                {

                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox rememberMe = row.FindControl("rememberMe") as CheckBox;

                        string selectedStatus = rememberMe.Checked ? "YES" : "NO";

                        if (selectedStatus == "YES")
                        {
                            float qty = float.Parse((row.FindControl("Ddlqty") as DropDownList).SelectedItem.Text);
                            float price = float.Parse((row.FindControl("lblprice") as Label).Text);
                            float total = qty * price;
                            billTotal = billTotal + total;
                        }
                    }
                }


                Guid orderId = Guid.NewGuid();
                con.Close();
                SqlCommand cmd = new SqlCommand("insert into orderfirst values (@id,@usercontact,@ordertotal,@status,@date)", con);
                cmd.Parameters.AddWithValue("@id", orderId.ToString());
                cmd.Parameters.AddWithValue("@usercontact", Session["user"].ToString());
                cmd.Parameters.AddWithValue("@ordertotal", billTotal);
                cmd.Parameters.AddWithValue("@status", "Open");
                cmd.Parameters.AddWithValue("@date", DateTime.Now.Date);
                con.Open();
                cmd.ExecuteNonQuery();


                foreach (GridViewRow row in gridv.Rows)
                {
                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox rememberMe = row.FindControl("rememberMe") as CheckBox;



                        string selectedStatus = rememberMe.Checked ? "YES" : "NO";

                        if (selectedStatus == "YES")
                        {
                            string menu = (row.FindControl("lblname") as Label).Text;
                            float qty = float.Parse((row.FindControl("Ddlqty") as DropDownList).SelectedItem.Text);
                            float price = float.Parse((row.FindControl("lblprice") as Label).Text);
                            float total = qty * price;


                            con.Close();
                            SqlCommand cmditems = new SqlCommand("insert into ordersecond values (@id,@menu,@qty,@rate,@total)", con);

                            //cmd.Parameters.AddWithValue("@dt", DateTime.Parse(txtDate.Text));
                            cmditems.Parameters.AddWithValue("@id", orderId);
                            cmditems.Parameters.AddWithValue("@menu", menu);
                            cmditems.Parameters.AddWithValue("@qty", qty);
                            cmditems.Parameters.AddWithValue("@rate", price);
                            cmditems.Parameters.AddWithValue("@total", total);

                            con.Open();
                            cmditems.ExecuteNonQuery();

                        }

                    }
                }

                Response.Redirect("Order.aspx?id=" + orderId + "");



            }
            else
            {
                Response.Redirect("Login.aspx?type=menu");
            }
        }

        protected void Total_bt_Click(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {


                float billTotal = 0;

                foreach (GridViewRow row in gridv.Rows)
                {

                    if (row.RowType == DataControlRowType.DataRow)
                    {
                        CheckBox rememberMe = row.FindControl("rememberMe") as CheckBox;




                        string selectedStatus = rememberMe.Checked ? "YES" : "NO";

                        if (selectedStatus == "YES")
                        {
                            float qty = float.Parse((row.FindControl("Ddlqty") as DropDownList).SelectedItem.Text);
                            float price = float.Parse((row.FindControl("lblprice") as Label).Text);
                            float total = qty * price;
                            billTotal = billTotal + total;
                        }
                    }
                }


                Guid orderId = Guid.NewGuid();
                con.Close();
                SqlCommand cmd = new SqlCommand("insert into Total values (@id,@total)", con);
                cmd.Parameters.AddWithValue("@id", orderId.ToString());
                cmd.Parameters.AddWithValue("@total", billTotal);
                con.Open();
                cmd.ExecuteNonQuery();

                Response.Redirect("Menu.aspx?id=" + orderId + "");

            }
            else
            {
                Response.Redirect("Login.aspx?type=menu");
            }

        }

        protected DataSet order()
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("select * from Total where order_id=@id", con);
            cmd.Parameters.AddWithValue("@id", Request.QueryString[0]);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            return ds;
        }

        protected void Unnamed_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Menu.aspx");
        }

        protected void boxBtnn_Click(object sender, EventArgs e)
        {

            Response.Redirect("Menu.aspx");
        }

        protected void btn1Box_Click(object sender, EventArgs e)
        {

            Response.Redirect("Menu.aspx");
        }
    }
}