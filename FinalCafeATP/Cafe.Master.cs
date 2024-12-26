using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FinalCafeATP
{
    public partial class Cafe : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                btn_login.Visible = false;
                btn_lbl.Text = "Hello, " + Session["username"].ToString();
            }
            else
            {
                btn_login.Visible = true;
            }
        }
    }
}