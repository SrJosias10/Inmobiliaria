<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPrincipal.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="WebApplication.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <br />
    <br />
    <div class="container mt-4">
        <div class="table-responsive">
            <asp:GridView ID="dgvUsuarios" DataKeyNames="ID" OnSelectedIndexChanged="dgvUsuarios_SelectedIndexChanged" runat="server" AutoGenerateColumns="false" CssClass="table table-dark table-bordered">
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="ID" />
                    <asp:BoundField HeaderText="Usuario" DataField="Mail" />
                    <asp:BoundField HeaderText="Pass" DataField="Clave" />
                    <asp:BoundField HeaderText="Nombres" DataField="Nombre" />
                    <asp:BoundField HeaderText="Apellidos" DataField="Apellido" />
                    <asp:BoundField HeaderText="Telefono" DataField="Telefono" />
                    <asp:CheckBoxField HeaderText="Administrador" DataField="admin" />
                    <asp:TemplateField HeaderText="Editar">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" CommandName="Select" CommandArgument='<%# Eval("ID") %>' CssClass="btn btn-outline-primary btn-sm">
                                <i class="fa-solid fa-pen-to-square"></i>
                                <span class="visually-hidden">Editar</span>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
        <div class="text-end mb-4">
            <a href="AgregarUsuario.aspx" class="btn btn-success btn-lg">
                <i class="fa-solid fa-user-plus"></i> 
            </a>
        </div>
    </div>
</asp:Content>
