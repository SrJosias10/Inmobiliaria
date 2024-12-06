<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPrincipal.Master" AutoEventWireup="true" CodeBehind="EditarUsuario.aspx.cs" Inherits="WebApplication.EditarUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <br />
        <h2 class="text-center">Editar usuario</h2>
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="mb-3">
                    <label class="form-label">Usuario</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtUser" />
                </div>
                <div class="mb-3">
                    <label type="password" class="form-label">Contraseña</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtPass" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Apellidos</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtApellidos" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Nombres</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtNombres" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Teléfono</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtTelefono" />
                </div>
            </div>

<%--            <div class="col-md-4">
                <div class="mb-3">
                    <label class="form-label">Imagen Perfil</label>
                    <input type="file" id="txtImagen" runat="server" class="form-control" />
                </div>
                <asp:Image ID="imgNuevoPerfil" runat="server" CssClass="img-fluid mb-3" Width="350" />
            </div>--%>

            <div class="col-md-6">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <asp:Button Text="Guardar" CssClass="btn btn-danger btn-lg me-2" OnClick="btnGuardar_Click" ID="btnGuardar" runat="server" />
                        <a href="Usuarios.aspx" class="btn btn-success">Volver</a>
                    </div>
                </div>
                <asp:Label ID="lblMensaje" runat="server" Visible="false" CssClass="text-danger"></asp:Label>
            </div>

            <div class="col-md-6">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <asp:Button Text="Eliminar" ID="Button2" OnClick="btnEliminar_Click" CssClass="btn btn-danger" runat="server" />
                                <% if (ConfirmaEliminacion)
                                { %>
                                <div class="mb-3">
                                    <asp:CheckBox Text="Confirmar Eliminación" ID="chkConfirmaEliminacion" runat="server" />
                                    <asp:Button Text="Eliminar" ID="btnConfirmarEliminacion" OnClick="btnConfirmarEliminacion_Click" CssClass="btn btn-outline-danger" runat="server" />
                                </div>
                                <% } %>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

