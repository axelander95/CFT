<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Eventos.aspx.cs" Inherits="CFT.Eventos" EnableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <h2>Elige una fecha de eventos</h2>
                    <asp:Calendar runat="server" ID="calEventos" BackColor="White" BorderColor="White" BorderWidth="1px" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="190px" NextPrevFormat="FullMonth" Width="350px" OnSelectionChanged="calEventos_SelectionChanged" OnLoad="calEventos_Load">
                        <DayHeaderStyle Font-Bold="True" Font-Size="8pt" />
                        <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                        <TitleStyle BackColor="White" BorderColor="Black" BorderWidth="4px" Font-Bold="True" Font-Size="12pt" ForeColor="#333399" />
                        <TodayDayStyle BackColor="#CCCCCC" />

                    </asp:Calendar>
                </div>
                <div class="col-lg-8 col-md-6 col-sm-12">
                    <asp:DataList runat="server" ID="dlEventos" Width="100%" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal" OnLoad="dlEventos_Load">
                        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                        <ItemTemplate>
                            <h2><%#Eval("titulo") %></h2>
                            <asp:Image runat="server" ImageUrl='<%# Eval("url_imagen") %>' Width="100%"/>
                            <p><%#Eval("descripcion") %></p>
                            <label><b>Datos del evento</b></label>
                            <ul>
                                <li>Fecha: <%#Eval("fecha_evento") %></li>
                                <li>Hora de inicio: <%# Eval("hora_inicio") %></li>
                                <li>Hora de fin: <%#Eval("hora_fin") %></li>
                            </ul>
                            <label>Publicado: <%#Eval("fecha_publicacion") %></label>
                        </ItemTemplate>
                        <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    </asp:DataList>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
