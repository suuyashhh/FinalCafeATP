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
    public partial class ContactAdmin : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {

            }
            else
            {
                Response.Redirect("LoginAdminn.aspx?type=access");
            }
            if (!IsPostBack)
            {
                gridv.DataSource = gvuser();
                gridv.DataBind();
            }
        }

        protected DataSet gvuser()
        {
            con.Close();
            SqlCommand sql = new SqlCommand("select * from contact", con);
            con.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(sql);
            adapter.Fill(ds);
            return ds;
        }

        protected void btnbutton_Click(object sender, EventArgs e)
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("insert into contact values (@name,@email,@contact,@message,@dt)", con);
            cmd.Parameters.AddWithValue("@name", txtname.Text);
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@contact", txtcont.Text);
            cmd.Parameters.AddWithValue("@message", txtmsg.Text);
            cmd.Parameters.AddWithValue("@dt", DateTime.Now);
            con.Open();
            cmd.ExecuteNonQuery();
            gridv.DataSource = gvuser();
            gridv.DataBind();


            txtname.Text = "";
            txtemail.Text = "";
            txtcont.Text = "";
            txtmsg.Text = "";
            this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Enquiry Sent Successfully,Thank You..! We will contact you very soon..!','','success');", true);

        }

        protected void gridv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridv.EditIndex = e.NewEditIndex;
            gridv.DataSource = gvuser();
            gridv.DataBind();
        }

        protected void gridv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridv.EditIndex = -1;
            gridv.DataSource = gvuser();
            gridv.DataBind();
        }

        protected void gridv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gridv.Rows[e.RowIndex];
            string name = (row.FindControl("txtname") as TextBox).Text;
            string email = (row.FindControl("txtemail") as TextBox).Text;
            string contact = (row.FindControl("txtcont") as TextBox).Text;
            string message = (row.FindControl("txtmsg") as TextBox).Text;

            con.Close();
            SqlCommand cmd = new SqlCommand("update contact set name=@name,email=@email,contact=@contact,message=@message where srno=@srno", con);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@contact", contact);
            cmd.Parameters.AddWithValue("@message", message);
            cmd.Parameters.AddWithValue("@srno", gridv.DataKeys[e.RowIndex].Value);
            con.Open();
            cmd.ExecuteNonQuery();
            gridv.EditIndex = -1;
            gridv.DataSource = gvuser();
            gridv.DataBind();
        }

        protected void gridv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            con.Close();
            SqlCommand sql = new SqlCommand("delete from contact where srno='" + gridv.DataKeys[e.RowIndex].Value + "' ", con);
            con.Open();
            sql.ExecuteNonQuery();
            gridv.EditIndex = -1;
            gridv.DataSource = gvuser();
            gridv.DataBind();
        }
    }
}