using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using CFT.Clases;
namespace CFT
{
    public partial class Cursos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    dlEventos.DataSource = new Database().getData("SELECCIONA_CURSOS", new SqlParameter[] {
                    }).Tables[0];
                    dlEventos.DataBind();
                }
                catch (Exception ex)
                {

                }
            }
        }

        protected void dlEventos_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (HttpContext.Current.User.Identity.IsAuthenticated)
            {
                if (e.CommandName == "Inscribir")
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
                    }
                    catch (Exception ex)
                    {
                        Response.Write("Error: " + ex.Message);
                    }
                    try
                    {
                        int index = e.Item.ItemIndex;
                        Label lbl = (Label)dlEventos.Items[index].FindControl("lblID");
                        Button btn = (Button)dlEventos.Items[index].FindControl("btnInscribirme");
                        DataSet ds = new Database().getData("INSCRIBIR_USUARIO_CURSO", new SqlParameter[] {
                    new SqlParameter("@id_curso", lbl.Text),
                    new SqlParameter("@id_usuario", Session["id_usuario"])
                });
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            btn.Text = ds.Tables[0].Rows[0]["mensaje"].ToString();
                            btn.Enabled = false;
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("Error: " + ex.Message);
                    }
                } 
            }
            else
                Response.Redirect("~/Account/Login.aspx");
        }
    }
}