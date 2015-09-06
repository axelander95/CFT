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
                try
                {
                    dlEventos.DataSource = new Database().getData("SELECCIONA_TABLA_GENERAL_POR_ESTADO", new SqlParameter[] {
                        new SqlParameter("@tabla", "tb_evento")
                    }).Tables[0];
                    dlEventos.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
        }
    }
}