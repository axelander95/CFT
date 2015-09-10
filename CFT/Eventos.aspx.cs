using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CFT.Clases;
namespace CFT
{
    public partial class Eventos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void dlEventos_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadFecha();
            }
        }
        private void LoadFecha()
        {
            try
            {
                dlEventos.DataSource = new Database().getData("SELECCIONA_EVENTO_FECHA", new SqlParameter[] {
                        new SqlParameter("@fecha", calEventos.SelectedDate.ToShortDateString())
                    }).Tables[0];
                dlEventos.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }

        protected void calEventos_SelectionChanged(object sender, EventArgs e)
        {
            LoadFecha();
        }

        protected void calEventos_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                calEventos.SelectedDate = DateTime.Today;
        }
    }
}