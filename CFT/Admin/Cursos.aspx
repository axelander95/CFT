﻿<%@ Page Title="CFT | Cursos" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Cursos.aspx.cs" Inherits="CFT.Admin.Cursos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-lg-12">
        <div class="row">
        <div class="col-lg-12">

            <asp:GridView CssClass="table" ID="grvCursos" runat="server" AutoGenerateColumns="False" OnLoad="GridView1_Load" OnRowCommand="grvCursos_RowCommand" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                <Columns>
                    <asp:ButtonField CommandName="Select" HeaderText="Seleccionar" Text="Seleccionar" />
                    <asp:BoundField DataField="id_curso" HeaderText="ID" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                    <asp:BoundField DataField="precio_ucsg" HeaderText="Precio ucsg" />
                    <asp:BoundField DataField="precio_publico" HeaderText="Precio público" />
                    <asp:BoundField DataField="maximo_estudiantes" HeaderText="Máximo de estudiantes" />
                    <asp:BoundField DataField="minimo_estudiantes" HeaderText="Mínimo de estudiantes" />
                    <asp:CheckBoxField DataField="certificacion" HeaderText="Certificación" />
                    <asp:BoundField DataField="fecha_inicio" HeaderText="Fecha de inicio" />
                    <asp:ImageField DataImageUrlField="url_imagen" HeaderText="Imagen">
                    </asp:ImageField>
                    <asp:CheckBoxField DataField="estado" HeaderText="Estado" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="btn-group">
                    <asp:Button runat="server" CssClass="btn" Text="Agregar" ID="btnAgregar" OnClick="btnAgregar_Click" CausesValidation="false"/>
                    <asp:Button runat="server" CssClass="btn" Text="Aceptar" ID="btnAceptar" Enabled="False" OnClick="btnAceptar_Click" CausesValidation="true"/>
                    <asp:Button runat="server" CssClass="btn" Text="Cancelar" ID="btnCancelar" Enabled="False" OnClick="btnCancelar_Click" CausesValidation="false"/>
                </div>
                <asp:Label ID="lblInformacion" runat="server"></asp:Label>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="form-group">
                    <label>ID</label>
                    <asp:TextBox ID="txtID" runat="server" CssClass="form-control" Enabled="False" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvNombre" ForeColor="Red" ErrorMessage="* Campo requerido" ControlToValidate="txtNombre"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Descripción</label>
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvDescripcion" ForeColor="Red" ErrorMessage="* Campo requerido" ControlToValidate="txtDescripcion"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Categoría</label>
                    <asp:DropDownList runat="server" ID="cmbCategoria" CssClass="form-control" Enabled="False" OnLoad="cmbCategoria_Load"></asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvCategoria" ForeColor="Red" ErrorMessage="* Campo requerido" ControlToValidate="cmbCategoria"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Objetivo</label>
                    <asp:TextBox ID="txtObjetivo" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvObjetivo" ForeColor="Red" ErrorMessage="* Campo requerido" ControlToValidate="txtObjetivo"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Dirigido a</label>
                    <asp:TextBox ID="txtDirigidoA" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvDirigidoA" ForeColor="Red" ErrorMessage="* Campo requerido" ControlToValidate="txtDirigidoA"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Prerequisitos</label>
                    <textarea id="txtPrerequisitos" runat="server" rows="4" class="form-control" disabled="disabled"></textarea>
                    <asp:RequiredFieldValidator runat="server" ID="rfvPrerequisitos" ForeColor="Red" ErrorMessage="* Campo requerido" ControlToValidate="txtPrerequisitos"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Aprendizaje</label>
                    <asp:TextBox ID="txtAprendizaje" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvAprendizaje" ForeColor="Red" ErrorMessage="* Campo requerido" ControlToValidate="txtAprendizaje"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Precio UCSG</label>
                    <asp:TextBox ID="txtPrecioUCSG" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvPrecioUCSG" ForeColor="Red" ErrorMessage="* Campo requerido" ControlToValidate="txtPrecioUCSG"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Precio público</label>
                    <asp:TextBox ID="txtPrecioPublico" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvPrecioPublico" ForeColor="Red" ErrorMessage="* Campo requerido" ControlToValidate="txtPrecioPublico"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="form-group">
                    <label>Máximo de estudiantes</label>
                    <asp:TextBox ID="txtMaximoEstudiantes" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvMaximoEstudiantes" ForeColor="Red" ErrorMessage="* Campo requerido" ControlToValidate="txtMaximoEstudiantes"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Mínimo de estudiantes</label>
                    <asp:TextBox ID="txtMinimoEstudiantes" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvMinimoEstudiantes" ForeColor="Red" ErrorMessage="* Campo requerido" ControlToValidate="txtMinimoEstudiantes"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Docente</label>
                    <asp:DropDownList ID="cmbDocente" runat="server" CssClass="form-control" Enabled="False" OnLoad="cmbDocente_Load"></asp:DropDownList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvDocente" ForeColor="Red" ErrorMessage="* Campo requerido" ControlToValidate="cmbDocente"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Certificación</label>
                    <asp:RadioButtonList runat="server" ID="rblCertificacion" Enabled="False">
                        <asp:ListItem Text="Sí" Selected="True" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Selected="False" Value="0"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator runat="server" ID="rfvCertificacion" ForeColor="Red" ErrorMessage="* Campo requerido" ControlToValidate="rblCertificacion"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Horas</label>
                    <asp:TextBox ID="txtHoras" runat="server" CssClass="form-control" Enabled="False"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" ID="rfvHoras" ForeColor="Red" ErrorMessage="* Campo requerido" ControlToValidate="txtHoras"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Fecha de inicio</label>
                    <asp:Calendar runat="server" ID="calFechaInicio" Enabled="False" SelectedDate="09/09/2015 00:40:09"></asp:Calendar>
                </div>
                <div class="form-group">
                    <label>Imagen</label>
                    <asp:FileUpload runat="server" ID="fulImagen" Enabled="False"/>
                    <asp:RequiredFieldValidator runat="server" ID="rfvImagen" ForeColor="Red" ErrorMessage="* Debe elegir una imagen" ControlToValidate="fulImagen"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Estado</label>
                    <asp:RadioButtonList runat="server" ID="cmbEstado" Enabled="False">
                        <asp:ListItem Text="Activo" Selected="True" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Inactivo" Selected="False" Value="0"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="form-group">
                    <label>Horario</label>
                    <asp:Button ID="btnHorario" Text="+" runat="server" Enabled="False" OnClick="btnHorario_Click" CausesValidation="False"/>
                    <asp:GridView runat="server" ID="grvHorario" AutoGenerateColumns="False" CssClass="table" Enabled="False" OnRowCommand="grvHorario_RowCommand" OnRowDataBound="grvHorario_RowDataBound" OnRowDeleting="grvHorario_RowDeleting">
                        <Columns>
                            <asp:TemplateField HeaderText="Días">
                                <ItemTemplate>
                                    <asp:DropDownList ID="id_dia" runat="server" CssClass="form-control">
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Desde">
                                <ItemTemplate>
                                    <asp:TextBox ID="desde" runat="server" CssClass="form-control"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hasta">
                                <ItemTemplate>
                                    <asp:TextBox ID="hasta" runat="server" CssClass="form-control"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:ButtonField HeaderText="Acción" Text="Eliminar" CommandName="Delete" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>
