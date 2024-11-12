<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPrincipal.Master" AutoEventWireup="true" CodeBehind="InicioSesion.aspx.cs" Inherits="WebApplication.InicioSesion" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <h2 class="text-center mb-4" style="color: black;">Inicio de Sesión</h2>
                <form>
                    <div class="container centrarInicio">
                        <div class="form-group">
                            <label for="txtEmail">Correo Electrónico</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Ingrese su correo electrónico"></asp:TextBox>
                        </div>
                    </div>
                    <br />
                    <div class="container centrarInicio">
                        <div class="form-group">
                            <label for="txtPassword">Contraseña</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Ingrese su contraseña"></asp:TextBox>
                        </div>
                    </div>
                    <br />
                    <div class="d-flex justify-content-center">
                        <asp:Button ID="btnIniciarSesion" runat="server" OnClick="btnIniciarSesion_Click" class="btn btn-dark btn-lg me-2" Text="Iniciar Sesion" />
                        <a href="Inicio.aspx" style="color: black; display: inline-block; padding: 10px 20px; font-size: 16px; text-align: center; text-decoration: none; background-color: #f8f9fa; border: 1px solid black; border-radius: 5px;">Cancelar</a>

                    </div>
                    <br />
                    <div class="text-center mt-3">
                        <asp:Label ID="lblErrorMail" runat="server" Visible="false" CssClass="text-danger"></asp:Label>
                        <asp:Label ID="lblErrorIngreso" runat="server" Visible="false" CssClass="text-danger"></asp:Label>
                        <asp:Label ID="lblDatosVacios" runat="server" Visible="false" CssClass="text-danger"></asp:Label>
                    </div>
                </form>
                <div class="text-center mt-3" style="color: black;">
                    ¿No tienes una cuenta? <a href="Registrarse.aspx" style="color: black;">Regístrate</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
