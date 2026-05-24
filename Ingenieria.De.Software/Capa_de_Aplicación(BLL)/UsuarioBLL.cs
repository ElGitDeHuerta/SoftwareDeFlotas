using Capa_de_Acceso_a_Datos_DAL_;
using Capa_de_Dominio_BE_;
using Capa_de_Servicios_SL_;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Capa_de_Aplicación_BLL_
{
    public class UsuarioBLL
    {
        private CryptoManager crypton = new CryptoManager();
        public int Guardar(Usuario usa)
        {
            ValidarCredenciales(usa.NombreUsuario, usa.Contraseña);
            return UsuarioDAL.Guardar(usa);
        }
        public int Eliminar(Usuario usa)
        {
            return UsuarioDAL.Eliminar(usa);
        }
        public Usuario ObtenerPorId(int pid)
        {
            return UsuarioDAL.ObtenerPorId(pid);
        }
        public List<Usuario> Listar()
        {
            return UsuarioDAL.Listar();
        }
        public bool Login(string usa, string pas)
        {
            string username = usa.Trim();
            string password = pas.Trim();
            ValidarCredenciales(username, password);
            Usuario usuario = UsuarioDAL.ObtenerPorNombre(username);

            if (usuario == null)
                return false;

            if (crypton.Compare(password, usuario.Contraseña))
            {
                SessionManager.TraerInstancia().Login(usuario);
                return true;
            }
            return false;
        }
        //metodos de soporte
        public void ValidarCredenciales(string usuario, string password)
        {
            //quiza esto tendriamos que acalararlo en la documentacion 
            if (string.IsNullOrWhiteSpace(usuario))
                throw new Exception("Usuario invalido");

            if (string.IsNullOrWhiteSpace(password))
                throw new Exception("Contraseña invalida");

            if (usuario.Length > 50)
                throw new Exception("Usuario demasiado largo");

            if (password.Length > 100)
                throw new Exception("Contraseña demasiado larga");
        }

    }
}
