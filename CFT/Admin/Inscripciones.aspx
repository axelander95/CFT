<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Inscripciones.aspx.cs" Inherits="CFT.Admin.Inscripciones" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <label>Buscar por: </label>
                <asp:DropDownList ID="cmbOpciones" runat="server">
                    <asp:ListItem Value="tb_curso.nombre" Selected="True">Curso</asp:ListItem>
                    <asp:ListItem Value="tb_curso.fecha_inicio">Fecha de inicio</asp:ListItem>
                    <asp:ListItem Value="tb_usuario.nombre_razon_social">Estudiante</asp:ListItem>
                    <asp:ListItem Value="tb_profesor.nombre">Profesor</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox runat="server" ID="txtBusqueda"/>
                <asp:Button runat="server" Text="Consultar" ID="btnBuscar" OnClick="Unnamed1_Click"/>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12">
                <asp:Button runat="server" Text="Generar reporte actual" CssClass="btn-block"/>
                <asp:GridView runat="server" ID="grvInscripciones" AutoGenerateColumns="False" CssClass="table">
                <Columns>
                    <asp:BoundField DataField="estudiante" HeaderText="Estudiante" />
                    <asp:BoundField DataField="fecha_inicio" HeaderText="Fecha de inicio" />
                    <asp:BoundField DataField="curso" HeaderText="Curso" />
                    <asp:BoundField DataField="docente" HeaderText="Profesor" />
                </Columns>
            </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
