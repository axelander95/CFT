<%@ Page Title="CFT | Recuperar cuenta" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recover.aspx.cs" Inherits="CFT.Account.Recover" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container row">
        <div class="col-lg-12">
            <div class="col-lg-4 col-md-4 col-sm-12">
                <div class="form-group">
                    <label>Ingresa tu nombre de usuario</label>
                    <asp:TextBox ID="txtNombreUsuario" runat="server" CssClass="form-control" placeholder="Nombre de usuario"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNombreUsuario" runat="server" ControlToValidate="txtNombreUsuario" ErrorMessage="* Ingrese su nombre de usuario" ForeColor="Red"></asp:RequiredFieldValidator> 
                </div>
                <div class="form-group">
                    <asp:Label ID="lblInformacion" runat="server"></asp:Label>
                    <asp:Button runat="server" ID="btnSolicitar" Text="Solicitar" CssClass="btn" OnClick="btnSolicitar_Click"/>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12">
                <div class="form-group" id="divPregunta" runat="server">
                    <label>Responde a la pregunta secreta: </label>
                    <asp:DropDownList runat="server" ID="cmbPregunta" OnLoad="cmbPregunta_Load" CssClass="form-control" Enabled="False"></asp:DropDownList>
                    <div class="form-group"><asp:TextBox runat="server" ID="txtRespuesta" CssClass="form-control" placeholder="Respuesta secreta"></asp:TextBox></div>
                    <asp:RequiredFieldValidator Enabled="false" ID="rfvRespuesta" runat="server" ControlToValidate="txtRespuesta" ErrorMessage="* Responde a la pregunta secreta" ForeColor="Red"></asp:RequiredFieldValidator>
                    <div class="form-group">
                    <asp:Button runat="server" ID="btnValidar" Text="Validar" CssClass="btn" OnClick="btnValidar_Click"/>
                </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-12">
                <div class="form-group" id="divContrasena" runat="server">
                    <label>Nueva contraseña</label>
                    <asp:TextBox TextMode="Password" runat="server" placeholder="***********" ID="txtContrasena" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator Enabled="false" runat="server" ID="rfvContrasena" ControlToValidate="txtContrasena" ErrorMessage="* Ingrese la nueva contraseña" ForeColor="Red"></asp:RequiredFieldValidator>
                    <div class="form-group">
                    <asp:Button runat="server" Text="Cambiar contraseña" CssClass="btn" ID="btnCambiar" OnClick="btnCambiar_Click"/>
                </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
