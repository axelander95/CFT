using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CFT.Clases;
using System.Data;
using System.Data.SqlClient;

namespace Centro_de_formación_tecnológica__CFT_.Account
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                LoadTipoIdentificacion();
                LoadPreguntaSecreta();
                LoadUniversidad();
                LoadOcupacion();
                LoadCarrera();
                LoadIntereses();
            }
            catch (Exception ex)
            {
                lblInformacion.Text = ex.Message;
            }
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            try
            {
                Database ds = new Database();
                DataSet data = ds.getData("INSERTA_MODIFICA_USUARIO", new SqlParameter[] {
                new SqlParameter("@id_usuario", int.Parse("0")), new SqlParameter("@id_tipo_identificacion", cmbTipoIdentificacion.SelectedValue),
                new SqlParameter("@identificacion", txtIdentificacion.Value), new SqlParameter("@nombre_razon_social", txtNombre.Value),
                new SqlParameter("@correo_electronico", txtCorreoElectronico.Value), new SqlParameter("@nombre_usuario", txtUsuario.Value),
                new SqlParameter("@contraseña", new General().GetHash(txtContraseña.Value)), new SqlParameter("@id_pregunta_secreta", cmbPreguntaSecreta.SelectedValue),
                new SqlParameter("@respuesta_secreta", txtRespuestaSecreta.Value), new SqlParameter("@sexo", rblSexo.SelectedValue),
                new SqlParameter("@direccion", txtDireccion.Value), new SqlParameter("@telefono", txtTelefono.Value),
                new SqlParameter("@celular", txtCelular.Value), new SqlParameter("@pagina_web", txtPaginaWeb.Value),
                new SqlParameter("@id_ocupacion", cmbOcupacion.SelectedValue), new SqlParameter("@id_universidad", cmbUniversidad.SelectedValue),
                new SqlParameter("@id_carrera", cmbCarrera.SelectedValue), new SqlParameter("@fecha_nacimiento", txtFechaNacimiento.Value)
            });
                if (data.Tables.Count > 0)
                {
                    Mail correo = new Mail(MailCredentials.hostname, MailCredentials.port, MailCredentials.user, MailCredentials.token, "info@cft.com.ec");
                    correo.SendMail(txtCorreoElectronico.Value, "Confirmación de cuenta",
                        "Bienvenido, estás a sólo un paso de lograr tu registro.\nConfirma tu cuenta a través de este enlace: http://" + Request.Url.Host + ":" + Request.Url.Port + "/Account/Verify.aspx?id=" + data.Tables[0].Rows[0]["id_usuario"].ToString());
                    Response.Redirect("~/Account/Congratulations.aspx");
                }
            }
            catch (Exception ex)
            {
                lblInformacion.Text = ex.Message;
            }
        }
        protected void LoadTipoIdentificacion()
        {
            Database ds = new Database();
            ds.setDropdownList(cmbTipoIdentificacion, ds.getData("SELECCIONA_TABLA_GENERAL_POR_ESTADO", new SqlParameter[] { new SqlParameter("@tabla", "tb_tipo_identificacion") }), "descripcion", "id_tipo_identificacion");
        }
        protected void LoadPreguntaSecreta()
        {
            Database ds = new Database();
            ds.setDropdownList(cmbPreguntaSecreta, ds.getData("SELECCIONA_TABLA_GENERAL_POR_ESTADO", new SqlParameter[] { new SqlParameter("@tabla", "tb_pregunta_secreta") }), "descripcion", "id_pregunta_secreta");
        }
        protected void LoadUniversidad()
        {
            Database ds = new Database();
            ds.setDropdownList(cmbUniversidad, ds.getData("SELECCIONA_TABLA_GENERAL_POR_ESTADO", new SqlParameter[] { new SqlParameter("@tabla", "tb_universidad") }), "descripcion", "id_universidad");
        }
        protected void LoadOcupacion()
        {
            Database ds = new Database();
            ds.setDropdownList(cmbOcupacion, ds.getData("SELECCIONA_TABLA_GENERAL_POR_ESTADO", new SqlParameter[] { new SqlParameter("@tabla", "tb_ocupacion") }), "descripcion", "id_ocupacion");
        }
        protected void LoadCarrera()
        {
            Database ds = new Database();
            ds.setDropdownList(cmbCarrera, ds.getData("SELECCIONA_TABLA_GENERAL_POR_ESTADO", new SqlParameter[] { new SqlParameter("@tabla", "tb_carrera") }), "descripcion", "id_carrera");
        }
        protected void LoadIntereses()
        {
            Database ds = new Database();
            ds.setCheckBoxList(chlIntereses, ds.getData("SELECCIONA_TABLA_GENERAL_POR_ESTADO", new SqlParameter[] { new SqlParameter("@tabla", "tb_interes") }), "descripcion", "id_interes");
        }

    }
}