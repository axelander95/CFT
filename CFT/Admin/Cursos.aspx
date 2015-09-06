<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Cursos.aspx.cs" Inherits="CFT.Admin.Cursos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="col-lg-12">
        <div class="row">
        <div class="col-lg-12">

            <asp:GridView ID="GridView1" runat="server">
                <Columns>
                    <asp:BoundField DataField="id_curso" HeaderText="ID" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                    <asp:BoundField DataField="id_categoría" HeaderText="ID Categoría" />
                    <asp:BoundField DataField="objetivo" HeaderText="Objetivo" />
                    <asp:BoundField DataField="dirigido_a" HeaderText="Dirigido a" />
                    <asp:BoundField DataField="pre_requisitos" HeaderText="Pre-requisitos" />
                    <asp:BoundField DataField="aprendizaje" HeaderText="Aprendizaje" />
                    <asp:BoundField DataField="precio_ucsg" HeaderText="Precio ucsg" />
                    <asp:BoundField DataField="precio_publico" HeaderText="Precio público" />
                    <asp:BoundField DataField="maximo_estudiantes" HeaderText="Máximo de estudiantes" />
                    <asp:BoundField DataField="minimo_estudiantes" HeaderText="Mínimo de estudiantes" />
                    <asp:BoundField DataField="id_docente" HeaderText="ID Docente" />
                    <asp:CheckBoxField DataField="certificacion" HeaderText="Certificación" />
                    <asp:BoundField DataField="horas" HeaderText="Horas" />
                    <asp:BoundField DataField="fecha_inicio" HeaderText="Fecha de inicio" />
                    <asp:ImageField DataImageUrlField="url_imagen" HeaderText="Imagen">
                    </asp:ImageField>
                    <asp:CheckBoxField DataField="estado" HeaderText="Estado" />
                </Columns>
            </asp:GridView>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="btn-group">
                    <asp:Button runat="server" CssClass="btn" Text="Agregar" ID="btnAgregar"/>
                    <asp:Button runat="server" CssClass="btn" Text="Aceptar" ID="btnAceptar"/>
                    <asp:Button runat="server" CssClass="btn" Text="Cancelar" ID="btnCancelar"/>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="form-group">
                    <label>ID</label>
                    <asp:TextBox ID="txtID" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Descripción</label>
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Categoría</label>
                    <asp:DropDownList runat="server" ID="cmbCategoria" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Objetivo</label>
                    <asp:TextBox ID="txtObjetivo" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Dirigido a</label>
                    <asp:TextBox ID="txtDirigidoA" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Prerequisitos</label>
                    <textarea id="txtPrerequisitos" runat="server" rows="4" class="form-control"></textarea>
                </div>
                <div class="form-group">
                    <label>Aprendizaje</label>
                    <asp:TextBox ID="txtAprendizaje" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Precio UCSG</label>
                    <asp:TextBox ID="txtPrecioUCSG" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Horario</label>
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
                    <label>Máximo de estudiantes</label>
                    <asp:TextBox ID="txtMaximoEstudiantes" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Mínimo de estudiantes</label>
                    <asp:TextBox ID="txtMinimoEstudiantes" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Docente</label>
                    <asp:DropDownList ID="cmbDocente" runat="server" CssClass="form-control"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <label>Certificación</label>
                    <asp:RadioButtonList runat="server" ID="rblCertificacion">
                        <asp:ListItem Text="Sí" Selected="True" Value="1"></asp:ListItem>
                        <asp:ListItem Text="No" Selected="False" Value="0"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                <div class="form-group">
                    <label>Horas</label>
                    <asp:TextBox ID="txtHoras" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Fecha de inicio</label>
                    <asp:Calendar runat="server" ID="calFechaInicio"></asp:Calendar>
                </div>
                <div class="form-group">
                    <label>Imagen</label>
                    <asp:FileUpload runat="server" ID="fulImagen"/>
                </div>
                <div class="form-group">
                    <label>Estado</label>
                    <asp:RadioButtonList runat="server" ID="cmbEstado">
                        <asp:ListItem Text="Activo" Selected="True" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Inactivo" Selected="False" Value="0"></asp:ListItem>
                    </asp:RadioButtonList>
                </div>
            </div>
        </div>
    </div>
    </div>
</asp:Content>
