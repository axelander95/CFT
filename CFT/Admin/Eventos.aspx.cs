using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CFT.Clases;
using System.Data.SqlClient;
using System.Data;
using System.IO;
namespace CFT.Admin
{
    public partial class Eventos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void LoadGRV()
        {
            try
            {
                grvEventos.DataSource = new Database().getData("CONSULTA_TABLA_GENERAL", new SqlParameter[] {
                    new SqlParameter("@tabla", "tb_evento")
                }).Tables[0];
                grvEventos.DataBind();
            }
            catch (Exception e)
            {

            }
        }
        protected void grvEventos_Load(object sender, EventArgs e)
        {
            LoadGRV();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            btnAgregar.Enabled = false;
            btnAceptar.Enabled = true;
            btnCancelar.Enabled = true;
            txtID.Enabled = true;
            txtTitulo.Enabled = true;
            txtDescripcion.Enabled = true;
            txtHoraInicio.Enabled = true;
            txtHoraFin.Enabled = true;
            fulImagen.Enabled = true;
            calEventos.Enabled = true;
        }
        protected void Clear()
        {
            txtID.Text = String.Empty;
            txtTitulo.Text = String.Empty;
            txtHoraInicio.Text = String.Empty;
            txtHoraFin.Text = String.Empty;
            txtDescripcion.Text = String.Empty;
            btnAceptar.Enabled = false;
            btnCancelar.Enabled = false;
            btnAgregar.Enabled = true;
            calEventos.SelectedDate = DateTime.Today;
            rblEstado.SelectedIndex = -1;
            HttpPostedFile file = fulImagen.PostedFile;
            file = null;
        }
        protected void grvEventos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "select")
            {
                int i = int.Parse(e.CommandArgument.ToString());
                try
                {
                    DataSet ds = new Database().getData("SELECCIONA_REGISTRO_ESPECIFICO", new SqlParameter[] {
                        new SqlParameter("@tabla", "tb_evento"), new SqlParameter("@columna", "id_evento"),
                        new SqlParameter("@dato", grvEventos.Rows[i].Cells[1].Text)
                    });
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        DataRow row = ds.Tables[0].Rows[0];
                        txtID.Text = row["id_evento"].ToString();
                        txtTitulo.Text = row["titulo"].ToString();
                        txtDescripcion.Text = row["descripcion"].ToString();
                        txtHoraInicio.Text = row["hora_inicio"].ToString();
                        txtHoraFin.Text = row["hora_fin"].ToString();
                        calEventos.SelectedDate = DateTime.Parse(row["fecha_evento"].ToString());
                        rblEstado.SelectedValue = (bool.Parse(row["estado"].ToString())) ? "1" : "0";

                    }
                    else
                        lblEstado.Text = "No se encontró el registro o no se realizó corréctamente la consulta.";
                }
                catch (Exception ex)
                {
                    lblEstado.Text = "Hubo un error al momento de cargar los datos: " + ex.Message;
                }
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Clear();
        }
    }
}