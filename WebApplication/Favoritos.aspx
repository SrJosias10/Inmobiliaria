﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPrincipal.Master" 
    AutoEventWireup="true" CodeBehind="Favoritos.aspx.cs" 
    Inherits="WebApplication.Favoritos" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Favoritos</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManagerDP" runat="server" />
    <asp:UpdatePanel ID="UpdatePanelDP" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div class="container py-5">
                <div class="d-flex flex-column align-items-center">
                    <% foreach (Dominio.Inmueble inm in ListaFavoritos) { %>
                        <div class="card mb-4 w-75 shadow-lg" 
                             style="border: 1px solid #d1cfc1; background-color: #ffffff;">
                            <div class="row g-0">
                                <div class="col-md-4 position-relative">
                                    <% if (ImagenesPorFavoritos[inm.ID]?.Count > 0) { %>
                                        <div id="carousel<%: inm.ID %>" class="carousel slide" data-bs-ride="carousel">
                                            <div class="carousel-inner">
                                                <% var primera = true;
                                                   foreach (var img in ImagenesPorFavoritos[inm.ID]) { %>
                                                    <div class="carousel-item <%: (primera ? "active" : "") %>">
                                                        <img src="<%: img.ImagenUrl %>" class="d-block w-100" 
                                                             alt="Imagen de la propiedad">
                                                    </div>
                                                    <% primera = false; %>
                                                <% } %>
                                            </div>
                                            <button class="carousel-control-prev" type="button" 
                                                    data-bs-target="#carousel<%: inm.ID %>" data-bs-slide="prev">
                                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                            </button>
                                            <button class="carousel-control-next" type="button" 
                                                    data-bs-target="#carousel<%: inm.ID %>" data-bs-slide="next">
                                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                            </button>
                                        </div>
                                    <% } else { %>
                                        <p class="text-center">No hay imágenes disponibles.</p>
                                    <% } %>
                                     <%if (inm.Estado.ID == 1 || inm.Estado.ID == 2){ %>
                                     <div class="position-absolute top-0 end-0 m-2 bg-success text-white p-2" style="font-size: 16px; font-weight: bold; z-index: 10;">
                                         <%: inm.Estado.Descripcion %>
                                     </div>
                                     <%}else{%>
                                        <div class="position-absolute top-0 end-0 m-2 bg-danger text-white p-2" style="font-size: 16px; font-weight: bold; z-index: 10;">
                                           <%: inm.Estado.Descripcion %>
                                        </div>
                                     <%}%>
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="fs-4 mb-4" style="color: #8b5e3c;">
                                            <strong>
                                                <%: inm.Moneda.Descripcion == "Dolar" ? "US$" : "AR$" %>
                                                <%: String.Format("{0:N}", inm.Precio) %>
                                                <small class="text-muted fs-6">+ <%: inm.Expensas %> AR$ expensas</small>
                                            </strong>
                                            <p>
                                                <small class="text-muted fs-6">
                                                    <i class="fa-solid fa-location-dot"></i>
                                                    <%: inm.Ubicacion.Descripcion ?? "Descripción no disponible" %>, 
                                                    <%: inm.Ubicacion.Ciudad?.Descripcion ?? "Ciudad no disponible" %>, 
                                                    <%: inm.Ubicacion.Ciudad?.Provincia?.Descripcion ?? "Provincia no disponible" %>
                                                </small>
                                            </p>
                                        </h5>
                                        <a href="Favoritos.aspx?id=<%: inm.ID %>" 
                                           class="btn btn-danger btn-sm eliminar-btn" 
                                           style="position: absolute; top: 10px; right: 10px;" 
                                           onclick="return eliminarFavorito(<%: inm.ID %>);">
                                           <i class="fa fa-trash"></i>
                                        </a>
                                        <p class="card-text" style="color: #3e3e3e;"><%: inm.Descripcion %></p>
                                        <div class="d-flex justify-content-start gap-4">
                                            <p class="card-text"><i class="fa-solid fa-crop-simple"></i>
                                                <%: inm.Superficie %>m² tot.
                                            </p>
                                            <p class="card-text"><i class="fa-solid fa-bed"></i>
                                                <%: inm.Dormitorios %>
                                            </p>
                                            <p class="card-text"><i class="fa-solid fa-toilet"></i>
                                                <%: inm.Banos %>
                                            </p>
                                            <p class="card-text"><i class="fa-solid fa-warehouse"></i>
                                                <%: inm.Garages %>
                                            </p>
                                        </div>
                                        <a href="DetalleInmueble.aspx?id=<%: inm.ID %>" class="btn" 
                                           style="background-color: #8b5e3c; color: #fff; border-radius: 5px;">
                                           Ver más detalles
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <% } %>
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <br /><br /><br />
</asp:Content>
