<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Inscripciones.aspx.cs" Inherits="CFT.Admin.Inscripciones" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <label>Cursos</label>
            <asp:DropDownList runat="server" ID="ddlCursos"></asp:DropDownList>
            <asp:Button runat="server" ID="btnGenerar" Text="Reporte" CssClass="btn-circle"/>
        </div>
    </div>
    <div class="row">
        <asp:GridView runat="server" ID="grvInscripciones" AutoGenerateColumns="False" CssClass="table">
            <Columns>
                <asp:BoundField DataField="nombre" HeaderText="Estudiante" />
                <asp:BoundField DataField="fecha_inscripcion" HeaderText="Fecha de inscripción" />
            </Columns>
        </asp:GridView>
        <asp:ScriptManager runat="server" ID="stmReportes">
        </asp:ScriptManager>
    </div>
</asp:Content>
