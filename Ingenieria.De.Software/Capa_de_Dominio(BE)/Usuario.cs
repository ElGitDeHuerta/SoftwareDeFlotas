using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Capa_de_Dominio_BE_
{
    public class Usuario
    {
        public Usuario(int id)
        {
            Id = id;
        }
        public int Id { get; set; }
        public string NombreUsuario { get; set; }
        public string Contraseña { get; set; }

    }
}
