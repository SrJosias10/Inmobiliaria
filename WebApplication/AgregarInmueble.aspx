<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPrincipal.Master" AutoEventWireup="true" CodeBehind="AgregarInmueble.aspx.cs" Inherits="WebApplication.AgregarInmueble" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container">
        <br />
        <h2 class="text-center">Agregar Inmueble</h2>
        <div class="row justify-content-center">
            <div class="col-md-4">
                <div class="mb-3">
                    <label for="ddlTipo" class="form-label">Seleccione Tipo</label>
                    <asp:DropDownList class="btn dropdown-toggle form-select dropdown-celeste text-start" ID="ddlTipo" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="ddlUbicacion" class="form-label">Seleccione Ubicacion</label>
                    <asp:DropDownList class="btn dropdown-toggle form-select dropdown-celeste text-start" ID="ddlUbicacion" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="ddlEstado" class="form-label">Seleccione Estado</label>
                    <asp:DropDownList class="btn dropdown-toggle form-select dropdown-celeste text-start" ID="ddlEstado" runat="server"></asp:DropDownList>
                </div>
                <div class="mb-3">
                    <label for="ddlMoneda" class="form-label">Seleccione Moneda</label>
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

            </div>

            <div class="col-md-4">
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
                <div class="mb-3">
                    <label class="form-label">Imagen de Inmuble</label>
                    <input type="file" id="txtImagen" runat="server" class="form-control" />
                </div>
                <asp:Image ID="imgInmuebleNuevo" runat="server" CssClass="img-fluid mb-3" Width="350" />
            </div>

            <div class="col-md-6">
                <div class="row justify-content-center">
                    <div class="col-md-6">
                        <asp:Button Text="Guardar" CssClass="btn btn-danger btn-lg me-2" OnClick="btnGuardar_Click" ID="btnGuardar" runat="server" />
                        <a href="InmueblesAdmin.aspx" class="btn btn-success">Volver</a>
                    </div>
                </div>
                <asp:Label ID="lblMensaje" runat="server" Visible="false" CssClass="text-danger"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
