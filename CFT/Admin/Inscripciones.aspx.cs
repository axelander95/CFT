using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CFT.Clases;
using System.Data;
using System.Data.SqlClient;
namespace CFT.Admin
{
    public partial class Inscripciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadGrv();
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            LoadGrv();
        }
        protected void LoadGrv()
        {
            try
            {
                grvInscripciones.DataSource = new Database().getData("SELECCIONA_INSCRIPCION_CONSULTA", new SqlParameter[] {
                new SqlParameter("@columna", cmbOpciones.SelectedValue),
                new SqlParameter("@dato", txtBusqueda.Text)
                }).Tables[0];
                grvInscripciones.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }
    }
}