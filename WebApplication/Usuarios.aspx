<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPrincipal.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="WebApplication.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="container mt-4">
        <div class="table-responsive">
            <asp:GridView ID="dgvUsuarios" DataKeyNames="ID" OnSelectedIndexChanged="dgvUsuarios_SelectedIndexChanged" runat="server" AutoGenerateColumns="false" CssClass="table table-bordered table-hover" HeaderStyle-CssClass="table-dark" RowStyle-CssClass="table-light">
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="ID" />
                    <asp:BoundField HeaderText="Usuario" DataField="Mail" />
                    <asp:BoundField HeaderText="Pass" DataField="Clave" />
                    <asp:BoundField HeaderText="Nombres" DataField="Nombre" />
                    <asp:BoundField HeaderText="Apellidos" DataField="Apellido" />
                    <asp:BoundField HeaderText="Telefono" DataField="Telefono" />
                    <asp:TemplateField HeaderText="Administrador">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkAdmin" runat="server" Checked='<%# Eval("admin") %>' AutoPostBack="true" OnCheckedChanged="chkAdmin_CheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Select" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-sm btn-outline-secondary">
                                <i class="fa-solid fa-pen-to-square"></i> Editar
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
    <div class="text-start">
    <a href="Administrador.aspx" class="btn btn-secondary btn-lg shadow-sm">
        <i class="fa-solid fa-arrow-left me-2"></i>Volver
    </a>
</div>
    <br /><br /><br />
</asp:Content>

