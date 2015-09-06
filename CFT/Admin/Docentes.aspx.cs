using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CFT.Admin
{
    public partial class Docentes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            grvHorario.TemplateControl.Controls.Add(new GridViewRow(grvHorario.Rows.Count + 1, grvHorario.Rows.Count + 1, DataControlRowType.DataRow, DataControlRowState.Edit));
        }
    }
}