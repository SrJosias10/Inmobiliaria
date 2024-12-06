<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPrincipal.Master" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="WebApplication.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="tituloinicio text-center mt-5">
        <h1>Bienvenidos a Prime Properties</h1>
    </div>
    <br />
    <div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1" aria-label="Slide 2"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <a href="Inmuebles.aspx">
                    <img src="ImgInmuebles/1.0.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Encuentra tu hogar ideal</h5>
                        <p>Descubre nuestras exclusivas casas, diseñadas para brindarte comodidad, estilo y seguridad en cada rincón. Con amplios espacios, 
                            acabados de alta calidad y un diseño moderno, nuestras casas son el lugar ideal para ti y tu familia.</p>
                    </div>
                </a>
            </div>
            <div class="carousel-item">
                <a href="Inmuebles.aspx">
                    <img src="ImgInmuebles/3.0.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>¡Tu hogar soñado te espera!</h5>
                        <p>Explora nuestras opciones y encuentra la casa que siempre has querido. ¡Contáctanos y comienza tu nuevo capítulo hoy mismo!</p>
                    </div>
                </a>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <div id="carouselExampleCaptions2" class="carousel slide mt-5">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleCaptions2" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleCaptions2" data-bs-slide-to="1" aria-label="Slide 2"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <a href="Inmuebles.aspx">
                    <img src="ImgInmuebles/2.0.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>Los mejores departamentos</h5>
                        <p>Descubre nuestra exclusiva selección de departamentos en las mejores ubicaciones. Con espacios amplios, modernos acabados 
                            y una variedad de comodidades, nuestros departamentos están diseñados para ofrecerte el confort y la calidad que mereces.</p>
                    </div>
                </a>
            </div>
            <div class="carousel-item">
                <a href="Inmuebles.aspx">
                    <img src="ImgInmuebles/2.0.jpg" class="d-block w-100" alt="...">
                    <div class="carousel-caption d-none d-md-block">
                        <h5>¡Haz de tu hogar el lugar donde siempre soñaste vivir!</h5>
                        <p>Explora nuestras opciones y encuentra el departamento perfecto para ti. ¡No esperes más y contáctanos hoy mismo!</p>
                    </div>
                </a>
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions2" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions2" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <br /><br /><br />
</asp:Content>

