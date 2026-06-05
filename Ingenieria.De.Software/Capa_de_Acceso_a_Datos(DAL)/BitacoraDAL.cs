using Capa_de_Dominio_BE_;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Capa_de_Acceso_a_Datos_DAL_
{
    public class BitacoraDAL
    {
        public static int Guardar(RegistroBitacora registro)
        {
            DAO dao = new DAO();
            string comando = "INSERT INTO Bitacora (Bitacora_Usuario, Bitacora_Actividad, Bitacora_FechaHora) VALUES (@usuario, @actividad, @fechahora)";
            List<SqlParameter> parametros = new List<SqlParameter>
            {
                new SqlParameter("@usuario",   registro.Usuario),
                new SqlParameter("@actividad", registro.Actividad),
                new SqlParameter("@fechahora", registro.FechaHora)
            };
            return dao.EjecutarNonQuery(comando, parametros);
        }
    }
}
