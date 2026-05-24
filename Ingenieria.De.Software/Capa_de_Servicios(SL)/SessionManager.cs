using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capa_de_Dominio_BE_;

namespace Capa_de_Servicios_SL_
{
    public class SessionManager //aplicacion de singletone
    {
        private static object Lock = new object(); //objeto bloqueador para mas seguirdad en multihilo

        private static SessionManager instancia;
        public Usuario usuarioINS { get; private set; }
        public DateTime FechaDeInicio { get; private set; }
        private SessionManager() { }
        public static SessionManager TraerInstancia()
        {
            lock (Lock) 
            {
                if (instancia == null)
                    instancia = new SessionManager();
                return instancia;
            }
        }

        #region LogIn/LogOut
        public void Login(Usuario usa)
        {
            lock (Lock)
            {
                if (this.usuarioINS == null)
                {
                    this.usuarioINS = usa;
                    this.FechaDeInicio = DateTime.Now;
                }
                else { throw new Exception("Ya hay un usuario con sesión activa"); }
            }
        }
        public void Logout() 
        {
            lock (Lock)
            {
                if (this.usuarioINS != null)
                {
                    this.usuarioINS = null;
                    this.FechaDeInicio = default(DateTime);
                }
                else{ throw new Exception("No hay una sesión activa para cerrar");}
            }
        }
        #endregion LogIn/LogOut
    }
}
