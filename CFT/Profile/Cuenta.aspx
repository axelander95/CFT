<%@ Page Title="CFT | Mi cuenta" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cuenta.aspx.cs" Inherits="CFT.Profile.Cuenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <h2>Mis datos personales</h2>
                    <ul class="list">
                        <li><label><b>Nombre o Razón social: </b><asp:Label ID="lblNombre" runat="server"></asp:Label></label></li>
                        <li><label><b>Correo electrónico: </b><asp:Label ID="lblCorreo" runat="server"></asp:Label></label></li>
                        <li><label><b>Nombre de usuario: </b><asp:Label ID="lblUsuario" runat="server"></asp:Label></label></li>
                        <li><a href="../Account/Recover.aspx">Cambiar contraseña</a></li>
                    </ul>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-12">
                    <h2>Mis cursos</h2>
                    <asp:GridView runat="server" ID="grvCursos" CssClass="table" AutoGenerateColumns="False" OnLoad="grvCursos_Load" OnRowCommand="grvCursos_RowCommand" OnRowDeleting="grvCursos_RowDeleting">
                        <Columns>
                            <asp:BoundField DataField="id_curso" HeaderText="ID" />
                            <asp:BoundField DataField="nombre" HeaderText="Curso" />
                            <asp:ButtonField CommandName="Delete" HeaderText="Acción" Text="Eliminar inscripción" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
