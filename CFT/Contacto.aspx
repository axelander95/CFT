<%@ Page Title="CFT | Contacto" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="CFT.Contacto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="row container">
        <div class="col-lg-12">
            <div class="col-lg-4 col-md-2 col-sm-12">

            </div>
            <div class="col-lg-4 col-md-8 col-sm-12">
                <h1>Contáctenos</h1>
                <div class="form-group">
                    <label>Nombre (requerido)</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" placeholder="Nombre"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="* Se requiere el nombre" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Asunto (opcional)</label>
                    <asp:TextBox ID="txtAsunto" runat="server" CssClass="form-control" placeholder="Asunto"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Correo electrónico (requerido)</label>
                    <asp:TextBox ID="txtCorreoElectronico" runat="server" CssClass="form-control" placeholder="Correo electrónico"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCorreo" runat="server" ControlToValidate="txtCorreoElectronico" ErrorMessage="* Se requiere el correo" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Mensaje (requerido)</label>
                    <asp:TextBox ID="txtMensaje" runat="server" CssClass="form-control" TextMode="MultiLine" placeholder="Tu mensaje aquí" Rows="5"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNombre1" runat="server" ControlToValidate="txtMensaje" ErrorMessage="* Se requiere el mensaje" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblInformacion" runat="server"></asp:Label>
                    <asp:Button ID="btnEnviar" runat="server" CssClass="btn" Text="Enviar" OnClick="btnEnviar_Click"/>
                </div>
            </div>
            <div class="col-lg-4 col-md-2 col-sm-12">
                
            </div>
        </div>
    </div>
</asp:Content>
