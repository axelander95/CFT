<%@ Page Title="Administrador CFT | Categorías" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Categorias.aspx.cs" Inherits="CFT.Admin.Categorias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-lg-12 row">
        <h1>Categorías</h1>
        <div class="col-lg-12 col-md-12 col-sm-12">
            <asp:GridView ID="grvCategorias" runat="server" AutoGenerateColumns="False" OnLoad="grvCategorias_Load" CssClass="table" OnRowCommand="grvCategorias_RowCommand">
                <Columns>
                    <asp:ButtonField CommandName="select" HeaderText="Acción" Text="Seleccionar" />
                    <asp:BoundField DataField="id_categoria" HeaderText="ID" />
                    <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                    <asp:CheckBoxField DataField="estado" HeaderText="Estado" AccessibleHeaderText="chkEstado" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="btn-group col-lg-12">
                    <asp:Button runat="server" Text="Agregar" CssClass="btn" OnClick="Unnamed1_Click" ID="btnAgregar"></asp:Button>
                    <asp:Button runat="server" Text="Aceptar" CssClass="btn" Enabled="False" OnClick="Unnamed2_Click" ID="btnAceptar"></asp:Button>
                    <asp:Button runat="server" Text="Cancelar" CssClass="btn" Enabled="False" OnClick="Unnamed3_Click" ID="btnCancelar"></asp:Button>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="form-group">
                <label>ID</label>
                <asp:TextBox runat="server" ID="txtID" CssClass="form-control" Enabled="False" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Descripción:</label>
                <asp:TextBox runat="server" ID="txtDescripcion" CssClass="form-control" Enabled="False"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:RadioButtonList runat="server" ID="rblEstado" Enabled="False">
                    <asp:ListItem Value="1" Selected="True">Activo</asp:ListItem>
                    <asp:ListItem Value="0">Inactivo</asp:ListItem>
                </asp:RadioButtonList>
            </div>
                <asp:Label ID="lblEstado" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
