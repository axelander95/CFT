<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Docentes.aspx.cs" Inherits="CFT.Admin.Docentes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            
            <asp:GridView CssClass="table" ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="id_docente" HeaderText="ID" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="cedula" HeaderText="Cédula" />
                    <asp:BoundField DataField="direccion" HeaderText="Dirección" />
                    <asp:BoundField DataField="telefono_casa" HeaderText="Teléfono de casa" />
                    <asp:BoundField DataField="telefono_trabajo" HeaderText="Teléfono de trabajo" />
                    <asp:BoundField DataField="celular" HeaderText="Celular" />
                    <asp:BoundField DataField="correo_electronico" HeaderText="Correo electrónico" />
                    <asp:BoundField DataField="id_profesion" HeaderText="ID Profesión" />
                    <asp:BoundField DataField="id_universidad" HeaderText="ID Universidad" />
                    <asp:BoundField DataField="experiencia" HeaderText="Experiencia" />
                    <asp:CheckBoxField DataField="estado" HeaderText="Estado" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="btn-group">
                <asp:Button runat="server" ID="btnAgregar" Text="Agregar" CssClass="btn"/>
                <asp:Button runat="server" ID="btnAceptar" Text="Aceptar" CssClass="btn"/>
                <asp:Button runat="server" ID="btnCancelar" Text="Cancelar" CssClass="btn"/>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="form-group">
                    <label>ID</label>
                    <asp:TextBox ID="txtID" runat="server" CssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label>Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label>Cédula</label>
                    <asp:TextBox ID="txtCedula" runat="server" CssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label>Dirección</label>
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label>Teléfono de casa</label>
                    <asp:TextBox ID="txtTelefonoCasa" runat="server" CssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label>Teléfono de trabajo</label>
                    <asp:TextBox ID="txtTelefonoTrabajo" runat="server" CssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label>Horario</label><asp:Button runat="server" CssClass="btn" ID="btnAdd" Text="+" OnClick="btnAdd_Click"/>
                    <asp:GridView runat="server" ID="grvHorario" AutoGenerateColumns="False" CssClass="table">
                        <Columns>
                            <asp:TemplateField HeaderText="Días">
                                <ItemTemplate>
                                    <asp:DropDownList ID="cmbDias" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Desde"></asp:TemplateField>
                            <asp:TemplateField HeaderText="Hasta"></asp:TemplateField>
                            <asp:ButtonField HeaderText="Acción" Text="Eliminar" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="form-group">
                    <label>Celular</label>
                    <asp:TextBox ID="txtCelular" runat="server" CssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label>Correo electrónico</label>
                    <asp:TextBox ID="txtCorreoElectronico" runat="server" CssClass="form-control"/>
                </div>
                <div class="form-group">
                    <label>Profesión</label>
                    <asp:DropDownList runat="server" ID="cmbProfesion" CssClass="form-control">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Universidad</label>
                    <asp:DropDownList runat="server" ID="cmbUniversidad" CssClass="form-control">
                    </asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Experiencia</label>
                    <textarea runat="server" rows="5" id="txtExperiencia" class="form-control"></textarea>
                </div>
                <div class="form-group">
                    <label>Estado</label>
                    <asp:RadioButtonList runat="server" ID="rblEstado">
                        <asp:ListItem Selected="True" Text="Activo" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Inactivo" Value="0"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
