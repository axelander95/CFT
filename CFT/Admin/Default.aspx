<%@ Page Title="CFT | Escritorio" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CFT.Admin.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row containter">
        <div class="col-lg-12">
            <h2>Escritorio</h2>
        </div>
        <div class="col-lg-12">
            <div class="col-lg-6 col-lg-6 col-sm-6">
                <h3>Últimas inscripciones</h3>
                <asp:GridView runat="server" ID="grvInscripciones" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" CssClass="table">
                    <Columns>
                        <asp:BoundField DataField="nombre_razon_social" HeaderText="Usuario" />
                        <asp:BoundField DataField="nombre" HeaderText="Curso" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
            </div>
            <div class="col-lg-6 col-lg-6 col-sm-6">
                <h3>Últimos usuarios registrados</h3>
                <asp:GridView runat="server" ID="grvUsuarios" AutoGenerateColumns="False" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="table">
                    <Columns>
                        <asp:BoundField DataField="nombre_razon_social" HeaderText="Nombre" />
                        <asp:BoundField DataField="correo_electronico" HeaderText="Correo electrónico" />
                        <asp:BoundField DataField="nombre_usuario" HeaderText="Nombre de usuario" />
                        <asp:BoundField DataField="fecha_registro" HeaderText="Fecha de registro" />
                    </Columns>
                    <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                    <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                    <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                    <RowStyle BackColor="White" ForeColor="#003399" />
                    <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                    <SortedAscendingCellStyle BackColor="#EDF6F6" />
                    <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                    <SortedDescendingCellStyle BackColor="#D6DFDF" />
                    <SortedDescendingHeaderStyle BackColor="#002876" />
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
