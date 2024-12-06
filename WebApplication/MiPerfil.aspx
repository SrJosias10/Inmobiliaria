<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPrincipal.Master" AutoEventWireup="true" CodeBehind="MiPerfil.aspx.cs" Inherits="WebApplication.MiPerfil" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <br />
        <h2 class="text-center">Mi perfil</h2>
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="mb-3">
                    <label class="form-label">Usuario</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtUser" />
                </div>
                <div class="mb-3">
                    <label type="password" class="form-label">Contraseña</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtClave" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Nombres</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtNombres" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Apellidos</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtApellidos" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Teléfono</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtTelefono" />
                </div>
                <div>
                    <asp:Button Text="Guardar" CssClass="btn btn-danger btn-lg me-2" OnClick="btnGuardar_Click" ID="btnGuardar" runat="server" />
                    <a href="Inicio.aspx" class="btn btn-success">Volver</a>
                </div>
                <asp:Label ID="lblMensaje" runat="server" Visible="false" CssClass="text-danger"></asp:Label>
            </div>
        </div>
    </div>
    <br /><br /><br />
</asp:Content>
