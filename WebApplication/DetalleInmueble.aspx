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
                            <div class="bg-danger text-white p-2 position-absolute top-0" style="left: 20px; font-size: 16px; font-weight: bold;">
                                <%: inm.Estado.Descripcion %>
                            </div>
                        <% } %>


                    </div>
                    <div class="container mt-5">
                        <div class="row">
                            <div class="col-md-6 offset-md-3">
                                <div class="form-container">
                                    <h2 class="text-center mb-4">Formulario de Contacto</h2>
                                    <form method="post" action="mailto:mromarolave@gmail.com?subject=Mensaje desde el formulario de contacto">
                                        <div class="form-group mb-3">
                                            <label for="txtNombre">Nombre</label>
                                            <input type="text" id="txtNombre" name="nombre" class="form-control" placeholder="Ingrese su nombre" required />
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="txtEmail">Correo Electrónico</label>
                                            <input type="email" id="txtEmail" name="email" class="form-control" placeholder="Ingrese su correo electrónico" required />
                                        </div>
                                        <div class="form-group mb-3">
                                            <label for="txtMensaje">Mensaje</label>
                                            <textarea id="txtMensaje" name="mensaje" class="form-control" placeholder="Escriba su mensaje" rows="4" required></textarea>
                                        </div>
                                        <div class="d-flex justify-content-center mb-3">
                                            <button type="submit" class="btn btn-primary">Enviar</button>
                                            <a href="index.aspx" class="btn btn-cancelar ms-2">Cancelar</a>
                                        </div>
                                        <div class="text-center">
                                            <asp:Label ID="lblErrorMail" runat="server" Visible="false" CssClass="text-danger"></asp:Label>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
