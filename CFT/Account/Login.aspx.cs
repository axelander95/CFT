using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using CFT.Clases;
using System.Web.Security;
namespace Centro_de_formación_tecnológica__CFT_.Account
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.Identity.IsAuthenticated)
                Response.Redirect("~/Default.aspx");
        }

        protected void btnAcceder_Click(object sender, EventArgs e)
        {
            try
            {
                DataSet ds = new Database().getData("SELECCIONA_USUARIO", new SqlParameter[] {
                    new SqlParameter("@nombre_usuario", txtUsuario.Value),
                    new SqlParameter("@contraseña", new General().GetHash(txtPassword.Value))
                });
                if (ds.Tables.Count > 0)
                {
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        DataRow row = ds.Tables[0].Rows[0];
                        Session["id_usuario"] = row["id_usuario"];
                        Session["nombre_usuario"] = row["nombre_usuario"];
                        FormsAuthentication.SetAuthCookie(txtUsuario.Value, chkRecordar.Checked);
                        Response.Redirect("~/Default.aspx");
                    }
                    else
                    {
                        lblInformacion.Text = "Credenciales inválidas";
                    }
                }
            }
            catch (Exception ex)
            {
                lblInformacion.Text = ex.Message;
            }
        }
    }
}