<%@ Page Title="CFT | Categorías" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Categorias.aspx.cs" Inherits="CFT.Admin.Categorias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-lg-12 row">
        <h1>Categorías</h1>
        <div class="col-lg-12 col-md-12 col-sm-12">
            <asp:GridView ID="grvCategorias" runat="server" AutoGenerateColumns="False" OnLoad="grvCategorias_Load" CssClass="table" OnRowCommand="grvCategorias_RowCommand" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
                <Columns>
                    <asp:ButtonField CommandName="select" HeaderText="Acción" Text="Seleccionar" />
                    <asp:BoundField DataField="id_categoria" HeaderText="ID" />
                    <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                    <asp:CheckBoxField DataField="estado" HeaderText="Estado" AccessibleHeaderText="chkEstado" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
        </div>
        <div class="col-lg-12 col-md-12 col-sm-12">
            <div class="btn-group col-lg-12">
                    <asp:Button runat="server" Text="Agregar" CssClass="btn" OnClick="Unnamed1_Click" ID="btnAgregar" CausesValidation="false"></asp:Button>
                    <asp:Button runat="server" Text="Aceptar" CssClass="btn" Enabled="False" OnClick="Unnamed2_Click" ID="btnAceptar"></asp:Button>
                    <asp:Button runat="server" Text="Cancelar" CssClass="btn" Enabled="False" OnClick="Unnamed3_Click" ID="btnCancelar" CausesValidation="false"></asp:Button>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="form-group">
                <label>ID</label>
                <asp:TextBox runat="server" ID="txtID" CssClass="form-control" Enabled="False" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Descripción:</label>
                <asp:TextBox runat="server" ID="txtDescripcion" CssClass="form-control" Enabled="False"></asp:TextBox>
                <asp:RequiredFieldValidator runat="server" ID="rfvDescripcion" ErrorMessage="* Se requiere el campo descripción." ForeColor="Red" ControlToValidate="txtDescripcion"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <asp:RadioButtonList runat="server" ID="rblEstado" Enabled="False">
                    <asp:ListItem Value="1" Selected="True">Activo</asp:ListItem>
                    <asp:ListItem Value="0">Inactivo</asp:ListItem>
                </asp:RadioButtonList>
                <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ErrorMessage="* Se requiere el campo descripción." ForeColor="Red" ControlToValidate="rblEstado"></asp:RequiredFieldValidator>
            </div>
                <asp:Label ID="lblEstado" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
