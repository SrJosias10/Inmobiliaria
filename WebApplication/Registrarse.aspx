<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPrincipal.Master" AutoEventWireup="true" CodeBehind="Registrarse.aspx.cs" Inherits="WebApplication.Registrarse" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="p-4 shadow rounded" style="background-color: #f7f3ef; border: 2px solid #8b5e3c; color: #8b5e3c;">
                    <h2 class="text-center mb-4" style="color: #8b5e3c;">Crea tu cuenta</h2>
                    <form>
                        <div class="form-group mb-3">
                            <label for="txtEmail" style="color: #8b5e3c;">Correo Electrónico (*)</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" 
                                         style="background-color: #ffffff; color: #8b5e3c; border: 1px solid #8b5e3c;" 
                                         placeholder="Ingrese su correo electrónico"></asp:TextBox>
                        </div>
                        <div class="form-group mb-3">
                            <label for="txtPassword" style="color: #8b5e3c;">Contraseña (*)</label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" 
                                         TextMode="Password" 
                                         style="background-color: #ffffff; color: #8b5e3c; border: 1px solid #8b5e3c;" 
                                         placeholder="Ingrese su contraseña"></asp:TextBox>
                        </div>
                        <div class="form-group mb-3">
                            <label for="txtNombres" style="color: #8b5e3c;">Nombres</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtNombres" 
                                         style="background-color: #ffffff; color: #8b5e3c; border: 1px solid #8b5e3c;" 
                                         placeholder="Ingrese sus nombres" />
                        </div>
                        <div class="form-group mb-3">
                            <label for="txtApellidos" style="color: #8b5e3c;">Apellidos</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtApellidos" 
                                         style="background-color: #ffffff; color: #8b5e3c; border: 1px solid #8b5e3c;" 
                                         placeholder="Ingrese sus apellidos" />
                        </div>
                        <div class="form-group mb-3">
                            <label for="txtTelefono" style="color: #8b5e3c;">Teléfono</label>
                            <asp:TextBox runat="server" CssClass="form-control" ID="txtTelefono" 
                                         style="background-color: #ffffff; color: #8b5e3c; border: 1px solid #8b5e3c;" 
                                         placeholder="Ingrese su Teléfono" />
                        </div>
                        <div class="form-group mb-3 text-muted" style="font-size: 0.9rem;">
                            <label>(*) campo obligatorio</label>
                        </div>
                        <div class="d-flex justify-content-center mb-3">
                            <asp:Button ID="btnRegistrarse" runat="server" OnClick="btnRegistrarse_Click" 
                                        class="btn" 
                                        style="background-color: #8b5e3c; color: #ffffff;" 
                                        Text="Registrarse" />
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
                        <span style="color: #8b5e3c;">¿Ya tienes cuenta? 
                            <a href="InicioSesion.aspx" style="color: #8b5e3c; font-weight: bold; text-decoration: underline;">Inicia sesión</a>
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br /><br /><br />
</asp:Content>


