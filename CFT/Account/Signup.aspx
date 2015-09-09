<%@ Page Title="CFT | Registro" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Centro_de_formación_tecnológica__CFT_.Account.Signup" %>
<asp:Content ID="cntHead" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="cntBody" ContentPlaceHolderID="main" runat="server">
    <div class="row container">
        <div class="col-lg-12">
            <h1>Registro de usuarios</h1>
            <p>Adquiere una cuenta y disfruta de todos los beneficios de ser un usuario de nuestra comunidad, completa el siguiente formulario de registro.</p>
            <p>¿Ya posees una cuenta? <a href="Login.aspx">Accede.</a></p>
            <div class="col-lg-6 col-md-6 col-sm-12">
                <div class="form-group">
                    <label>Tipo de identificación</label>
                    <asp:DropDownList runat="server" CssClass="form-control" ID="cmbTipoIdentificacion"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Nombre o razón social</label>
                    <input type="text" class="form-control" placeholder="Nombre o razón social" runat="server" id="txtNombre"/>
                    <asp:RequiredFieldValidator runat="server" ID="rfvNombre" ControlToValidate="txtNombre" ForeColor="Red">* Se requiere el nombre o razón social.</asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Nombre de usuario</label>
                    <input id="txtUsuario" type="text" class="form-control" placeholder="Nombre de usuario" runat="server"/>
                    <asp:RequiredFieldValidator runat="server" ID="rfvUsuario" ControlToValidate="txtUsuario" ForeColor="Red">* Se requiere un nombre de usuario válido.</asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Pregunta secreta</label>
                    <asp:DropDownList runat="server" CssClass="form-control" ID="cmbPreguntaSecreta"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Sexo</label>
                    <asp:RadioButtonList runat="server" ID="rblSexo">
                        <asp:ListItem Selected="True" Value="M">Masculino</asp:ListItem>
                        <asp:ListItem Value="F">Femenino</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="form-group">
                    <label>Teléfono</label>
                    <input type="text" class="form-control" placeholder="Teléfono" runat="server" id="txtTelefono"/>
                </div>
                <div class="form-group">
                    <label>Página web</label>
                    <input type="text" class="form-control" placeholder="Página web" runat="server" id="txtPaginaWeb"/>
                </div>
                <div class="form-group">
                    <label>Universidad</label>
                    <asp:DropDownList runat="server" CssClass="form-control" ID="cmbUniversidad"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Fecha de nacimiento</label>
                    <input type="text" class="form-control" placeholder="dd/mm/aaaa" runat="server" id="txtFechaNacimiento"/>
                    <asp:RequiredFieldValidator runat="server" ID="rfvFechaNacimiento" ControlToValidate="txtFechaNacimiento" ForeColor="Red">* Se requiere la fecha de nacimiento.</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-12">
                <div class="form-group">
                    <label>Nº de identificación</label>
                    <input type="text" class="form-control" placeholder="Identificación" runat="server" id="txtIdentificacion"/>
                    <asp:RequiredFieldValidator runat="server" ID="rfvIdentificacion" ControlToValidate="txtIdentificacion" ForeColor="Red">* Se requiere el número de identificación.</asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Correo electrónico</label>
                    <input type="text" class="form-control" placeholder="Correo electrónico" runat="server" id="txtCorreoElectronico"/>
                    <asp:RequiredFieldValidator runat="server" ID="rfvCorreoElectronico" ControlToValidate="txtCorreoElectronico" ForeColor="Red">* Se requiere un correo electrónico válido.</asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Contraseña</label>
                    <input type="password" class="form-control" placeholder="Contraseña" runat="server" id="txtContraseña"/>
                    <asp:RequiredFieldValidator runat="server" ID="rfvContraseña" ControlToValidate="txtContraseña" ForeColor="Red">* Se debe proporcionar una contraseña</asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Respuesta secreta</label>
                    <input type="text" class="form-control" placeholder="Respuesta secreta" runat="server" id="txtRespuestaSecreta"/>
                    <asp:RequiredFieldValidator runat="server" ID="rfvRespuestaSecreta" ControlToValidate="txtRespuestaSecreta" ForeColor="Red">* Se debe responder la pregunta secreta.</asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Dirección</label>
                    <input type="text" class="form-control" placeholder="Dirección" runat="server" id="txtDireccion"/>

                </div>
                <div class="form-group">
                    <br />
                    <label>Celular</label>
                    <input type="text" class="form-control" placeholder="Celular" runat="server" id="txtCelular"/>
                </div>
                <div class="form-group">
                    <label>Ocupación</label>
                    <asp:DropDownList runat="server" CssClass="form-control" ID="cmbOcupacion"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Carrera</label>
                    <asp:DropDownList runat="server" CssClass="form-control" ID="cmbCarrera"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Intereses</label>
                    <asp:CheckBoxList runat="server" ID="chlIntereses"></asp:CheckBoxList>
                </div>
                <asp:Button runat="server" CssClass="active btn" Text="Registrarme" OnClick="Unnamed1_Click"/>
                <asp:Label runat="server" ID="lblInformacion" Text=""></asp:Label>
            </div>
            </div>
        </div>
</asp:Content>
