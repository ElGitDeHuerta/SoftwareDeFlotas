using Capa_de_Aplicación_BLL_;
using Capa_de_Dominio_BE_;
using Capa_de_Servicios_SL_;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Ingenieria.De.Software
{
    public partial class FormGestionUsuarios : Form
    {
        public Form PadredelPadreLogin { get; set; }
        public FormGestionUsuarios()
        {
            InitializeComponent();
        }

        private void FormGestionUsuarios_Load(object sender, EventArgs e)
        {
            CargarGrilla();
        }


        // metodos de la grilla
        #region grilla
        private void CargarGrilla()
        {
            DGVusuaios.Columns.Add("Id", "Id");
            DGVusuaios.Columns["Id"].Visible = false;

            DGVusuaios.Columns.Add("Nombre", "Nombre");
            DGVusuaios.Columns["Nombre"].Width = 200;

            DGVusuaios.Columns.Add("Contraseña", "Contraseña");
            DGVusuaios.Columns["Contraseña"].Width = 200;

            DataGridViewCheckBoxColumn columnaActivo = new DataGridViewCheckBoxColumn();
            columnaActivo.Name = "Activo";
            columnaActivo.HeaderText = "Activo";
            DGVusuaios.Columns.Add(columnaActivo);
            DGVusuaios.Columns["Activo"].Width = 200;

            DGVusuaios.AllowUserToAddRows = false;
            DGVusuaios.AllowUserToDeleteRows = false;
            DGVusuaios.EditMode = DataGridViewEditMode.EditProgrammatically;
            DGVusuaios.SelectionMode = DataGridViewSelectionMode.FullRowSelect;
            DGVusuaios.MultiSelect = false;

            Actualizar();
        }
        private void Actualizar()
        {
            DGVusuaios.Rows.Clear();

            List<Usuario> usuarios = UsuarioBLL.Listar();

            foreach (var usu in usuarios)
            {
                DGVusuaios.Rows.Add(usu.Id, usu.NombreUsuario, usu.Contraseña, usu.Activo.ToString());
            }
        }
        private void DGVusuaios_SelectionChanged(object sender, EventArgs e)
        {
            if (DGVusuaios.CurrentRow != null)
            {
                TXTnom.Text = DGVusuaios.CurrentRow.Cells["Nombre"].Value.ToString();
                TXTcon.Text = DGVusuaios.CurrentRow.Cells["Contraseña"].Value.ToString();
                CHKactivo.Checked = Convert.ToBoolean(DGVusuaios.CurrentRow.Cells["Activo"].Value);
            }
        }
        #endregion grilla

        // abrir y cerrar formularios
        #region formularios
        private void FormGestionUsuarios_FormClosed(object sender, FormClosedEventArgs e)
        {

            if (this.PadredelPadreLogin != null)
            {
                this.PadredelPadreLogin.Show();
            }
        }
        private void llamarAMB(Constantes.TiposOperacion oper)
        {

            if (DGVusuaios.SelectedRows.Count > 0)
            {
                FormUsuarioABM mForm = new FormUsuarioABM();
                mForm.StartPosition = FormStartPosition.CenterParent;
                if(oper != Constantes.TiposOperacion.Alta)
                {
                    int mId = int.Parse(DGVusuaios.SelectedRows[0].Cells[0].Value.ToString());
                    mForm.UsuarioEditable = UsuarioBLL.ObtenerPorId(mId);
                }
                mForm.TipoOperacion = oper;
                mForm.ShowDialog(this);
                Actualizar();
            }
            else
            {
                MessageBox.Show("Debe seleccionar un Usuario para realizar esta operacion de " + oper.ToString());
            }
        }
        #endregion formularios

        // botones
        #region botones
        private void BTNcrearUsu_Click(object sender, EventArgs e)
        {
            llamarAMB(Constantes.TiposOperacion.Alta);
        }

        private void BTNmodUsu_Click(object sender, EventArgs e)
        {
            llamarAMB(Constantes.TiposOperacion.Modificacion);
        }

        private void BTNeliminarUsu_Click(object sender, EventArgs e)
        {
            llamarAMB(Constantes.TiposOperacion.Baja);
        }
        private void BTNvolver_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        #endregion botones

    }
}
