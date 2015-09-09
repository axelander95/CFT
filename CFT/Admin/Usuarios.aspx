<%@ Page Title="CFT | Usuarios" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="CFT.Admin.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row containter">
        <div class="col-lg-12">

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" CssClass="table" ForeColor="#333333" GridLines="None" OnLoad="GridView1_Load">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="id_usuario" HeaderText="ID" />
                    <asp:BoundField DataField="nombre_razon_social" HeaderText="Nombre" />
                    <asp:BoundField DataField="correo_electronico" HeaderText="Correo electrónico" />
                    <asp:BoundField DataField="nombre_usuario" HeaderText="Nombre de usuario" />
                    <asp:BoundField DataField="sexo" HeaderText="Sexo" />
                    <asp:BoundField DataField="fecha_registro" HeaderText="Fecha de registro" />
                    <asp:CheckBoxField />
                    <asp:BoundField DataField="estado" HeaderText="Estado" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>

        </div>
    </div>
</asp:Content>
