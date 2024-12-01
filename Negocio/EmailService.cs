using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Threading.Tasks;


namespace Negocio
{
    public class EmailService
    {
        private MailMessage email;
        private SmtpClient server;

        public EmailService()
        {
            server = new SmtpClient();
            server.Credentials = new NetworkCredential("progutnpacheco@gmail.com", "peogzwfkvhjhakat");
            server.EnableSsl = true;
            server.Port = 587;
            server.EnableSsl = true;
            server.Host = "smtp.gmail.com";

            email = new MailMessage();
            email.From = new MailAddress("progutnpacheco@gmail.com");
        }

        public void armarCorreo(string emailDestino, string asunto, string cuerpo)
        {
            email.To.Add(emailDestino);
            email.Subject = asunto;
            email.IsBodyHtml = true;
            email.Body = cuerpo;
        }

        public void enviarEmail()
        {
            try
            {
                server.Send(email);
            }
            catch (Exception ex)
            {
                throw new Exception("Error al enviar correo electrónico.", ex);
            }
        }
    }
}
