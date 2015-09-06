<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Centro_de_formación_tecnológica__CFT_.Account.Login" %>
<asp:Content ID="cntHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="cntBody" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-4 col-md-6 col-sm-12">
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <h1>Acceso de usuarios</h1>
                    <p>Regístrate en los nuevos cursos que tenemos para ti. ¿No tienes una cuenta? <a href="Signup.aspx">Regístrate aquí.</a></p>
                    <div class="form-group">
                        <label >Nombre de usuario</label>
                        <input type="text" class="form-control" id="txtUsuario" runat="server" placeholder="Nombre de usuario" />
                    </div>
                    <div class="form-group">
                        <label>Contraseña</label>
                        <input type="password" class="form-control" id="txtPassword" runat="server" placeholder="Contraseña"/>
                    </div>
                    <p>¿Has olvidado tu contraseña? <a href="Recover.aspx">Recupérala.</a></p>
                    <p><a href="../Default.aspx">Volver a la página de inicio.</a></p>
                    <asp:Button runat="server" ID="btnAcceder" Text="Acceder" CssClass="btn"/>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12">
                </div>
            </div>
        </div> 
    </div>
</asp:Content>
