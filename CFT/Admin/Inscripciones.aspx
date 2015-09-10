<%@ Page Title="CFT | Inscripciones" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Inscripciones.aspx.cs" Inherits="CFT.Admin.Inscripciones" %>

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
                <asp:Button runat="server" Text="Generar reporte actual" CssClass="btn-block" ID="btnGenerar" OnClick="Unnamed1_Click1"/>
                <asp:GridView runat="server" ID="grvInscripciones" AutoGenerateColumns="False" CssClass="table" CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="estudiante" HeaderText="Estudiante" />
                    <asp:BoundField DataField="fecha_inicio" HeaderText="Fecha de inicio" />
                    <asp:BoundField DataField="curso" HeaderText="Curso" />
                    <asp:BoundField DataField="docente" HeaderText="Profesor" />
                </Columns>
                    <EditRowStyle BackColor="#999999" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
