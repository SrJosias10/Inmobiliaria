﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPrincipal.Master" AutoEventWireup="true" CodeBehind="Error.aspx.cs" Inherits="WebApplication.Error" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <h1>Hubo un problema...</h1>
    <asp:Label Text="text" ID="lblMensaje" runat="server" />
</asp:Content>
