﻿<%@ Page Title="CFT | Eventos" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Eventos.aspx.cs" Inherits="CFT.Admin.Eventos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row col-lg-12">
        <div class="col-lg-12">
            <div class="tabla">
                <h1>Eventos</h1>
                <asp:GridView ID="grvEventos" runat="server" CssClass="table" OnLoad="grvEventos_Load" OnRowCommand="grvEventos_RowCommand" AutoGenerateColumns="False">
                    <Columns>
                        <asp:ButtonField HeaderText="Acción" Text="Seleccionar" CommandName="select" />
                        <asp:BoundField DataField="id_evento" HeaderText="ID" />
                        <asp:BoundField DataField="titulo" HeaderText="Título" />
                        <asp:BoundField DataField="descripcion" HeaderText="Descripción" />
                        <asp:ImageField DataImageUrlField="url_imagen" HeaderText="Imagen">
                        </asp:ImageField>
                        <asp:BoundField DataField="fecha_publicacion" HeaderText="Fecha de publicación" />
                        <asp:BoundField DataField="fecha_evento" HeaderText="Fecha del evento" />
                        <asp:BoundField DataField="hora_inicio" HeaderText="Hora de Inicio" />
                        <asp:BoundField DataField="hora_fin" HeaderText="Hora de fin" />
                        <asp:CheckBoxField DataField="estado" HeaderText="Estado" />
                    </Columns>
                </asp:GridView>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="btn-group">
                        <asp:Button ID="btnAgregar" runat="server" Text="Agregar" CssClass="btn" OnClick="btnAgregar_Click"/>
                        <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" CssClass="btn" OnClick="btnAceptar_Click"/>
                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn" OnClick="btnCancelar_Click"/>
                    </div>
                    <asp:Label runat="server" ID="lblInformacion"></asp:Label>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="form-group">
                        <label>ID</label>
                        <asp:TextBox runat="server" ID="txtID" CssClass="form-control" Enabled="False" ReadOnly="True"/>
                    </div>
                    <div class="form-group">
                        <label>Título</label>
                        <asp:TextBox runat="server" ID="txtTitulo" CssClass="form-control" Enabled="False"/>
                    </div>
                    <div class="form-group">
                        <label>Descripción</label>
                        <asp:TextBox runat="server" ID="txtDescripcion" CssClass="form-control" Enabled="False"/>
                    </div>
                    <div class="form-group">
                        <label>Imagen</label>
                        <asp:FileUpload runat="server" ID="fulImagen" Enabled="False"/>
                        <asp:Label runat="server" ID="lblImagen"></asp:Label>
                    </div>
                    <div class="form-group">
                        <label>Hora de inicio</label>
                        <asp:TextBox runat="server" ID="txtHoraInicio" CssClass="form-control" Enabled="False"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Hora de fin</label>
                        <asp:TextBox CssClass="form-control" runat="server" ID="txtHoraFin" Enabled="False"></asp:TextBox>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="form-group">
                        <label>Fecha del evento</label>
                        <asp:Calendar runat="server" ID="calEventos" Enabled="False"></asp:Calendar>
                    </div>
                    <div class="form-group">
                        <label>Estado</label>
                        <asp:RadioButtonList runat="server" ID="rblEstado" Enabled="False">
                            <asp:ListItem Selected="True" Text="Activo" Value="1"></asp:ListItem>
                            <asp:ListItem Selected="False" Text="Inactivo" Value="0"></asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
