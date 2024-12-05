<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPrincipal.Master" AutoEventWireup="true" CodeBehind="Administrador.aspx.cs" Inherits="WebApplication.Administrador" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="row">
            <div class="col-12 text-center">
                <h1>Administración</h1>
                <a href="Usuarios.aspx" class="btn btn-dark btn-lg w-100 mb-3">Usuarios</a>
                <a href="InmueblesAdmin.aspx" class="btn btn-dark btn-lg w-100 mb-3">Inmuebles</a>
                <br />
                <br />
                <br />
                <br />
                <a href="Inicio.aspx" class="btn btn-dark btn-lg w-100 mb-3">Volver al inicio</a>
            </div>
        </div>
    </div>
</asp:Content>
