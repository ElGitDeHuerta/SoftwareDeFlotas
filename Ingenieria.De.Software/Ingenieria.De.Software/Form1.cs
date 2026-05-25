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
    public partial class Form1 : Form
    {
        int intentos = 3;
        public Form1()
        {
            InitializeComponent();
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            LBLLoguin.Focus();
        }

        //controles
        #region eventos principales de los controles
        private void BTNingresar_Click(object sender, EventArgs e)
        {
            //para hacer pruebas Juan66, 123456 ; Maria01, miPerro ; Carlos22, contrasenia ; Ana77, reina2001 ; PedroX, elmascapo67


            UsuarioBLL usabll = new UsuarioBLL();
            try
            {
                if (usabll.Login(TXTusua.Text, TXTcontra.Text))
                {
                    Usuario usaLog = SessionManager.TraerInstancia().usuarioINS;
                    string fech = SessionManager.TraerInstancia().FechaDeInicio.ToString();
                    MessageBox.Show($"Ingreso Válido.\n\n bienvenido {usaLog.NombreUsuario}\n ");
                    SaltarAPantallaPrincipal(usabll);
                }
                else
                {
                    intentos--;
                    LBLtimer.Text = $"le quedan {intentos} intentos";
                    if (intentos > 0)
                        throw new Exception("Nombre de usuario o contraseña incorrectas");
                    else
                        BloqueTemporaldelBoton(10);
                }
            }
            catch (Exception ex) { Mostrarexepcion(ex); }
        }
        private void BTNcancel_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }
        private void CHKcontra_CheckedChanged(object sender, EventArgs e)
        {
            if (CHKcontra.Checked == false && TXTcontra.Text != "CONTRASEÑA")
                TXTcontra.UseSystemPasswordChar = true;
            else
                TXTcontra.UseSystemPasswordChar = false;
        }
        #endregion eventos principales de los controles

        //metodos de soporte
        #region metodos de soporte
        private void SaltarAPantallaPrincipal(UsuarioBLL musabll)
        {
            try
            {
                Form2 Fprinciapl = new Form2();
                Fprinciapl.PadreLogin = this;
                this.Hide();
                Fprinciapl.Show();
            }
            catch (Exception ex) { MessageBox.Show(ex.Message); }
        }
        private void BloqueTemporaldelBoton(int segundos)
        {
            desabilitarboton();

            Timer timer = new Timer();
            timer.Interval = 1000;

            timer.Tick += (s, e) =>
            {
                segundos--;
                LBLtimer.Text = $"Esperá {segundos} segundos";

                if (segundos <= 0)
                {
                    timer.Stop();
                    reactivarbotones();
                    intentos = 3;
                    LBLtimer.Text = "le quedan 3 intentos";
                }
            };
            timer.Start();
        }
        private void desabilitarboton()
        {
            BTNingresar.Enabled = false;
            BTNingresar.ForeColor = SystemColors.ActiveBorder;
            BTNingresar.BackColor = SystemColors.WindowFrame;
        }
        private void Mostrarexepcion(Exception ex)
        {
            if(ex.Message.Length < 200)
                LBLerrores.Text = ex.Message;
            else
                MessageBox.Show(ex.Message);
            desabilitarboton();
        }
        private void reactivarbotones()
        {
            if (LBLerrores.Text != ". . .")
                LBLerrores.Text = ". . .";
            if (!BTNingresar.Enabled)
            {
                BTNingresar.Enabled = true;
                BTNingresar.ForeColor = SystemColors.WindowFrame;
                BTNingresar.BackColor = SystemColors.ActiveBorder;
            }
        }
        #endregion metodos de soporte

        // eventos de controles
        #region eventos para controles
        private void TXTusua_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsLetterOrDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                e.Handled = true; 
            }
        }
        private void TXTcontra_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsLetterOrDigit(e.KeyChar) && !char.IsControl(e.KeyChar))
            {
                e.Handled = true; 
            }
        }
        #endregion eventos para controles

        //diseño de botones
        #region diseño de botones
        private void TXTusua_Enter(object sender, EventArgs e)
        {
            if (TXTusua.Text == "USUARIO")
            {
                TXTusua.Text = "";
                TXTusua.Font = new Font("Microsoft JhengHei", 12);
                TXTusua.Location = new Point(TXTusua.Location.X, TXTusua.Location.Y + 20);
            }
            reactivarbotones();
        }
        private void TXTusua_Leave(object sender, EventArgs e)
        {
            if (TXTusua.Text == "")
            {
                TXTusua.Text = "USUARIO";
                TXTusua.Font = new Font("Microsoft JhengHei", 22);
                TXTusua.Location = new Point(TXTusua.Location.X, TXTusua.Location.Y - 20);
            }
        }
        private void TXTcontra_Enter(object sender, EventArgs e)
        {
            if (TXTcontra.Text == "CONTRASEÑA")
            {
                TXTcontra.Text = "";
                if (!CHKcontra.Checked)
                {
                    TXTcontra.UseSystemPasswordChar = true;
                    TXTcontra.Font = new Font("Microsoft JhengHei", 12);

                }
                else { TXTcontra.Font = new Font("Microsoft JhengHei", 10); }
                TXTcontra.Location = new Point(TXTcontra.Location.X, TXTcontra.Location.Y + 20);
            }
            reactivarbotones();
        }
        private void TXTcontra_Leave(object sender, EventArgs e)
        {
            if (TXTcontra.Text == "")
            {
                TXTcontra.Text = "CONTRASEÑA";
                TXTcontra.UseSystemPasswordChar = false;
                TXTcontra.Font = new Font("Microsoft JhengHei", 22);
                TXTcontra.Location = new Point(TXTcontra.Location.X, TXTcontra.Location.Y - 20);
            }
        }

        #endregion diseño de botones

    }
}
