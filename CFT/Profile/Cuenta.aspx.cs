using System;
using System.Web.Security;
using System.Web;
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
            if (!IsPostBack)
            {
                try
                {
                    DataSet ds = new Database().getData("SELECCIONA_REGISTRO_ESPECIFICO_TEXTO", new SqlParameter[] {
                        new SqlParameter("@tabla", "tb_usuario"), new SqlParameter("@columna", "nombre_usuario"),
                        new SqlParameter("@dato", HttpContext.Current.User.Identity.Name)
                    });
                    Session["id_usuario"] = ds.Tables[0].Rows[0]["id_usuario"];
                    Session["nombre"] = ds.Tables[0].Rows[0]["nombre_razon_social"];
                    Session["correo_electronico"] = ds.Tables[0].Rows[0]["correo_electronico"];
                    Session["nombre_usuario"] = ds.Tables[0].Rows[0]["nombre_usuario"];
                    lblNombre.Text = Session["nombre"].ToString();
                    lblCorreo.Text = Session["correo_electronico"].ToString();
                    lblUsuario.Text = Session["nombre_usuario"].ToString();
                }
                catch(Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
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