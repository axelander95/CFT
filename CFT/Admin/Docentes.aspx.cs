using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using CFT.Clases;
using System.Data.SqlClient;
namespace CFT.Admin
{
    public partial class Docentes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnAdd_Click1(object sender, EventArgs e)
        {
            AddRow();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            InitialRow();
            Enable();
        }
        protected void Enable()
        {
            btnAceptar.Enabled = true;
            btnCancelar.Enabled = true;
            btnAdd.Enabled = false;
            txtID.Enabled = true;
            txtNombre.Enabled = true;
            txtCedula.Enabled = true;
            txtCelular.Enabled = true;
            txtCorreoElectronico.Enabled = true;
            txtDireccion.Enabled = true;
            txtExperiencia.Disabled = false;
            txtTelefonoCasa.Enabled = true;
            txtTelefonoTrabajo.Enabled = true;
            cmbUniversidad.Enabled = true;
            cmbProfesion.Enabled = true;
            rblEstado.Enabled = true;
            grvHorario.Enabled = true;
            btnAgregar.Enabled = true;
            chlCertificados.Enabled = true;
        }
        protected void AddRow()
        {
            DataTable dt = (DataTable) ViewState["GridView"];
            DataRow row = null;
            row = dt.NewRow();
            foreach (GridViewRow r in grvHorario.Rows)
            {
                DropDownList ddl = ( DropDownList ) r.FindControl("id_dia");
                TextBox desde = (TextBox)r.FindControl("dese");
                TextBox hasta = (TextBox)r.FindControl("hasta");
                dt.Rows[r.RowIndex]["id_dia"] = ddl.SelectedValue;
                dt.Rows[r.RowIndex]["desde"] = desde.Text;
                dt.Rows[r.RowIndex]["hasta"] = hasta.Text;
            }
            dt.Rows.Add(row);
            ViewState["GridView"] = dt;
            grvHorario.DataSource = dt;
            grvHorario.DataBind();
        }
        protected void InitialRow()
        {
            DataTable dt = new DataTable();
            DataRow row = null;
            dt.Columns.Add(new DataColumn("id_dia"));
            dt.Columns.Add(new DataColumn("desde"));
            dt.Columns.Add(new DataColumn("hasta"));
            dt.Columns.Add(new DataColumn("btnEliminar"));
            row = dt.NewRow();
            dt.Rows.Add(row);
            ViewState["GridView"] = dt;
            grvHorario.DataSource = dt;
            grvHorario.DataBind();
        }

        protected void grvHorario_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                DropDownList ddl = (DropDownList)e.Row.FindControl("id_dia");
                Database db = new Database();
                ddl.DataSource = db.getData("SELECCIONA_TABLA_GENERAL_POR_ESTADO", new SqlParameter[] { new SqlParameter("@tabla", "tb_dia") });
                ddl.DataTextField = "descripcion";
                ddl.DataValueField = "id_dia";
                ddl.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        protected void grvHorario_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                int index = int.Parse(e.CommandArgument.ToString());
                DataTable dt = (DataTable)ViewState["GridView"];
                dt.Rows.RemoveAt(index);
                ViewState["GridView"] = dt;
                grvHorario.DataSource = dt;
                grvHorario.DataBind();
            }
        }

        protected void grvHorario_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }

        protected void GridView1_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadDocentes();
        }
        protected void LoadDocentes()
        {
            try
            {
                grvDocentes.DataSource = new Database().getData("SELECCIONA_TABLA_GENERAL", new SqlParameter[] {
                new SqlParameter("@tabla", "tb_docente")
                }).Tables[0];
                grvDocentes.DataBind();
            }
            catch (Exception ex)
            {

            }
        }
        protected void cmbProfesion_Load(object sender, EventArgs e)
        {
            try
            {
                cmbProfesion.DataSource = new Database().getData("SELECCIONA_TABLA_GENERAL_POR_ESTADO", new SqlParameter[] {
                    new SqlParameter("@tabla", "tb_profesion")
                }).Tables[0];
                cmbProfesion.DataTextField = "descripcion";
                cmbProfesion.DataValueField = "id_profesion";
                cmbProfesion.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        protected void cmbUniversidad_Load(object sender, EventArgs e)
        {
            try
            {
                cmbUniversidad.DataSource = new Database().getData("SELECCIONA_TABLA_GENERAL_POR_ESTADO", new SqlParameter[] {
                    new SqlParameter("@tabla", "tb_universidad")
                }).Tables[0];
                cmbUniversidad.DataTextField = "descripcion";
                cmbUniversidad.DataValueField = "id_universidad";
                cmbUniversidad.DataBind();
            }
            catch (Exception ex)
            {

            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                Database db = new Database();
                int id = (txtID.Text == string.Empty) ? int.Parse("0") : int.Parse(txtID.Text);
                DataSet row = db.getData("INSERTA_MODIFICA_DOCENTE", new SqlParameter[] {
                    new SqlParameter("@id_docente", id),
                    new SqlParameter("@cedula", txtCedula.Text),
                    new SqlParameter("@nombre", txtNombre.Text),
                    new SqlParameter("@direccion", txtDireccion.Text),
                    new SqlParameter("@telefono_casa", txtTelefonoCasa.Text),
                    new SqlParameter("@telefono_trabajo", txtTelefonoTrabajo.Text),
                    new SqlParameter("@celular", txtCelular.Text),
                    new SqlParameter("@correo_electronico", txtCorreoElectronico.Text),
                    new SqlParameter("@id_profesion", cmbProfesion.SelectedValue),
                    new SqlParameter("@id_universidad", cmbUniversidad.SelectedValue),
                    new SqlParameter("@experiencia", txtExperiencia.Value),
                    new SqlParameter("@estado", rblEstado.SelectedValue)
                });
                if (row.Tables[0].Rows.Count > 0)
                {
                    txtID.Text = row.Tables[0].Rows[0]["id_docente"].ToString();
                    foreach(GridViewRow r in grvHorario.Rows)
                    {
                        DropDownList ddl = (DropDownList)r.FindControl("id_dia");
                        TextBox desde = (TextBox)r.FindControl("desde");
                        TextBox hasta = (TextBox)r.FindControl("hasta");
                        int ans = db.ExecuteSQL("INSERTA_HORARIO_DOCENTE", new SqlParameter[] {
                            new SqlParameter("@id_docente", txtID.Text),
                            new SqlParameter("@id_dia", ddl.SelectedValue),
                            new SqlParameter("@desde", desde.Text),
                            new SqlParameter("@hasta", hasta.Text)
                        });
                    }
                    for (int i = 0; i<chlCertificados.Items.Count -1; i++)
                    {
                        if (chlCertificados.Items[i].Selected)
                        {
                            int r = db.ExecuteSQL("INSERTA_CERTIFICACION_DOCENTE", new SqlParameter[] { new SqlParameter("@id_docente", txtID.Text),
                                 new SqlParameter("@id_certificacion", chlCertificados.Items[i].Value )});
                        }   
                    }
                    LoadDocentes();
                    Clear();
                }
            }
            catch (Exception ex)
            {
                lblMensaje.Text = ex.Message;
            }
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Clear();
        }
        protected void Clear()
        {
            btnAdd.Enabled = true;
            btnAceptar.Enabled = false;
            btnCancelar.Enabled = false;
            txtID.Text = string.Empty;
            txtID.Enabled = false;
            txtNombre.Text = string.Empty;
            txtNombre.Enabled = false;
            txtCedula.Text = string.Empty;
            txtCedula.Enabled = false;
            txtCelular.Text = string.Empty;
            txtDireccion.Text = string.Empty;
            txtDireccion.Enabled = false;
            txtExperiencia.Value = string.Empty;
            txtExperiencia.Disabled = true;
            txtTelefonoCasa.Text = string.Empty;
            txtTelefonoCasa.Enabled = false;
            txtTelefonoTrabajo.Text = string.Empty;
            txtTelefonoTrabajo.Enabled = false;
            txtCorreoElectronico.Text = string.Empty;
            txtCorreoElectronico.Enabled = false;
            cmbProfesion.SelectedIndex = -1;
            cmbProfesion.Enabled = false;
            cmbUniversidad.SelectedIndex = -1;
            cmbUniversidad.Enabled = false;
            rblEstado.SelectedIndex = 0;
            rblEstado.Enabled = false;
            InitialRow();
            grvHorario.Enabled = false;
            lblMensaje.Text = string.Empty;
            chlCertificados.SelectedIndex = -1;
            chlCertificados.Enabled = false;
        }

        protected void grvDocentes_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                try
                {
                    int index = int.Parse(e.CommandArgument.ToString());
                    DataSet ds = new Database().getData("SELECCIONA_REGISTRO_ESPECIFICO", new SqlParameter[] {
                    new SqlParameter("@tabla", "tb_docente"),
                    new SqlParameter("@columna", "id_docente"),
                    new SqlParameter("@dato", grvDocentes.Rows[index].Cells[1].Text)
                    });
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        DataRow row = ds.Tables[0].Rows[0];
                        txtID.Text = row["id_docente"].ToString();
                        txtNombre.Text = row["nombre"].ToString();
                        txtDireccion.Text = row["direccion"].ToString();
                        txtCedula.Text = row["cedula"].ToString();
                        txtCelular.Text = row["celular"].ToString();
                        txtCorreoElectronico.Text = row["correo_electronico"].ToString();
                        txtTelefonoCasa.Text = row["telefono_casa"].ToString();
                        txtTelefonoTrabajo.Text = row["telefono_trabajo"].ToString();
                        cmbProfesion.SelectedValue = row["id_profesion"].ToString();
                        cmbUniversidad.SelectedValue = row["id_universidad"].ToString();
                        rblEstado.SelectedValue = (bool.Parse(row["estado"].ToString())) ? "1" : "0";
                        txtExperiencia.Value = row["experiencia"].ToString();
                        Enable();
                        ViewState["GridView"] = new Database().getData("SELECCIONA_REGISTRO_ESPECIFICO", new SqlParameter[] {
                            new SqlParameter("@tabla", "tb_profesor_dia"), new SqlParameter("@columna", "id_docente"),
                            new SqlParameter("@dato", txtID.Text)
                        }).Tables[0];
                        grvHorario.DataSource = (DataTable)ViewState["GridView"];
                        grvHorario.DataBind();
                        DataTable dt = new Database().getData("SELECCIONA_REGISTRO_ESPECIFICO", new SqlParameter[] {
                            new SqlParameter("@tabla", "tb_docente_certificacion"), new SqlParameter("@columna", "id_docente"),
                            new SqlParameter("@dato", txtID.Text)
                        }).Tables[0];
                        for (int i = 0; i< chlCertificados.Items.Count - 1; i++)
                        {
                            foreach(DataRow r in dt.Rows)
                                if (int.Parse(chlCertificados.Items[i].Value) == int.Parse(r["id_certificacion"].ToString()))
                                    chlCertificados.Items[i].Selected = true;
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMensaje.Text = ex.Message;
                }
            }
        }

        protected void chlCertificados_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                chlCertificados.DataSource = new Database().getData("SELECCIONA_TABLA_GENERAL_POR_ESTADO", new SqlParameter[] {
                    new SqlParameter("@tabla", "tb_certificacion")
                }).Tables[0];
                chlCertificados.DataTextField = "descripcion";
                chlCertificados.DataValueField = "id_certificacion";
                chlCertificados.DataBind();
            }
        }
    }
}