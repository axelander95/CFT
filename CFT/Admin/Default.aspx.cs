using System;
using CFT.Clases;

namespace CFT.Admin
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try {
                    LoadUsuarios();
                    LoadInscripciones();
                }
                catch(Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }
        private void LoadUsuarios()
        {
            grvUsuarios.DataSource = new Database().getData("ULTIMOS_USUARIOS", new System.Data.SqlClient.SqlParameter[] { }).Tables[0];
            grvUsuarios.DataBind();
        }
        private void LoadInscripciones()
        {
            grvInscripciones.DataSource = new Database().getData("ULTIMAS_INSCRIPCIONES", new System.Data.SqlClient.SqlParameter[] { }).Tables[0];
            grvInscripciones.DataBind();
        }
    }
}