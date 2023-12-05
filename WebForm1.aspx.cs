using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Practical4
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            int intYear = Convert.ToInt16(radiobtnYear.SelectedItem.Value);
            int intEmployeeID = Convert.ToInt16(ddlName.SelectedValue);

            
            GridView1.DataSource = sdsOrders;
            GridView1.DataBind();

            
        }

    }
}