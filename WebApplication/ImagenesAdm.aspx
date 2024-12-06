<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPrincipal.Master" AutoEventWireup="true" CodeBehind="ImagenesAdm.aspx.cs" Inherits="WebApplication.ImagenesAdm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">    
                <!-- Vista previa de imagen -->
        <div class="row mb-4">
            <div class="col-lg-6 offset-lg-3 text-center">
                <asp:Image ID="imgInmuebleNuevo" runat="server" CssClass="img-fluid rounded shadow" Width="350" />
            </div>
        </div>      
      
        <!-- Mensaje -->
        <div class="row">
            <div class="col-12 text-center">
                <asp:Label ID="lblMensaje" runat="server" Visible="false" CssClass="text-danger fw-bold"></asp:Label>
            </div>
        </div>
        
        <!-- Listado de imágenes -->
        <div class="row">
            <asp:Repeater ID="repImagenes" runat="server">
                <ItemTemplate>
                    <div class="col-md-3 mb-4">
                        <div class="card shadow-sm">
                            <img src="<%# Eval("ImagenUrl") %>" alt="Imagen" class="card-img-top img-thumbnail" />
                            <div class="card-body text-center">
                                <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn btn-danger btn-sm w-100" CommandArgument='<%# Eval("ID") %>' OnClick="EliminarImagen_Click" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        <!-- Formulario de Imagen -->
    <div class="row mb-4">
        <div class="col-lg-6 offset-lg-3">
            <label for="txtImagen" class="form-label">Subir Imagen</label>
            <asp:FileUpload ID="txtImagen" runat="server" class="form-control shadow-sm" />
        </div>
    </div>
        <!-- Botones de acción -->
    <div class="row justify-content-center mb-4">
        <div class="col-lg-6 text-center">
            <asp:Button Text="Guardar" CssClass="btn btn-primary btn-lg me-3 shadow-sm" OnClick="btnGuardar_Click" ID="btnGuardar" runat="server" />
            <a href="InmueblesAdmin.aspx" class="btn btn-secondary btn-lg shadow-sm">Volver</a>

        </div>
    </div>
    </div>
    <br /><br /><br />
</asp:Content>
