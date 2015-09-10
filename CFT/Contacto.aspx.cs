using System;
using CFT.Clases;

namespace CFT
{
    public partial class Contacto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnEnviar_Click(object sender, EventArgs e)
        {
            try
            {
                Mail correo = new Mail(MailCredentials.hostname, MailCredentials.port, MailCredentials.user, MailCredentials.token, txtCorreoElectronico.Text);
                lblInformacion.Text = correo.SendMail("jorgeluisneirar@gmail.com", txtAsunto.Text, txtMensaje.Text);
                correo.remitente = "info@cft.com.ec";
                correo.SendMail(txtCorreoElectronico.Text, "CFT: Mensaje recibido", "Estimado: " + txtNombre.Text + "\nTu mensaje ha sido receptado, muy pronto estaremos en contacto.");
                txtCorreoElectronico.Text = txtNombre.Text = txtMensaje.Text = txtAsunto.Text = string.Empty;
            }
            catch(Exception ex)
            {
                Response.Write(ex.Message);
            }
        }
    }
}