<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPrincipal.Master" AutoEventWireup="true" CodeBehind="EditarInmueble.aspx.cs" Inherits="WebApplication.EditarInmueble" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server" />
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4">
                <div class="mb-3">
                    <label for="ddlTipo" class="form-select">Seleccione Tipo</label>
                    <asp:DropDownList class="btn dropdown-toggle form-select dropdown-celeste text-start" ID="ddlTipo" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="ddlUbicacion" class="form-select">Seleccione Ubicacion</label>
                    <asp:DropDownList class="btn dropdown-toggle form-select dropdown-celeste text-start" ID="ddlUbicacion" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="ddlEstado" class="form-select">Seleccione Estado</label>
                    <asp:DropDownList class="btn dropdown-toggle form-select dropdown-celeste text-start" ID="ddlEstado" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="ddlMoneda" class="form-select">Seleccione Moneda</label>
                    <asp:DropDownList class="btn dropdown-toggle form-select dropdown-celeste text-start" ID="ddlMoneda" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label class="form-label">Descripción</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtDescripcion" TextMode="MultiLine" Rows="5" Columns="50" MaxLength="1000"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label class="form-label">Precio</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtPrecio" placeholder="USD $" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Cantidad Ambientes</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtAmbientes" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Cantidad Garages</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtGarage" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Cantidad Dormitorios</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtDormitorio" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Cantidad Baños</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtBano" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Antigüedad</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtAntiguedad" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Expensas</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtExpensas" />
                </div>
                <div class="mb-3">
                    <label class="form-label">Superficie mts2</label>
                    <asp:TextBox runat="server" CssClass="form-control" ID="txtSuperficie" />
                </div>
            </div>
            <div class="col-md-6">
                <!-- Segunda columna -->
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <div class="mb-3 form-floating">
                            <asp:TextBox runat="server" ID="txtUrl" CssClass="form-control" Style="width: 100%; max-width: 100%;" placeholder=" " AutoPostBack="true" OnTextChanged="txtUrl_TextChanged"></asp:TextBox>
                            <label for="txtUrl">URL Imagen</label>
                        </div>
                        <div class="mb-3 form-floating">
                            <asp:Image ImageUrl="https://asahimotors.com/images/nodisponible.png" runat="server" ID="imgArticulo" Style="max-width: 100%; height: auto;" OnError="imgArticulo_LoadError" />
                        </div>
                        <asp:Button Text="Eliminar" ID="Button2" OnClick="btnEliminar_Click" CssClass="btn btn-danger float-end mb-3" runat="server" />
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

        <!-- Guardar o volver -->
        <div class="row mt-4">
            <div class="col-md-6 d-flex justify-content-start">
                <div>
                    <asp:Button Text="Guardar" CssClass="btn btn-danger btn-lg me-2" OnClick="btnGuardar_Click" ID="btnGuardar" runat="server" />
                    <a href="ArticulosAdmin.aspx" class="btn btn-success">Volver</a>
                </div>
            </div>
            <asp:Label ID="lblMensaje" runat="server" Visible="false" CssClass="text-danger"></asp:Label>
        </div>
    </div>
</asp:Content>
