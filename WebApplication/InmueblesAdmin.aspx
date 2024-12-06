<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPrincipal.Master" AutoEventWireup="true" CodeBehind="InmueblesAdmin.aspx.cs" Inherits="WebApplication.InmueblesAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="table-responsive shadow-sm rounded">
            <asp:GridView ID="dgvInmuebles" DataKeyNames="ID" OnSelectedIndexChanged="dgvInmuebles_SelectedIndexChanged" runat="server" AutoGenerateColumns="false" 
                CssClass="table table-hover table-striped table-bordered align-middle">
                <Columns>
                    <asp:BoundField HeaderText="Descripción" DataField="Descripcion" />
                    <asp:BoundField HeaderText="Precio" DataField="Precio" DataFormatString="{0:C}" />
                    <asp:BoundField HeaderText="Garages" DataField="Garages" />
                    <asp:BoundField HeaderText="Dormitorios" DataField="Dormitorios" />
                    <asp:BoundField HeaderText="Baños" DataField="Banos" />
                    <asp:BoundField HeaderText="Antigüedad" DataField="Antiguedad" />
                    <asp:BoundField HeaderText="Expensas" DataField="Expensas" DataFormatString="{0:C}" />
                    <asp:BoundField HeaderText="Superficie" DataField="Superficie" DataFormatString="{0} m²" />
                    
                    <asp:TemplateField HeaderText="Acciones">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Select" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-outline-primary btn-sm">
                                <i class="fa-solid fa-pen-to-square"></i> 
                                <span class="visually-hidden">Editar</span>
                            </asp:LinkButton>
                            <asp:LinkButton runat="server" CommandName="SelectIMG" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-outline-secondary btn-sm" OnCommand="dgvInmuebles_Command">
                                <i class="fa-solid fa-image"></i> 
                                <span class="visually-hidden">Administrar imágenes</span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <div class="text-end my-4">
            <a href="AgregarInmueble.aspx" class="btn btn-success btn-lg shadow-sm">
                <i class="fa-solid fa-plus me-2"></i>Agregar Inmueble
            </a>
        </div>

        <div class="text-start">
            <a href="Administrador.aspx" class="btn btn-secondary btn-lg shadow-sm">
                <i class="fa-solid fa-arrow-left me-2"></i>Volver
            </a>
        </div>
    </div>
</asp:Content>
