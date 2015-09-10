using System;
using CFT.Clases;
using System.Data.SqlClient;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;
namespace CFT.Admin
{
    public partial class Inscripciones : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                LoadGrv();
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            LoadGrv();
        }
        protected void LoadGrv()
        {
            try
            {
                grvInscripciones.DataSource = new Database().getData("SELECCIONA_INSCRIPCION_CONSULTA", new SqlParameter[] {
                new SqlParameter("@columna", cmbOpciones.SelectedValue),
                new SqlParameter("@dato", txtBusqueda.Text)
                }).Tables[0];
                grvInscripciones.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("Error: " + ex.Message);
            }
        }

        protected void Unnamed1_Click1(object sender, EventArgs e)
        {
            try
            {
                string name = Guid.NewGuid().ToString() + ".pdf";
                string fileName = Server.MapPath("~/Reportes/");
                Document document = new Document(PageSize.A4, 50, 50, 25, 25);
                PdfWriter.GetInstance(document, new FileStream(fileName + name, FileMode.Create));
                document.Open();
                Paragraph parrafo = new Paragraph();
                parrafo.Alignment = Element.ALIGN_CENTER;
                parrafo.Font = FontFactory.GetFont("Arial", 24);
                parrafo.Font.SetStyle(Font.BOLD);
                parrafo.Font.SetStyle(Font.UNDERLINE);
                parrafo.Add("CENTRO DE FORMACIÓN TECNOLÓGICA\n\n\nCurso: " + cmbOpciones.SelectedItem.Text + "\n\n\nLista de alumnos inscritos:\n\n\n");
                document.Add(parrafo);
                PdfPTable unaTabla = new PdfPTable(4);
                unaTabla.SetWidthPercentage(new float[] { 200, 200, 200, 200 }, PageSize.A4);
                unaTabla.AddCell(new Paragraph("Estudiante"));
                unaTabla.AddCell(new Paragraph("Fecha de inscripción"));
                unaTabla.AddCell(new Paragraph("Curso"));
                unaTabla.AddCell(new Paragraph("Profesor"));
                foreach (PdfPCell celda in unaTabla.Rows[0].GetCells())
                {
                    celda.BackgroundColor = BaseColor.LIGHT_GRAY;
                    celda.HorizontalAlignment = 1;
                    celda.Padding = 3;
                }
                foreach (System.Web.UI.WebControls.GridViewRow row in grvInscripciones.Rows)
                {
                    PdfPCell celda1 = new PdfPCell(new Paragraph(row.Cells[0].Text, FontFactory.GetFont("Arial", 10)));
                    PdfPCell celda2 = new PdfPCell(new Paragraph(row.Cells[1].Text, FontFactory.GetFont("Arial", 10)));
                    PdfPCell celda3 = new PdfPCell(new Paragraph(row.Cells[2].Text, FontFactory.GetFont("Arial", 10)));
                    PdfPCell celda4 = new PdfPCell(new Paragraph(row.Cells[3].Text, FontFactory.GetFont("Arial", 10)));
                    unaTabla.AddCell(celda1);
                    unaTabla.AddCell(celda2);
                    unaTabla.AddCell(celda3);
                    unaTabla.AddCell(celda4);
                }
                document.Add(unaTabla);
                document.Close();
                Response.ContentType = "application/octet-stream";
                Response.AppendHeader("Content-Disposition", "attachment;filename=" + name);
                Response.TransmitFile(fileName + name);
                Response.End();

            }
            catch (Exception ex)
            {
                btnGenerar.Text = "Intentar de nuevo: " + ex.Message;
            }
        }
    }
}