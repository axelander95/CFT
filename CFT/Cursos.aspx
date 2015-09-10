<%@ Page Title="CFT | Cursos" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cursos.aspx.cs" Inherits="CFT.Cursos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-sm-12">
                <h1>Estos son los cursos que CFT puede ofrecerte</h1>
                <asp:DataList ID="dlEventos" runat="server" Width="100%" CellPadding="4" ForeColor="Black" OnItemCommand="dlEventos_ItemCommand" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" GridLines="Horizontal">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <ItemTemplate>
                            <div class="col-lg-12">
                                <h2><%#Eval("nombre") %></h2>
                                <asp:Image runat="server" ImageUrl='<%#Eval("url_imagen") %>' Width="100%"/>
                                <p><%#Eval("descripcion") %></p>
                                <p><h3>Pre-requisitos del curso:<br /></h3><%#Eval("pre_requisitos") %></p>
                                <ul>
                                    <h3>Precios</h3>
                                    <li>Precio UCSG: <%#Eval("precio_ucsg") %></li>
                                    <li>Precio general: <%#Eval("precio_publico") %></li>
                                </ul>
                                <asp:Button runat="server" Text="Inscribirme" CssClass="btn" ID="btnInscribirme" CommandName="Inscribir"/>
                                <asp:Label runat="server" ID="lblID" Visible="false" Text='<%#Eval("id_curso") %>'></asp:Label>
                            </div>
                        </ItemTemplate>
                    <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
    </asp:DataList>
            </div>
        </div>
    </div>
</asp:Content>
