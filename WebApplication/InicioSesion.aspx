<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPrincipal.Master" AutoEventWireup="true" CodeBehind="InicioSesion.aspx.cs" Inherits="WebApplication.InicioSesion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="form-container">
                    <h2 class="text-center mb-4">Inicio de Sesión</h2>
                    <form>
                        <div class="form-group mb-3">
                            <label for="txtEmail">Correo Electrónico</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" 
                                         placeholder="Ingrese su correo electrónico"></asp:TextBox>
                        </div>
                        <div class="form-group mb-3">
                            <label for="txtPassword">Contraseña</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" 
                                         TextMode="Password" placeholder="Ingrese su contraseña"></asp:TextBox>
                        </div>
                        <div class="d-flex justify-content-center mb-3">
                            <asp:Button ID="btnIniciarSesion" runat="server" OnClick="btnIniciarSesion_Click"
                                        class="btn" style="background-color: #8b5e3c; color: #ffffff;" Text="Iniciar Sesión" />
                            <a href="Inicio.aspx" class="btn ms-2"
                               style="background-color: transparent; color: #8b5e3c; border: 2px solid #8b5e3c;">
                                Cancelar
                            </a>
                        </div>
                        <div class="text-center">
                            <asp:Label ID="lblErrorMail" runat="server" Visible="false" CssClass="text-danger"></asp:Label>
                            <asp:Label ID="lblErrorIngreso" runat="server" Visible="false" CssClass="text-danger"></asp:Label>
                            <asp:Label ID="lblDatosVacios" runat="server" Visible="false" CssClass="text-danger"></asp:Label>
                        </div>
                    </form>
                    <div class="text-center mt-3">
                        <span>¿No tienes una cuenta? 
                            <a href="Registrarse.aspx">Regístrate</a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>




