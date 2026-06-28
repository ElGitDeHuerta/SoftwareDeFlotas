using Capa_de_Acceso_a_Datos_DAL_;
using Capa_de_Dominio_BE_;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Capa_de_Aplicación_BLL_
{
    public class PermisoBLL
    {
        public bool ReferenciaCircular(ComponentePermiso padre, int hijoIdAMeter)
        {
            // Validar de forma recursiva si un rol contiene a otro, evitando ciclos infinitos
            if (padre.Id == hijoIdAMeter) return true; // caso base: se quiere meter un objeto en sí mismo

            foreach (var hi in padre.Hijos) // evaluar todos los hijos del padre en memoria
            {
                if (hi.Id == hijoIdAMeter) return true; // si ya está el hijo directo

                if (hi is Rol) // si el hijo es un rol, buscamos en profundidad de sus hijos
                {
                    if (ReferenciaCircular(hi, hijoIdAMeter))
                        return true;
                }
            }
            return false;
        }

        public void AgregarComponenteARol(Rol padre, ComponentePermiso hijo)
        {
            // Validamos que el padre no este contenido ya dentro del hijo
            if (ReferenciaCircular(hijo, padre.Id))
            {
                throw new Exception($"Operación inválida: Agregar '{hijo.Nombre}' a '{padre.Nombre}' provoca una referencia circular");
            }

            padre.AgregarHijo(hijo); //agregar hijo al componente

            // persistir en la tabla intermedia
            int resultado = PermisoDAL.AgregarHijo(padre.Id, hijo.Id);
            if (resultado == 0)
            {
                // En caso de fallo en BD, revertimos el cambio en memoria para mantener la consistencia
                padre.QuitarHijo(hijo);
                throw new Exception("Hubo un error al intentar persistir la relacion en la base de datos");
            }
        }

        public void QuitarComponenteDeRol(Rol padre, ComponentePermiso hijo)
        {
            // Quitar un componente de un rol contenedor
            padre.QuitarHijo(hijo);
            PermisoDAL.QuitarHijo(padre.Id, hijo.Id);
        }

        public void GuardarComponente(ComponentePermiso componente)
        {
            //Crear o actualizar un Rol o un permiso 
            if (string.IsNullOrWhiteSpace(componente.Nombre))
                throw new Exception("El componente tiene que tener un Nombre");

            // Validamos si es una hoja para exigir que tenga el identificador interno del sistema
            if (componente is PermisoSimple && string.IsNullOrWhiteSpace(componente.NombreInterno))
                throw new Exception("Un permiso simple debe tener asignado un Nombre Interno para el control de accesos");

            bool esFamilia = (componente is Rol);

            // persistir componente
            int resultado = PermisoDAL.GuardarComponente(componente, esFamilia);
            if (resultado == 0)
                throw new Exception("Ocurrió un error al intentar guardar el componente en la base de datos");
        }

        public List<ComponentePermiso> ListarComponentesRaiz()
        {
            // traer la lista de componentes
            return PermisoDAL.ListarComponentesRaiz();
        }

        public Rol ObtenerRolCompleto(int rolId)
        {
            //traer un rol 
            return PermisoDAL.ObtenerRolCompleto(rolId);
        }
    }
}
