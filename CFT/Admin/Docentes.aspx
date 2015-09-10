<%@ Page Title="CFT | Docentes" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Docentes.aspx.cs" Inherits="CFT.Admin.Docentes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            
            <asp:GridView CssClass="table" ID="grvDocentes" runat="server" AutoGenerateColumns="False" OnLoad="GridView1_Load" OnRowCommand="grvDocentes_RowCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:ButtonField CommandName="Select" HeaderText="Seleccionar" Text="Seleccionar" />
                    <asp:BoundField DataField="id_docente" HeaderText="ID" />
                    <asp:BoundField DataField="nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="cedula" HeaderText="Cédula" />
                    <asp:BoundField DataField="direccion" HeaderText="Dirección" />
                    <asp:BoundField DataField="telefono_casa" HeaderText="Teléfono de casa" />
                    <asp:BoundField DataField="celular" HeaderText="Celular" />
                    <asp:BoundField DataField="correo_electronico" HeaderText="Correo electrónico" />
                    <asp:BoundField DataField="experiencia" HeaderText="Experiencia" />
                    <asp:CheckBoxField DataField="estado" HeaderText="Estado" />
                </Columns>
                <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <div class="btn-group">
                <asp:Button runat="server" ID="btnAgregar" Text="Agregar" CssClass="btn" OnClick="btnAgregar_Click" CausesValidation="False"/>
                <asp:Button runat="server" ID="btnAceptar" Text="Aceptar" CssClass="btn" Enabled="False" OnClick="btnAceptar_Click"/>
                <asp:Button runat="server" ID="btnCancelar" Text="Cancelar" CssClass="btn" Enabled="False" OnClick="btnCancelar_Click" CausesValidation="False"/>
            </div>
            <asp:Label runat="server" ID="lblMensaje"></asp:Label>
        </div>
        <div class="col-lg-12">
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="form-group">
                    <label>ID</label>
                    <asp:TextBox ID="txtID" runat="server" CssClass="form-control" Enabled="False" ReadOnly="True"/>
                </div>
                <div class="form-group">
                    <label>Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Enabled="False"/>
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="* Se requiere este campo" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Cédula</label>
                    <asp:TextBox ID="txtCedula" runat="server" CssClass="form-control" Enabled="False"/>
                    <asp:RequiredFieldValidator ID="rfvCedula" runat="server" ControlToValidate="txtCedula" ErrorMessage="* Se requiere este campo" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Dirección</label>
                    <asp:TextBox ID="txtDireccion" runat="server" CssClass="form-control" Enabled="False"/>
                    <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion" ErrorMessage="* Se requiere este campo" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Teléfono de casa</label>
                    <asp:TextBox ID="txtTelefonoCasa" runat="server" CssClass="form-control" Enabled="False"/>
                </div>
                <div class="form-group">
                    <label>Teléfono de trabajo</label>
                    <asp:TextBox ID="txtTelefonoTrabajo" runat="server" CssClass="form-control" Enabled="False"/>
                </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-12">
                <div class="form-group">
                    <label>Celular</label>
                    <asp:TextBox ID="txtCelular" runat="server" CssClass="form-control" Enabled="False"/>
                </div>
                <div class="form-group">
                    <label>Correo electrónico</label>
                    <asp:TextBox ID="txtCorreoElectronico" runat="server" CssClass="form-control" Enabled="False"/>
                    <asp:RequiredFieldValidator ID="rfvCorreoElectronico" runat="server" ControlToValidate="txtCorreoElectronico" ErrorMessage="* Se requiere este campo" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Profesión</label>
                    <asp:DropDownList runat="server" ID="cmbProfesion" CssClass="form-control" Enabled="False" OnLoad="cmbProfesion_Load"> 
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvProfesion" runat="server" ControlToValidate="cmbProfesion" ErrorMessage="* Se requiere este campo" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Universidad</label>
                    <asp:DropDownList runat="server" ID="cmbUniversidad" CssClass="form-control" Enabled="False" OnLoad="cmbUniversidad_Load">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvUniversidad" runat="server" ControlToValidate="cmbUniversidad" ErrorMessage="* Se requiere este campo" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Experiencia</label>
                    <textarea runat="server" rows="5" id="txtExperiencia" class="form-control" disabled="disabled"></textarea>
                    <asp:RequiredFieldValidator ID="rfvExperiencia" runat="server" ControlToValidate="txtExperiencia" ErrorMessage="* Se requiere este campo" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Estado</label>
                    <asp:RadioButtonList runat="server" ID="rblEstado" Enabled="False">
                        <asp:ListItem Selected="True" Text="Activo" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Inactivo" Value="0"></asp:ListItem>
                    </asp:RadioButtonList>
                    <asp:RequiredFieldValidator ID="rfvEstado" runat="server" ControlToValidate="rblEstado" ErrorMessage="* Se requiere este campo" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Certificados</label>

                    <asp:CheckBoxList ID="chlCertificados" runat="server" OnLoad="chlCertificados_Load">
                    </asp:CheckBoxList>

                </div>
            </div>
            <div class="col-lg-12">
                <div class="form-group">
                    <label>Horario</label><asp:Button runat="server" CssClass="btn" ID="btnAdd" Text="+" OnClick="btnAdd_Click1" Enabled="False" CausesValidation="False"/>
                    <asp:GridView runat="server" ID="grvHorario" AutoGenerateColumns="False" CssClass="table" OnRowDataBound="grvHorario_RowDataBound" Enabled="False" OnRowCommand="grvHorario_RowCommand" OnRowDeleting="grvHorario_RowDeleting">
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
</asp:Content>
