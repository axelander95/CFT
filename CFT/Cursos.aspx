<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cursos.aspx.cs" Inherits="CFT.Cursos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>Estos son los cursos que CFT puede ofrecerte</h1>
                <asp:DataList ID="dlEventos" runat="server" Width="100%" CellPadding="4" ForeColor="#333333" OnItemCommand="dlEventos_ItemCommand">
                    <AlternatingItemStyle BackColor="White" ForeColor="#284775" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <ItemStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <ItemTemplate>
                            <table class="table">
                                <tr>
                                    <td><h2><%#Eval("nombre") %></h2></td>
                                </tr>
                                <tr>
                                    <td><asp:Image runat="server" ImageUrl='<%#Eval("url_imagen") %>'/></td>
                                </tr>
                                <tr>
                                    <td><p><%#Eval("descripcion") %></p></td>
                                </tr>
                                <tr>
                                    <td><p><h3>Pre-requisitos del curso:<br /></h3><%#Eval("pre_requisitos") %></p></td>
                                </tr>
                                <tr>
                                    <td><asp:Button runat="server" Text="Inscribirme" CssClass="btn" ID="btnInscribirme" CommandName="Inscribir"/></td>
                                </tr>
                                <tr>
                                    <td><asp:Label runat="server" ID="lblID" Visible="false" Text='<%#Eval("id_curso") %>'></asp:Label></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
    </asp:DataList>
            </div>
        </div>
    </div>
</asp:Content>
