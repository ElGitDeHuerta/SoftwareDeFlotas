using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Capa_de_Dominio_BE_;

namespace Capa_de_Servicios_SL_
{
    public class ValidadorDeIntegridad
    {
        private readonly CryptoManager encriptador = new CryptoManager();

        /// Calcula el DV Horizontal aplicando la suma ponderada por posición de carácter y de atributo,
        /// y luego aplicando el Hash SHA-256 para seguridad distributiva.
        public string CalcularDVH(IVerificable entidad)
        {
            List<string> atributos = entidad.ObtenerCamposParaDV();
            long sumaHasheable = 0;

            // Recorremos los atributos (i + 1 representa la POSICIÓN DEL ATRIBUTO)
            for (int i = 0; i < atributos.Count; i++)
            {
                int posicionAtributo = i + 1;

                // Si viene null, lo tratamos como un string vacío de forma segura
                string valorAtributo = atributos[i] ?? string.Empty;

                // Recorremos los caracteres del atributo (j + 1 representa la POSICIÓN DEL CARÁCTER)
                for (int j = 0; j < valorAtributo.Length; j++)
                {
                    int codigoASCII = (int)valorAtributo[j];
                    int posicionCaracter = j + 1;

                    // Fórmula requerida: Contenido * Posición Carácter * Posición Atributo
                    sumaHasheable += (long)codigoASCII * posicionCaracter * posicionAtributo;
                }
            }

            // 3. Pasamos el número final ponderado por el Hash para obtener los 64 caracteres de integridad
            return encriptador.Hash(sumaHasheable.ToString());
        }

        /// <summary>
        /// Calcula el DV Vertical concatenando los hashes horizontales ordenados de la tabla y aplicando SHA-256.
        /// </summary>
        public string CalcularDVV(List<string> listaDVH)
        {
            StringBuilder builder = new StringBuilder();

            // Concatenamos todos los DVH de las filas en el orden en que vienen de la base de datos
            foreach (var dvh in listaDVH)
            {
                builder.Append(dvh);
            }

            // Devolvemos el hash del bloque completo de registros
            return encriptador.Hash(builder.ToString());
        }
    }
}
