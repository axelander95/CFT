using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CFT.Clases;
using System.Data.SqlClient;
namespace CFT.Account
{
    public partial class Verify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                int id = int.Parse(Request.QueryString["id"]);
                int rows = new Database().ExecuteSQL("ACTIVA_INACTIVA_USUARIO", new SqlParameter[] {
                new SqlParameter("@id_usuario", id),
                new SqlParameter("@estado", 'A')
            });
                if (rows > 0)
                {
                    Response.Write("<h1>¡Felicidades!</h1><p>Ya eres un miembro de nuestra comunidad, tu cuenta" +
                        " ha sido activada satisfactoriamente.</p>");
                }
                else
                {
                    Response.Write("<h1>¡Error!</h1><p>Algo mal ha salido, intenta nuevamente.</p>");
                }
            }
            catch(Exception ex)
            {
                Response.Write("<h1>¡Error!</h1><p>" + ex.Message + "</p>");
            }
        }
    }
}