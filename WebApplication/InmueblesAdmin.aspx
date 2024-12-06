<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPrincipal.Master" AutoEventWireup="true" CodeBehind="InmueblesAdmin.aspx.cs" Inherits="WebApplication.InmueblesAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <!-- Filtro de búsqueda -->
        <!--div class="row mb-4">
            <div class="col-12">
                <div class="input-group">
                    <asp:TextBox ID="tbxFiltro" placeholder="Buscar" CssClass="form-control" OnTextChanged="tbxFiltro_TextChanged" AutoPostBack="true" runat="server"></asp:TextBox>
                    <span class="input-group-text">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </span>
                </div>
            </div>
        </div>-->
        <!-- Tabla de artículos -->
        <div class="table-responsive">
            <asp:GridView ID="dgvInmuebles" DataKeyNames="ID" OnSelectedIndexChanged="dgvInmuebles_SelectedIndexChanged" runat="server" AutoGenerateColumns="false" CssClass="table table-dark table-bordered">
                <Columns>
                    <%--                    <asp:TemplateField HeaderText="Imagen">
                        <ItemTemplate>
                            <asp:Image runat="server" ID="imgArticulo" ImageUrl='<%# GetImageUrl(Eval("ImagenUrl")) %>' AlternateText="Imagen del Artículo" Width="100px" Height="100px" />
                        </ItemTemplate>
                    </asp:TemplateField>--%>

                    <%--                  <asp:BoundField HeaderText="Tipo" DataField="Tipo" />--%>

                    <asp:BoundField HeaderText="Descripcion" DataField="Descripcion" />
                    <asp:BoundField HeaderText="Precio" DataField="Precio" />
                    <asp:BoundField HeaderText="Garage" DataField="Garages" />
                    <asp:BoundField HeaderText="Dormitorios" DataField="Dormitorios" />
                    <asp:BoundField HeaderText="Baños" DataField="Banos" />
                    <asp:BoundField HeaderText="Antigüedad" DataField="Antiguedad" />
                    <asp:BoundField HeaderText="Expensas" DataField="Expensas" />
                    <asp:BoundField HeaderText="Superficie" DataField="Superficie" />

                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Select" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-outline-primary btn-sm">
                    <i class="fa-solid fa-pen-to-square"></i>
                    <span class="visually-hidden">Editar</span>
                </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <div class="text-end mb-4">
            <a href="AgregarInmueble.aspx" class="btn btn-success btn-lg">
                <i class="fa-solid fa-plus"></i>
            </a>
        </div>
        <div>
            <a href="Administrador.aspx" class="btn btn-success">Volver</a>
        </div>
    </div>
</asp:Content>
