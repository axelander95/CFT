using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CFT.Clases;
using System.Data;
using System.Data.SqlClient;
namespace CFT.Admin
{
    public partial class Cursos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_Load(object sender, EventArgs e)
        {
            LoadCursos();
        }
        protected void LoadCursos()
        {
            try
            {
                grvCursos.DataSource = new Database().getData("SELECCIONA_TABLA_GENERAL", new SqlParameter[] {
                    new SqlParameter("@tabla", "tb_curso")
                }).Tables[0];
                grvCursos.DataBind();
            }
            catch(Exception e)
            {
                lblInformacion.Text = e.Message;
            }
        }
        protected void grvCursos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                try
                {
                    int index = int.Parse(e.CommandArgument.ToString());
                    DataSet ds = new Database().getData("SELECCIONA_REGISTRO_ESPECIFICO", new SqlParameter[] {
                    new SqlParameter("@tabla", "tb_curso"),
                    new SqlParameter("@columna", "id_curso"),
                    new SqlParameter("@dato", grvCursos.Rows[index].Cells[1].Text)
                });
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        DataRow row = ds.Tables[0].Rows[0];
                        txtAprendizaje.Text = row["aprendizaje"].ToString();
                        txtDescripcion.Text = row["descripcion"].ToString();
                        txtDirigidoA.Text = row["dirigido_a"].ToString();
                        txtHoras.Text = row["horas"].ToString();
                        txtID.Text = row["id_curso"].ToString();
                        txtMaximoEstudiantes.Text = row["maximo_estudiantes"].ToString();
                        txtMinimoEstudiantes.Text = row["minimo_estudiantes"].ToString();
                        txtNombre.Text = row["nombre"].ToString();
                        txtObjetivo.Text = row["objetivo"].ToString();
                        txtPrecioPublico.Text = row["precio_publico"].ToString();
                        txtPrecioUCSG.Text = row["precio_ucsg"].ToString();
                        txtPrerequisitos.Value = row["pre_requisitos"].ToString();
                        cmbCategoria.SelectedValue = row["id_categoria"].ToString();
                        cmbDocente.SelectedValue = row["id_docente"].ToString();
                        cmbEstado.SelectedValue = (bool.Parse(row["estado"].ToString())) ? "1" : "0";
                        calFechaInicio.SelectedDate = DateTime.Parse(row["fecha_inicio"].ToString());
                        Enable();
                    }
                    ds = new Database().getData("SELECCIONA_REGISTRO_ESPECIFICO", new SqlParameter[] {
                    new SqlParameter("@tabla", "tb_curso_dia"), new SqlParameter("@columna", "id_curso"),
                    new SqlParameter("@dato", txtID.Text)
                });
                    grvHorario.DataSource = ds.Tables[0];
                    grvHorario.DataBind();
                    ViewState["GridView"] = ds.Tables[0];
                    
                }
                catch(Exception ex)
                {
                    lblInformacion.Text = ex.Message;
                }
            }
        }

        protected void cmbCategoria_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    cmbCategoria.DataSource = new Database().getData("SELECCIONA_TABLA_GENERAL_POR_ESTADO", new SqlParameter[] {
                    new SqlParameter("@tabla", "tb_categoria")
                }).Tables[0];
                    cmbCategoria.DataTextField = "descripcion";
                    cmbCategoria.DataValueField = "id_categoria";
                    cmbCategoria.DataBind();
                }
                catch (Exception ex)
                {
                    lblInformacion.Text = ex.Message;
                }
            }
        }

        protected void cmbDocente_Load(object sender, EventArgs e)
        {
                if (!IsPostBack)
            {
                try
                {
                    cmbDocente.DataSource = new Database().getData("SELECCIONA_TABLA_GENERAL_POR_ESTADO", new SqlParameter[] {
                    new SqlParameter("@tabla", "tb_docente")
                }).Tables[0];
                    cmbDocente.DataTextField = "nombre";
                    cmbDocente.DataValueField = "id_docente";
                    cmbDocente.DataBind();
                }
                catch (Exception ex)
                {
                    lblInformacion.Text = ex.Message;
                }
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            GenerateGridView();
            Enable();
        }
        protected void GenerateGridView()
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
        protected void Enable()
        {
            txtID.Enabled = true;
            txtNombre.Enabled = true;
            txtAprendizaje.Enabled = true;
            txtDescripcion.Enabled = true;
            txtDirigidoA.Enabled = true;
            txtHoras.Enabled = true;
            txtMaximoEstudiantes.Enabled = true;
            txtMinimoEstudiantes.Enabled = true;
            txtObjetivo.Enabled = true;
            txtPrecioUCSG.Enabled = true;
            txtPrerequisitos.Disabled = false;
            grvHorario.Enabled = true;
            btnHorario.Enabled = true;
            cmbCategoria.Enabled = true;
            cmbDocente.Enabled = true;
            cmbEstado.Enabled = true;
            btnAceptar.Enabled = true;
            btnCancelar.Enabled = true;
            btnAgregar.Enabled = false;
            txtPrecioPublico.Enabled = true;
            fulImagen.Enabled = true;
            calFechaInicio.Enabled = true;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Clear();
        }
        protected void Clear()
        {
            txtID.Enabled = false;
            txtNombre.Enabled = false;
            txtAprendizaje.Enabled = false;
            txtDescripcion.Enabled = false;
            txtDirigidoA.Enabled = false;
            txtHoras.Enabled = false;
            txtMaximoEstudiantes.Enabled = false;
            txtMinimoEstudiantes.Enabled = false;
            txtObjetivo.Enabled = false;
            txtPrecioUCSG.Enabled = false;
            txtPrerequisitos.Disabled = true;
            grvHorario.Enabled = false;
            btnHorario.Enabled = false;
            cmbCategoria.Enabled = false;
            cmbDocente.Enabled = false;
            cmbEstado.Enabled = false;
            btnAceptar.Enabled = false;
            btnCancelar.Enabled = false;
            btnAgregar.Enabled = true;
            txtID.Text = string.Empty;
            txtNombre.Text = string.Empty;
            txtAprendizaje.Text = string.Empty;
            txtDescripcion.Text = string.Empty;
            txtDirigidoA.Text = string.Empty;
            txtHoras.Text = string.Empty;
            txtMaximoEstudiantes.Text = string.Empty;
            txtMinimoEstudiantes.Text = string.Empty;
            txtObjetivo.Text = string.Empty;
            txtPrecioUCSG.Text = string.Empty;
            txtPrerequisitos.Value = string.Empty;
            cmbCategoria.SelectedIndex = -1;
            cmbDocente.SelectedIndex = -1;
            cmbEstado.SelectedIndex = 0;
            txtPrecioPublico.Text = string.Empty;
            txtPrecioPublico.Enabled = false;
            fulImagen.Enabled = false;
            calFechaInicio.Enabled = false;
            calFechaInicio.SelectedDate = DateTime.Today;
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
                lblInformacion.Text = ex.Message;
            }
        }

        protected void grvHorario_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
        protected void AddRow()
        {
            DataTable dt = (DataTable)ViewState["GridView"];
            DataRow row = null;
            row = dt.NewRow();
            foreach (GridViewRow r in grvHorario.Rows)
            {
                DropDownList ddl = (DropDownList)r.FindControl("id_dia");
                TextBox desde = (TextBox)r.FindControl("desde");
                TextBox hasta = (TextBox)r.FindControl("desde");
                dt.Rows[r.RowIndex]["id_dia"] = ddl.SelectedValue;
                dt.Rows[r.RowIndex]["desde"] = desde.Text;
                dt.Rows[r.RowIndex]["hasta"] = hasta.Text;
            }
            dt.Rows.Add(row);
            ViewState["GridView"] = dt;
            grvHorario.DataSource = dt;
            grvHorario.DataBind();
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

        protected void btnHorario_Click(object sender, EventArgs e)
        {
            AddRow();
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                fulImagen.SaveAs(Server.MapPath("~/Uploads/Cursos/" + fulImagen.FileName));
                int id = (txtID.Text == String.Empty) ? 0 : int.Parse(txtID.Text);
                Database db = new Database();
                DataSet row = db.getData("INSERTA_MODIFICA_CURSO", new SqlParameter[] {
                    new SqlParameter("@id_curso", id),
                    new SqlParameter("@nombre", txtNombre.Text),
                    new SqlParameter("@descripcion", txtDescripcion.Text),
                    new SqlParameter("@id_categoria", cmbCategoria.SelectedValue),
                    new SqlParameter("@objetivo", txtObjetivo.Text),
                    new SqlParameter("@dirigido_a", txtDirigidoA.Text),
                    new SqlParameter("@pre_requisitos", txtPrerequisitos.Value),
                    new SqlParameter("@aprendizaje", txtAprendizaje.Text),
                    new SqlParameter("@precio_ucsg", txtPrecioUCSG.Text),
                    new SqlParameter("@precio_publico", txtPrecioPublico.Text),
                    new SqlParameter("@maximo_estudiantes", txtMaximoEstudiantes.Text),
                    new SqlParameter("@minimo_estudiantes", txtMinimoEstudiantes.Text),
                    new SqlParameter("@id_docente", cmbDocente.SelectedValue),
                    new SqlParameter("@certificacion", rblCertificacion.SelectedValue),
                    new SqlParameter("@horas", txtHoras.Text),
                    new SqlParameter("@fecha_inicio", calFechaInicio.SelectedDate.ToShortDateString()),
                    new SqlParameter("@url_imagen", "~\\Uploads\\Cursos\\" + fulImagen.FileName),
                    new SqlParameter("@estado", cmbEstado.SelectedValue)
                });
                if (row.Tables[0].Rows.Count > 0)
                {
                    txtID.Text = row.Tables[0].Rows[0]["id_curso"].ToString();
                    foreach (GridViewRow r in grvHorario.Rows)
                    {
                        DropDownList ddl = (DropDownList)r.FindControl("id_dia");
                        TextBox desde = (TextBox)r.FindControl("desde");
                        TextBox hasta = (TextBox)r.FindControl("hasta");
                        int ans = db.ExecuteSQL("INSERTA_HORARIO_CURSO", new SqlParameter[] {
                            new SqlParameter("@id_curso", txtID.Text),
                            new SqlParameter("@id_dia", ddl.SelectedValue),
                            new SqlParameter("@desde", desde.Text),
                            new SqlParameter("@hasta", hasta.Text)
                        });
                        if (ans > 0)
                        {
                            LoadCursos();
                            Clear();
                        }
                    }
                }
                lblInformacion.Text = "Se ha guardado correctamente los datos";
            }
            catch(Exception ex)
            {
                lblInformacion.Text = ex.Message;
            }
        }
    }
}