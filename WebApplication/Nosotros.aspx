<%@ Page Title="Nosotros" Language="C#" MasterPageFile="~/MasterPrincipal.Master" AutoEventWireup="true" CodeBehind="Nosotros.aspx.cs" Inherits="WebApplication.Nosotros" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-center">Conócenos</h1>
                <p class="text-center lead">
                    En Prime Properties, nuestra misión es ayudarte a encontrar el hogar perfecto para ti. Con años de experiencia en el sector inmobiliario, ofrecemos un servicio personalizado y profesional que garantiza que cada cliente encuentre la propiedad que se ajuste a sus necesidades y deseos.
                </p>
            </div>
        </div>

        <div class="row mt-5">
            <div class="col-md-4">
                <h3>Misión</h3>
                <p>
                    Brindar soluciones inmobiliarias de alta calidad, con un enfoque en la confianza, el compromiso y la satisfacción total de nuestros clientes. Nos esforzamos por facilitar cada paso del proceso, ofreciendo asesoría y acompañamiento durante todo el trayecto.
                </p>
            </div>

            <div class="col-md-4">
                <h3>Visión</h3>
                <p>
                    Ser la inmobiliaria de referencia en Argentina, reconocida por su excelencia en servicio al cliente, innovación en procesos y por facilitar el acceso a propiedades de calidad.
                </p>
            </div>

            <div class="col-md-4">
                <h3>Valores</h3>
                <ul>
                    <li>Compromiso</li>
                    <li>Honestidad</li>
                    <li>Profesionalismo</li>
                    <li>Transparencia</li>
                    <li>Innovación</li>
                </ul>
            </div>
        </div>

        <div class="row mt-5">
            <div class="col-md-12">
                <h3>¿Por qué elegirnos?</h3>
                <p>
                    Nos especializamos en ofrecer un servicio personalizado, con un enfoque humano y atento a tus necesidades. Además, contamos con una amplia variedad de propiedades, desde casas hasta apartamentos, en diversas zonas para que encuentres lo que buscas.
                </p>
            </div>
        </div>

        <div class="row mt-4 justify-content-center">
            <div class="col-md-3 mb-2">
                <a href="Inmuebles.aspx" class="btn btn-primary w-100">Ver Propiedades</a>
            </div>
            <div class="col-md-3 mb-2">
                <a href="https://wa.me/541121640928?text=Hola! quiero conocer más sobre ustedes!" class="btn btn-success w-100">
                    <i class="fa-brands fa-whatsapp"></i> Contactar por Whatsapp
                </a>
            </div>
            <div class="col-md-3 mb-2">
                <a href="mailto:josias.olave@alumnos.frgp.utn.edu.ar?subject=Consulta&body" class="btn btn-primary w-100">
                    <i class="fa-solid fa-envelope"></i> Contactar por mail
                </a>
            </div>
        </div>
    </div>
    <br /><br /><br />
</asp:Content>
