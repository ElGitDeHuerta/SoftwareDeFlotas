using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Capa_de_Dominio_BE_
{
    public class Usuario: IVerificable
    {
        public Usuario(int id)
        {
            Id = id;
        }
        public int Id { get; set; }
        public string NombreUsuario { get; set; }
        public string Contraseña { get; set; }
        public bool Activo { get; set; }
        public int NivelPermisos {  get; set; }
        public bool BloqueoDV { get; set; }
        public string DVH { get; set; }

        public List<string> ObtenerCamposParaDV()
        {
            return new List<string>
            {
                this.Id.ToString(), this.NombreUsuario, this.Contraseña, this.Activo.ToString(), this.NivelPermisos.ToString(), this.BloqueoDV.ToString()
            };
        }
    }
}
