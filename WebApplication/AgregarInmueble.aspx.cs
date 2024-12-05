using Negocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dominio;

namespace WebApplication
{
    public partial class AgregarInmueble : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarMoneda();
                CargarEstado();
                CargarUbicaciones();
                CargarTipoInmueble();
            }
        }
        private void CargarTipoInmueble()
        {
            TipoInmuebleNegocio tipoNegocio = new TipoInmuebleNegocio();
            try
            {
                List<TipoInmueble> listaTipos = tipoNegocio.listar();

                ddlTipo.DataSource = listaTipos;
                ddlTipo.DataTextField = "Descripcion";
                ddlTipo.DataValueField = "ID";
                ddlTipo.DataBind();
            }
            catch (Exception ex)
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = $"Error al cargar tipos: {ex.Message}";
            }
        }
        private void CargarUbicaciones()
        {
            UbicacionNegocio ubicacionNegocio = new UbicacionNegocio();
            try
            {
                List<Ubicacion> listaUbicaciones = ubicacionNegocio.listar();
                ddlUbicacion.DataSource = listaUbicaciones;
                ddlUbicacion.DataTextField = "Descripcion"; 
                ddlUbicacion.DataValueField = "ID";       
                ddlUbicacion.DataBind();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al cargar ubicaciones: " + ex.Message;
                lblMensaje.Visible = true;
            }
        }
        private void CargarEstado()
        {
            EstadoNegocio estadoNegocio = new EstadoNegocio();
            try
            {
                List<Estado> listaEstados = estadoNegocio.listar();

                ddlEstado.DataSource = listaEstados;
                ddlEstado.DataTextField = "Descripcion";
                ddlEstado.DataValueField = "ID";
                ddlEstado.DataBind();
            }
            catch (Exception ex)
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = $"Error al cargar Estados: {ex.Message}";
            }
        }
        private void CargarMoneda()
        {
            MonedaNegocio moneda = new MonedaNegocio();
            try
            {
                List<Moneda> listaMoneda = moneda.listar();

                ddlMoneda.DataSource = listaMoneda;
                ddlMoneda.DataTextField = "Descripcion";
                ddlMoneda.DataValueField = "ID";
                ddlMoneda.DataBind();
            }
            catch (Exception ex)
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = $"Error al cargar Estados: {ex.Message}";
            }
        }
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            try
            {
                AccesoDatos datos = new AccesoDatos();  
                Inmueble nuevo = new Inmueble();
                nuevo.Tipo = new TipoInmueble { ID = int.Parse(ddlTipo.SelectedValue) };

                if (!string.IsNullOrEmpty(ddlUbicacion.SelectedValue))
                {
                    nuevo.Ubicacion = new Ubicacion
                    {
                        ID = int.Parse(ddlUbicacion.SelectedValue)
                    };
                }
                else
                {
                    throw new Exception("Debe seleccionar una ubicación.");
                }

                if (!string.IsNullOrEmpty(ddlEstado.SelectedValue))
                {
                    nuevo.Estado = new Estado
                    {
                        ID = int.Parse(ddlEstado.SelectedValue)
                    };
                }
                else
                {
                    throw new Exception("Debe seleccionar un estado.");
                }
                if (!string.IsNullOrEmpty(ddlMoneda.SelectedValue))
                {
                    nuevo.Moneda = new Moneda
                    {
                        ID = int.Parse(ddlMoneda.SelectedValue)
                    };
                }
                else
                {
                    throw new Exception("Debe seleccionar una Moneda.");
                }
                nuevo.Descripcion = txtDescripcion.Text;
                nuevo.Precio = float.Parse(txtPrecio.Text);
                nuevo.Ambientes = int.Parse(txtAmbientes.Text);
                nuevo.Garages = int.Parse(txtGarage.Text);
                nuevo.Dormitorios = int.Parse(txtDormitorio.Text);
                nuevo.Banos = int.Parse(txtBano.Text);
                nuevo.Antiguedad = int.Parse(txtAntiguedad.Text);
                nuevo.Expensas = int.Parse(txtExpensas.Text);
                nuevo.Superficie = int.Parse(txtSuperficie.Text);


                //// Guardar en la base de datos
                InmuebleNegocio negocio = new InmuebleNegocio();
                    negocio.agregar(nuevo);

                    //// Redirigir o mostrar éxito
                    Response.Redirect("Inmuebles.aspx", false);
         
            }
            catch (Exception ex)
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = $"Error al guardar: {ex.Message}";
            }
        }
    }
}