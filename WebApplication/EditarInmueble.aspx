<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPrincipal.Master" AutoEventWireup="true" CodeBehind="EditarInmueble.aspx.cs" Inherits="WebApplication.EditarInmueble" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager" runat="server" />
    
    <div class="container mt-5">
        <h2 class="text-center mb-4">Editar Inmueble</h2>
        
        <div class="row">
            <!-- Primera columna -->
            <div class="col-md-5">
                <div class="mb-3">
                    <label for="ddlTipo" class="form-label">Seleccione Tipo</label>
                    <asp:DropDownList class="form-select" ID="ddlTipo" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="ddlUbicacion" class="form-label">Seleccione Ubicación</label>
                    <asp:DropDownList class="form-select" ID="ddlUbicacion" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="ddlEstado" class="form-label">Seleccione Estado</label>
                    <asp:DropDownList class="form-select" ID="ddlEstado" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="ddlMoneda" class="form-label">Seleccione Moneda</label>
                    <asp:DropDownList class="form-select" ID="ddlMoneda" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="txtDescripcion" class="form-label">Descripción</label>
                    <asp:TextBox class="form-control" ID="txtDescripcion" TextMode="MultiLine" Rows="5" MaxLength="1000" runat="server"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtPrecio" class="form-label">Precio</label>
                    <asp:TextBox class="form-control" ID="txtPrecio" placeholder="USD $" runat="server" />
                </div>
                <div class="mb-3">
                    <label for="txtAmbientes" class="form-label">Cantidad Ambientes</label>
                    <asp:TextBox class="form-control" ID="txtAmbientes" runat="server" />
                </div>
                <div class="mb-3">
                    <label for="txtGarage" class="form-label">Cantidad Garages</label>
                    <asp:TextBox class="form-control" ID="txtGarage" runat="server" />
                </div>
            </div>
            
            <!-- Segunda columna -->
            <div class="col-md-5 ms-3">
                <div class="mb-3">
                    <label for="txtDormitorio" class="form-label">Cantidad Dormitorios</label>
                    <asp:TextBox class="form-control" ID="txtDormitorio" runat="server" />
                </div>
                <div class="mb-3">
                    <label for="txtBano" class="form-label">Cantidad Baños</label>
                    <asp:TextBox class="form-control" ID="txtBano" runat="server" />
                </div>
                <div class="mb-3">
                    <label for="txtAntiguedad" class="form-label">Antigüedad</label>
                    <asp:TextBox class="form-control" ID="txtAntiguedad" runat="server" />
                </div>
                <div class="mb-3">
                    <label for="txtExpensas" class="form-label">Expensas</label>
                    <asp:TextBox class="form-control" ID="txtExpensas" runat="server" />
                </div>
                <div class="mb-3">
                    <label for="txtSuperficie" class="form-label">Superficie (m²)</label>
                    <asp:TextBox class="form-control" ID="txtSuperficie" runat="server" />
                </div>
                
                <!-- Confirmación de eliminación -->
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Button Text="Eliminar" ID="Button2" OnClick="btnEliminar_Click" CssClass="btn btn-danger float-end mb-3" runat="server" />
                        <% if (ConfirmaEliminacion) { %>
                            <div class="mb-3">
                                <asp:CheckBox Text="Confirmar Eliminación" ID="chkConfirmaEliminacion" runat="server" />
                                <asp:Button Text="Eliminar" ID="btnConfirmarEliminacion" OnClick="btnConfirmarEliminacion_Click" CssClass="btn btn-outline-danger" runat="server" />
                            </div>
                        <% } %>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>

        <!-- Botones -->
        <div class="row mt-4">
            <div class="col-md-6 d-flex justify-content-start">
                <div>
                    <asp:Button Text="Guardar" CssClass="btn btn-danger btn-lg me-2" OnClick="btnGuardar_Click" ID="btnGuardar" runat="server" />
                    <a href="InmueblesAdmin.aspx" class="btn btn-success btn-lg">Volver</a>
                </div>
            </div>
            <div class="col-md-6 d-flex justify-content-start">
                <asp:Label ID="lblMensaje" runat="server" Visible="false" CssClass="text-danger"></asp:Label>
            </div>
        </div>
    </div>
    <br /><br /><br />
</asp:Content>
