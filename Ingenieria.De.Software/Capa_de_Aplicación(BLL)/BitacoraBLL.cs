using Capa_de_Acceso_a_Datos_DAL_;
using Capa_de_Dominio_BE_;

namespace Capa_de_Aplicación_BLL_
{
    public class BitacoraBLL
    {
        public static void Registrar(string usuario, string actividad)
        {
            RegistroBitacora registro = new RegistroBitacora(usuario, actividad);
            BitacoraDAL.Guardar(registro);
        }
    }
}
