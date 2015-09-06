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
                    dlEventos.DataSource = new Database().getData("SELECCIONA_TABLA_GENERAL_POR_ESTADO", new SqlParameter[] {
                    new SqlParameter("@tabla", "tb_curso")
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
            if (e.CommandName == "Inscribir")
            {
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
                catch(Exception ex)
                {
                    Response.Write("Error: " + ex.Message);
                }
            }
        }
    }
}