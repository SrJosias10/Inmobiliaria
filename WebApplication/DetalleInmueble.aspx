<%@ Page Title="Detalle Inmueble" Language="C#" MasterPageFile="~/MasterPrincipal.Master" AutoEventWireup="true" CodeBehind="DetalleInmueble.aspx.cs" Inherits="WebApplication.DetalleInmueble" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManagerDP" runat="server" />
    <div class="container py-5">
        <asp:UpdatePanel ID="UpdatePanelDP" runat="server">
            <ContentTemplate>
                <div class="row">
                    <!-- Info -->
                    <div class="col-md-6 mb-4">
                        <% if (Session["cuenta"] != null && !(bool)ViewState["EsFavorito"]) { %>
                            <div class="inmueble-container mb-3">
                                <asp:Button CssClass="btn btn-success w-100" runat="server" ID="Button1" CommandName="AgregarFavoritos" OnClick="AgregarFavoritos_Click" data-bs-toggle="modal" data-bs-target="#favoritosModal" Text="Añadir a favoritos" />
                            </div>
                        <% } %>

                        <h2 class="text-center mb-3 text-primary">
                            <%: inm.Tipo.Descripcion %> en <%: inm.Ubicacion.Descripcion %> con <%: inm.Ambientes %> ambientes
                        </h2>

                        <p class="fs-5 mb-2">Descripcion: <%: inm.Descripcion %></p>
                        <p class="fs-5 mb-2">Precio: <strong>
                            <%: inm.Moneda.Descripcion == "Dolar" ? "US$" : "AR$" %>
                            <%: String.Format("{0:N}", inm.Precio) %>
                        </strong></p>

                        <p class="text-muted mb-3 fs-6">Ubicación: 
                            <%: inm.Ubicacion.Descripcion ?? "Descripción no disponible" %>,
                            <%: inm.Ubicacion.Ciudad?.Descripcion ?? "Ciudad no disponible" %>,
                            <%: inm.Ubicacion.Ciudad?.Provincia?.Descripcion ?? "Provincia no disponible" %>
                        </p>

                        <div class="d-flex justify-content-between text-muted fs-6">
                            <p><i class="fa-solid fa-crop-simple"></i> <%: inm.Superficie %> m² tot.</p>
                            <p><i class="fa-solid fa-door-open"></i> <%: inm.Ambientes %> Ambientes</p>
                            <p><i class="fa-solid fa-bed"></i> <%: inm.Dormitorios %> Dormitorios</p>
                            <p><i class="fa-solid fa-toilet"></i> <%: inm.Banos %> Baños</p>
                            <p><i class="fa-solid fa-warehouse"></i> <%: inm.Garages %> Garages</p>
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
                            <div class="bg-success text-white p-2 position-absolute top-0 start-50 translate-middle-x" style="font-size: 16px; font-weight: bold;">
                                <%: inm.Estado.Descripcion %>
                            </div>
                        <% } else { %>
                            <div class="bg-warning text-white p-2 position-absolute top-0 start-50 translate-middle-x" style="font-size: 16px; font-weight: bold;">
                                <%: inm.Estado.Descripcion %>
                            </div>
                        <% } %>
                    </div>
                </div>
                <br /><br />
                <!-- Descripción -->
                <p class="mb-4 fs-5 text-muted">
                    <% if (inm.Tipo.Descripcion == "Casa") { %>
                        En esta ocasión, te presentamos esta casa que cuenta con <%: inm.Ambientes %> ambientes, <%: inm.Dormitorios %> dormitorios, <%: inm.Banos %> baños y <%: inm.Garages %> garages. La propiedad tiene <%: inm.Antiguedad %> años de antigüedad y una superficie de <%: inm.Superficie %> metros cuadrados, lo que la hace cómoda y funcional. ¡Contáctanos para que podamos brindarte todos los detalles!
                    <% } else { %>
                        En esta ocasión, te presentamos este departamento que cuenta con <%: inm.Ambientes %> ambientes, <%: inm.Dormitorios %> dormitorios, <%: inm.Banos %> baños y <%: inm.Garages %> garages. La propiedad tiene <%: inm.Antiguedad %> años de antigüedad y una superficie de <%: inm.Superficie %> metros cuadrados, lo que la hace cómoda y funcional. ¡Contáctanos para que podamos brindarte todos los detalles!
                    <% } %>
                </p>
                <br />
                <!-- Contacto -->
                <div class="d-flex justify-content-between">
                    <a href="https://wa.me/5411216409283?text=Hola! quiero informacion sobre la publicacion: <%: inm.Tipo.Descripcion %> en <%: inm.Ubicacion.Descripcion %> con <%: inm.Ambientes %> ambientes" class="btn btn-success w-100 me-2">
                        <i class="fa-brands fa-whatsapp"></i> Contactar por Whatsapp
                    </a>
                    <a href="mailto:josias.olave@alumnos.frgp.utn.edu.ar?subject=Consulta%20por%20Inmueble&body=Hola!%20Quiero%20información%20sobre%20la%20publicación%3A%20<%= inm.Tipo.Descripcion %>%20en%20<%= inm.Ubicacion.Descripcion %>%20con%20<%= inm.Ambientes %>%20ambientes." class="btn btn-primary w-100">
                        <i class="fa-solid fa-envelope"></i> Contactar por mail
                    </a>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="modal fade" id="favoritosModal" tabindex="-1" aria-labelledby="favoritosModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <img src="Images/logo.png" alt="Inicio Marca" class="marcamenu" />
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    El inmueble ha sido añadido correctamente a tu lista de favoritos. ¡Gracias por tu interés!
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <a href="Favoritos.aspx" type="button" class="btn btn-primary">Ver favoritos</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


