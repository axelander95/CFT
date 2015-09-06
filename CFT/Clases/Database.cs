using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
namespace CFT.Clases
{
    public class Database
    {
        public Database()
        {
        }
        private SqlConnection getConnection()
        {
            return new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString);
        }
        public int ExecuteSQL(String procedure, SqlParameter[] parameters)
        {
            SqlConnection con = getConnection();
            SqlCommand cmd = new SqlCommand(procedure, con);
            cmd.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter parameter in parameters)
                cmd.Parameters.Add(parameter);
            con.Open();
            int rows = cmd.ExecuteNonQuery();
            con.Close();
            return rows;
        }
        public DataSet getData(String procedure, SqlParameter[] parameters)
        {
            SqlDataAdapter da = new SqlDataAdapter(procedure, getConnection());
            DataSet ds = new DataSet();
            da.SelectCommand.CommandType = CommandType.StoredProcedure;
            foreach (SqlParameter parameter in parameters)
                da.SelectCommand.Parameters.Add(parameter);
            da.Fill(ds);
            return ds;
        }
        public void setDropdownList(DropDownList ddl, DataSet ds, string display, string value)
        {
            ddl.DataSource = ds;
            ddl.DataTextField = display;
            ddl.DataValueField = value;
            ddl.DataBind();
        }
        public void setCheckBoxList(CheckBoxList chl, DataSet ds, string display, string value)
        {
            chl.DataSource = ds;
            chl.DataTextField = display;
            chl.DataValueField = value;
            chl.DataBind();
        }
    }
}