namespace Ingenieria.De.Software
{
    partial class FormAsignacionPermisos
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.CMBusuarios = new System.Windows.Forms.ComboBox();
            this.ArbolPermisosUsuario = new System.Windows.Forms.TreeView();
            this.LBXpermisosDisponibles = new System.Windows.Forms.ListBox();
            this.BTNasignar = new System.Windows.Forms.Button();
            this.BTNrevocar = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // CMBusuarios
            // 
            this.CMBusuarios.FormattingEnabled = true;
            this.CMBusuarios.Location = new System.Drawing.Point(12, 24);
            this.CMBusuarios.Name = "CMBusuarios";
            this.CMBusuarios.Size = new System.Drawing.Size(365, 21);
            this.CMBusuarios.TabIndex = 0;
            this.CMBusuarios.SelectedIndexChanged += new System.EventHandler(this.CMBusuarios_SelectedIndexChanged);
            // 
            // ArbolPermisosUsuario
            // 
            this.ArbolPermisosUsuario.Location = new System.Drawing.Point(383, 24);
            this.ArbolPermisosUsuario.Name = "ArbolPermisosUsuario";
            this.ArbolPermisosUsuario.Size = new System.Drawing.Size(405, 263);
            this.ArbolPermisosUsuario.TabIndex = 1;
            // 
            // LBXpermisosDisponibles
            // 
            this.LBXpermisosDisponibles.FormattingEnabled = true;
            this.LBXpermisosDisponibles.Location = new System.Drawing.Point(12, 65);
            this.LBXpermisosDisponibles.Name = "LBXpermisosDisponibles";
            this.LBXpermisosDisponibles.Size = new System.Drawing.Size(364, 290);
            this.LBXpermisosDisponibles.TabIndex = 2;
            // 
            // BTNasignar
            // 
            this.BTNasignar.Location = new System.Drawing.Point(383, 301);
            this.BTNasignar.Name = "BTNasignar";
            this.BTNasignar.Size = new System.Drawing.Size(193, 54);
            this.BTNasignar.TabIndex = 3;
            this.BTNasignar.Text = "Asignar Rol";
            this.BTNasignar.UseVisualStyleBackColor = true;
            this.BTNasignar.Click += new System.EventHandler(this.BTNasignar_Click);
            // 
            // BTNrevocar
            // 
            this.BTNrevocar.Location = new System.Drawing.Point(595, 301);
            this.BTNrevocar.Name = "BTNrevocar";
            this.BTNrevocar.Size = new System.Drawing.Size(193, 54);
            this.BTNrevocar.TabIndex = 4;
            this.BTNrevocar.Text = "Revocar Rol";
            this.BTNrevocar.UseVisualStyleBackColor = true;
            this.BTNrevocar.Click += new System.EventHandler(this.BTNrevocar_Click);
            // 
            // FormAsignacionPermisos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 385);
            this.Controls.Add(this.BTNrevocar);
            this.Controls.Add(this.BTNasignar);
            this.Controls.Add(this.LBXpermisosDisponibles);
            this.Controls.Add(this.ArbolPermisosUsuario);
            this.Controls.Add(this.CMBusuarios);
            this.Name = "FormAsignacionPermisos";
            this.Text = "FormAsignacionPermisos";
            this.Load += new System.EventHandler(this.FormAsignacionPermisos_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.ComboBox CMBusuarios;
        private System.Windows.Forms.TreeView ArbolPermisosUsuario;
        private System.Windows.Forms.ListBox LBXpermisosDisponibles;
        private System.Windows.Forms.Button BTNasignar;
        private System.Windows.Forms.Button BTNrevocar;
    }
}