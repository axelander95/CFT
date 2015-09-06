using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using CFT.Clases;
using System.Data;
namespace CFT.Admin
{
    public partial class Categorias : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void grvCategorias_Load(object sender, EventArgs e)
        {
            LoadGRV();
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            txtDescripcion.Enabled = true;
            txtID.Enabled = true;
            rblEstado.Enabled = true;
            btnAgregar.Enabled = false;
            btnAceptar.Enabled = true;
            btnCancelar.Enabled = true;
        }
        protected void Clear()
        {
            txtID.Text = String.Empty;
            txtDescripcion.Text = String.Empty;
            rblEstado.SelectedIndex = -1;
            txtID.Enabled = false;
            txtDescripcion.Enabled = false;
            rblEstado.Enabled = false;
            btnAceptar.Enabled = false;
            btnCancelar.Enabled = false;
            btnAgregar.Enabled = true;
        }

        protected void Unnamed4_Click(object sender, EventArgs e)
        {
            Clear();
        }

        protected void grvCategorias_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "select")
            {
                int i = int.Parse(e.CommandArgument.ToString());
                try
                {
                    DataSet ds = new Database().getData("SELECCIONA_REGISTRO_ESPECIFICO", new SqlParameter[] { new SqlParameter("@tabla", "tb_categoria"),
                        new SqlParameter("@columna", "id_categoria"), new SqlParameter("@dato", int.Parse(grvCategorias.Rows[i].Cells[1].Text))});
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        txtID.Text = ds.Tables[0].Rows[0]["id_categoria"].ToString();
                        txtDescripcion.Text = ds.Tables[0].Rows[0]["descripcion"].ToString();
                        rblEstado.SelectedValue = bool.Parse((ds.Tables[0].Rows[0]["estado"].ToString()))? "1":"0";
                        txtID.Enabled = true;
                        txtDescripcion.Enabled = true;
                        rblEstado.Enabled = true;
                        btnAgregar.Enabled = false;
                        btnAceptar.Enabled = true;
                        btnCancelar.Enabled = true;
                    }
                }
                catch (Exception ex)
                {

                }
            }
        }

        protected void Unnamed3_Click(object sender, EventArgs e)
        {
            Clear();
        }

        protected void Unnamed2_Click(object sender, EventArgs e)
        {
            int id = (txtID.Text == String.Empty) ? 0 : int.Parse(txtID.Text);
            try
            {
                DataSet ds = new Database().getData("INSERTA_MODIFICA_CATEGORIA", new SqlParameter[] {
                new SqlParameter("@id_categoria", id),
                new SqlParameter("@descripcion", txtDescripcion.Text),
                new SqlParameter("@estado", rblEstado.SelectedValue)});
                if (ds.Tables[0].Rows.Count > 0)
                {
                    txtID.Text = ds.Tables[0].Rows[0]["id_categoria"].ToString();
                    lblEstado.Text = "Los datos fueron almacenados con éxito";
                    Clear();
                    LoadGRV();
                }
                else
                    lblEstado.Text = "Hubo un error, intente nuevamente";
            }
            catch (Exception ex)
            {
                lblEstado.Text = "Error: " + ex.Message;
            }  
        }
        protected void LoadGRV()
        {
            try
            {
                grvCategorias.DataSource = new Database().getData("SELECCIONA_TABLA_GENERAL", new SqlParameter[]
            {
                new SqlParameter("@tabla", "tb_categoria")
            }).Tables[0];
                grvCategorias.DataBind();
            }
            catch (Exception ex)
            {

            }
        }
    }
}