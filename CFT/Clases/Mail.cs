using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net.Mail;
using System.Net;
namespace CFT.Clases
{
    public class Mail
    {
        private int port;
        private string hostname, user, token;
        private string remitente;
        public Mail(string hostname, int port, string user, string token, string remitente)
        {
            this.hostname = hostname;
            this.port = port;
            this.user = user;
            this.token = token;
            this.remitente = remitente;
        }
        public string SendMail(string to, string asunto, string message)
        {
            string info = String.Empty;
            MailMessage msg = new MailMessage();
            msg.From = new MailAddress(remitente);
            msg.To.Add(new MailAddress(to));
            msg.Subject = asunto;
            msg.Body = message;
            SmtpClient MailClient = new SmtpClient();
            MailClient.Host = hostname;
            MailClient.Port = port;
            MailClient.EnableSsl = false;
            MailClient.UseDefaultCredentials = false;
            MailClient.Credentials = new NetworkCredential(user, token);
            try
            {
                MailClient.Send(msg);
                info = "Correo enviado";
            }
            catch (Exception ex)
            {
                info = "No se pudo enviar el Correo" + ex;
            }
            return info;
        }
    }
}