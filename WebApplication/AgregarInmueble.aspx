<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPrincipal.Master" AutoEventWireup="true" CodeBehind="AgregarInmueble.aspx.cs" Inherits="WebApplication.AgregarInmueble" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container mt-5">
        <h2 class="text-center mb-4">Agregar Inmueble</h2>
        <div class="row justify-content-center">
            <!-- Primera columna -->
            <div class="col-md-5 bg-light p-4 rounded shadow">
                <div class="mb-3">
                    <label for="ddlTipo" class="form-label">Seleccione Tipo</label>
                    <asp:DropDownList ID="ddlTipo" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="ddlUbicacion" class="form-label">Seleccione Ubicación</label>
                    <asp:DropDownList ID="ddlUbicacion" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="ddlEstado" class="form-label">Seleccione Estado</label>
                    <asp:DropDownList ID="ddlEstado" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="ddlMoneda" class="form-label">Seleccione Moneda</label>
                    <asp:DropDownList ID="ddlMoneda" runat="server" CssClass="form-select"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="txtDescripcion" class="form-label">Descripción</label>
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" MaxLength="1000"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtPrecio" class="form-label">Precio</label>
                    <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" placeholder="USD $" />
                </div>
                <div class="mb-3">
                    <label for="txtAmbientes" class="form-label">Cantidad Ambientes</label>
                    <asp:TextBox ID="txtAmbientes" runat="server" CssClass="form-control" />
                </div>
            </div>

            <!-- Segunda columna -->
            <div class="col-md-5 bg-light p-4 rounded shadow ms-3">
                <div class="mb-3">
                    <label for="txtGarage" class="form-label">Cantidad Garages</label>
                    <asp:TextBox ID="txtGarage" runat="server" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="txtDormitorio" class="form-label">Cantidad Dormitorios</label>
                    <asp:TextBox ID="txtDormitorio" runat="server" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="txtBano" class="form-label">Cantidad Baños</label>
                    <asp:TextBox ID="txtBano" runat="server" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="txtAntiguedad" class="form-label">Antigüedad</label>
                    <asp:TextBox ID="txtAntiguedad" runat="server" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="txtExpensas" class="form-label">Expensas</label>
                    <asp:TextBox ID="txtExpensas" runat="server" CssClass="form-control" />
                </div>
                <div class="mb-3">
                    <label for="txtSuperficie" class="form-label">Superficie (m²)</label>
                    <asp:TextBox ID="txtSuperficie" runat="server" CssClass="form-control" />
                </div>
            </div>
        </div>

        <!-- Botones -->
        <div class="row justify-content-center mt-4">
            <div class="col-md-4 text-center">
                <asp:Button ID="btnGuardar" runat="server" CssClass="btn btn-danger btn-lg me-3" Text="Guardar" OnClick="btnGuardar_Click" />
                <a href="InmueblesAdmin.aspx" class="btn btn-success btn-lg">Volver</a>
            </div>
        </div>

        <!-- Mensaje -->
        <div class="row justify-content-center mt-3">
            <div class="col-md-6 text-center">
                <asp:Label ID="lblMensaje" runat="server" Visible="false" CssClass="text-danger"></asp:Label>
            </div>
        </div>
    </div>
    <br /><br /><br />
</asp:Content>
