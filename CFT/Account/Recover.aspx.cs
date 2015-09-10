using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CFT.Clases;
namespace CFT.Account
{
    public partial class Recover : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                divPregunta.Visible = false;
                divContrasena.Visible = false;
            }
        }

        protected void btnSolicitar_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds = new Database().getData("SELECCIONA_REGISTRO_ESPECIFICO_TEXTO", new SqlParameter[] { 
                    new SqlParameter("@tabla", "tb_usuario"), new SqlParameter("@columna", "nombre_usuario"), new SqlParameter("@dato", txtNombreUsuario.Text)
                });
                if (ds.Tables[0].Rows.Count > 0)
                {
                    txtNombreUsuario.Enabled = false;
                    btnSolicitar.Enabled = false;
                    divPregunta.Visible = true;
                    cmbPregunta.SelectedValue = ds.Tables[0].Rows[0]["id_pregunta_secreta"].ToString();
                    rfvRespuesta.Enabled = true;
                }
                else
                    lblInformacion.Text = "El usuario no existe.";
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }
        }

        protected void cmbPregunta_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    cmbPregunta.DataSource = new Database().getData("SELECCIONA_TABLA_GENERAL_POR_ESTADO", new SqlParameter[] { 
                        new SqlParameter("@tabla", "tb_pregunta_secreta")
                    }).Tables[0];
                    cmbPregunta.DataTextField = "descripcion";
                    cmbPregunta.DataValueField = "id_pregunta_secreta";
                    cmbPregunta.DataBind();
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }

        protected void btnCambiar_Click(object sender, EventArgs e)
        {
            try
            {
                int rows = new Database().ExecuteSQL("CAMBIA_CONTRASEÑA_USUARIO", new SqlParameter[] {
                    new SqlParameter("@nombre_usuario", txtNombreUsuario.Text), new SqlParameter("@contraseña_nueva", new General().GetHash(txtContrasena.Text)) });
                if (rows <= 0)
                    lblInformacion4.Text = "Error, no se produjo ningún cambio, intente nuevamente";
                else
                    Response.Redirect("Login.aspx");
            }
            catch(Exception ex)
            {
                lblInformacion4.Text = ex.Message;
            }
        }

        protected void btnValidar_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds = new Database().getData("RESPONDE_PREGUNTA_SECRETA", new SqlParameter[] { new SqlParameter("@nombre_usuario",
                    txtNombreUsuario.Text), new SqlParameter("@respuesta", txtRespuesta.Text)});
                if (ds.Tables[0].Rows.Count > 0)
                {
                    lblInformacion2.Text = string.Empty;
                    divContrasena.Visible = true;
                    txtRespuesta.Enabled = false;
                    btnSolicitar.Enabled = false;
                    btnValidar.Enabled = false;
                    rfvContrasena.Enabled = true;
                    cmbPregunta.SelectedValue = ds.Tables[0].Rows[0]["id_pregunta_secreta"].ToString();
                }
                else
                    lblInformacion2.Text = "Respuesta incorrecta.";
            }
            catch(Exception ex)
            {
                lblInformacion2.Text = ex.Message;
            }
        }
    }
}