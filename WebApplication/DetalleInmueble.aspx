<%@ Page Title="Detalle Inmueble" Language="C#" MasterPageFile="~/MasterPrincipal.Master" AutoEventWireup="true" CodeBehind="DetalleInmueble.aspx.cs" Inherits="WebApplication.DetalleInmueble" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManagerDP" runat="server" />
    <div class="container py-4">
        <asp:UpdatePanel ID="UpdatePanelDP" runat="server">
            <ContentTemplate>
                <div class="row">
                    <!-- Información del inmueble -->
                    <div class="col-md-6">
                         <% if (Session["cuenta"] != null && !(bool)ViewState["EsFavorito"]) { %>
                        <div class="inmueble-container">
                             <asp:Button CssClass="btn btn-success" runat="server" ID="Button1" CommandName="AgregarFavoritos" OnClick="AgregarFavoritos_Click" data-bs-toggle="modal" data-bs-target="#favoritosModal" Text="Añadir a favoritos" />
                         </div>
                        <br />
                        <% } %>
                        <h2 style="text-align: center;"><%: inm.Tipo.Descripcion %> en <%: inm.Ubicacion.Descripcion %> con <%: inm.Ambientes %> ambientes</h2>
                        <br/>
                        <p>Descripcion: <%: inm.Descripcion %></p>
                        <p>Precio: <strong>
                            <%: inm.Moneda.Descripcion == "Dolar" ? "US$" : "AR$" %>
                            <%: String.Format("{0:N}", inm.Precio) %>
                        </strong></p>

                        <p>Ubicacion: <small class="text-muted fs-6">
                            <%: inm.Ubicacion.Descripcion ?? "Descripción no disponible" %>,
                            <%: inm.Ubicacion.Ciudad?.Descripcion ?? "Ciudad no disponible" %>,
                            <%: inm.Ubicacion.Ciudad?.Provincia?.Descripcion ?? "Provincia no disponible" %>
                        </small></p>

                        <div class="d-flex justify-content-start gap-4">
                            <p class="card-text"><i class="fa-solid fa-crop-simple"></i> <%: inm.Superficie %> m² tot.</p>
                            <p class="card-text"><i class="fa-solid fa-door-open"></i> <%: inm.Ambientes %> Ambientes</p>
                            <p class="card-text"><i class="fa-solid fa-bed"></i> <%: inm.Dormitorios %> Dormitorios</p>
                            <p class="card-text"><i class="fa-solid fa-toilet"></i> <%: inm.Banos %> Baños</p>
                            <p class="card-text"><i class="fa-solid fa-warehouse"></i> <%: inm.Garages %> Garages</p>
                        </div>
                    </div>
                    
                    <!-- Carrusel de imágenes -->
                    <div class="col-md-6 position-relative">
                        <% if (imagenes?.Count > 0) { %>
                            <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                                <div class="carousel-indicators">
                                    <% for (int i = 0; i < imagenes.Count; i++) { %>
                                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="<%= i %>" class="<%= i == 0 ? "active" : "" %>" aria-current="<%= i == 0 ? "true" : "false" %>" aria-label="Slide <%= i + 1 %>"></button>
                                    <% } %>
                                </div>
                                <div class="carousel-inner">
                                    <% for (int i = 0; i < imagenes.Count; i++) { %>
                                        <div class="carousel-item <%= i == 0 ? "active" : "" %>">
                                            <img src="<%= imagenes[i].ImagenUrl %>" class="d-block w-100" alt="Imagen del inmueble">
                                        </div>
                                    <% } %>
                                </div>
                                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Anterior</span>
                                </button>
                                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                    <span class="visually-hidden">Siguiente</span>
                                </button>
                            </div>
                        <% } else { %>
                            <p class="text-center">No hay imágenes disponibles para este inmueble.</p>
                        <% } %>

                        <% if (inm.Estado.ID == 1 || inm.Estado.ID == 2) { %>
                            <div class="bg-success text-white p-2 position-absolute top-0" style="left: 20px; font-size: 16px; font-weight: bold;">
                                <%: inm.Estado.Descripcion %>
                            </div>
                        <% } else { %>
                            <div class="bg-warning text-white p-2 position-absolute top-0" style="left: 20px; font-size: 16px; font-weight: bold;">
                                <%: inm.Estado.Descripcion %>
                            </div>
                        <% } %>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="modal fade" id="favoritosModal" tabindex="-1" aria-labelledby="modalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <img src="Images/logo.png" alt="Inicio Marca" class="marcamenu" />
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    El inmueble ha sido añadido a tu lista de favoritos.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
