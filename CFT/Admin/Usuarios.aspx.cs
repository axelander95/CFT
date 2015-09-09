using System;
using System.Data.SqlClient;
using CFT.Clases;
namespace CFT.Admin
{
    public partial class Usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    GridView1.DataSource = new Database().getData("SELECCIONA_TABLA_GENERAL", new SqlParameter[] {
                    new SqlParameter("@tabla", "tb_usuario")
                    }).Tables[0];
                    GridView1.DataBind();
                }
                catch (Exception ex)
                {

                }
            }
        }
    }
}