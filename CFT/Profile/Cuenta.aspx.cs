using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using CFT.Clases;
namespace CFT.Profile
{
    public partial class Cuenta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grvCursos_Load(object sender, EventArgs e)
        {
            LoadGrv();
        }
        protected void LoadGrv()
        {
            try
            {
                grvCursos.DataSource = new Database().getData("SELECCIONA_LISTA_INSCRIPCIONES", new SqlParameter[] {
                new SqlParameter("@id_usuario", Session["id_usuario"])
                }).Tables[0];
                grvCursos.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }
        protected void grvCursos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                try
                {
                    int rows = new Database().ExecuteSQL("ELIMINA_USUARIO_INSCRIPCION", new SqlParameter[] {
                        new SqlParameter("@id_usuario", Session["id_usuario"]),
                        new SqlParameter("@id_curso", grvCursos.Rows[index].Cells[0].Text)
                    });
                    if (rows > 0)
                    {
                        LoadGrv();
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
        }

        protected void grvCursos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
    }
}