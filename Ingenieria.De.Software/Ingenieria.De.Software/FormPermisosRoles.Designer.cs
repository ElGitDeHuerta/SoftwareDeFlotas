namespace Ingenieria.De.Software
{
    partial class FormPermisosRoles
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
            this.ArbolPermisos = new System.Windows.Forms.TreeView();
            this.LBXcomponentes = new System.Windows.Forms.ListBox();
            this.TXTnomPatente = new System.Windows.Forms.TextBox();
            this.TXTinternopatente = new System.Windows.Forms.TextBox();
            this.TXTnomRol = new System.Windows.Forms.TextBox();
            this.CMBroles = new System.Windows.Forms.ComboBox();
            this.BTNagregarAlRol = new System.Windows.Forms.Button();
            this.BTNquitarDelRol = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.BTNcrearPermiso = new System.Windows.Forms.Button();
            this.BTNcrearRol = new System.Windows.Forms.Button();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.BTNabrirrolusuario = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // ArbolPermisos
            // 
            this.ArbolPermisos.Location = new System.Drawing.Point(534, 37);
            this.ArbolPermisos.Name = "ArbolPermisos";
            this.ArbolPermisos.Size = new System.Drawing.Size(356, 322);
            this.ArbolPermisos.TabIndex = 0;
            // 
            // LBXcomponentes
            // 
            this.LBXcomponentes.FormattingEnabled = true;
            this.LBXcomponentes.Location = new System.Drawing.Point(12, 37);
            this.LBXcomponentes.Name = "LBXcomponentes";
            this.LBXcomponentes.Size = new System.Drawing.Size(205, 303);
            this.LBXcomponentes.TabIndex = 1;
            // 
            // TXTnomPatente
            // 
            this.TXTnomPatente.Location = new System.Drawing.Point(223, 185);
            this.TXTnomPatente.Name = "TXTnomPatente";
            this.TXTnomPatente.Size = new System.Drawing.Size(262, 20);
            this.TXTnomPatente.TabIndex = 2;
            // 
            // TXTinternopatente
            // 
            this.TXTinternopatente.Location = new System.Drawing.Point(223, 235);
            this.TXTinternopatente.Name = "TXTinternopatente";
            this.TXTinternopatente.Size = new System.Drawing.Size(262, 20);
            this.TXTinternopatente.TabIndex = 3;
            // 
            // TXTnomRol
            // 
            this.TXTnomRol.Location = new System.Drawing.Point(223, 53);
            this.TXTnomRol.Name = "TXTnomRol";
            this.TXTnomRol.Size = new System.Drawing.Size(262, 20);
            this.TXTnomRol.TabIndex = 4;
            // 
            // CMBroles
            // 
            this.CMBroles.FormattingEnabled = true;
            this.CMBroles.Location = new System.Drawing.Point(713, 9);
            this.CMBroles.Name = "CMBroles";
            this.CMBroles.Size = new System.Drawing.Size(177, 21);
            this.CMBroles.TabIndex = 5;
            this.CMBroles.SelectedIndexChanged += new System.EventHandler(this.CMBroles_SelectedIndexChanged);
            // 
            // BTNagregarAlRol
            // 
            this.BTNagregarAlRol.Location = new System.Drawing.Point(529, 365);
            this.BTNagregarAlRol.Name = "BTNagregarAlRol";
            this.BTNagregarAlRol.Size = new System.Drawing.Size(178, 36);
            this.BTNagregarAlRol.TabIndex = 6;
            this.BTNagregarAlRol.Text = "Agregar al Rol";
            this.BTNagregarAlRol.UseVisualStyleBackColor = true;
            this.BTNagregarAlRol.Click += new System.EventHandler(this.BTNagregarAlRol_Click);
            // 
            // BTNquitarDelRol
            // 
            this.BTNquitarDelRol.Location = new System.Drawing.Point(712, 365);
            this.BTNquitarDelRol.Name = "BTNquitarDelRol";
            this.BTNquitarDelRol.Size = new System.Drawing.Size(178, 36);
            this.BTNquitarDelRol.TabIndex = 7;
            this.BTNquitarDelRol.Text = "Quitar del Rol";
            this.BTNquitarDelRol.UseVisualStyleBackColor = true;
            this.BTNquitarDelRol.Click += new System.EventHandler(this.BTNquitarDelRol_Click);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(220, 169);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(100, 13);
            this.label1.TabIndex = 8;
            this.label1.Text = "Nombre del permiso";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(220, 219);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(135, 13);
            this.label2.TabIndex = 9;
            this.label2.Text = "Nombre interno del permiso";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(220, 37);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(80, 13);
            this.label3.TabIndex = 10;
            this.label3.Text = "Nombre del Rol";
            // 
            // BTNcrearPermiso
            // 
            this.BTNcrearPermiso.Location = new System.Drawing.Point(223, 261);
            this.BTNcrearPermiso.Name = "BTNcrearPermiso";
            this.BTNcrearPermiso.Size = new System.Drawing.Size(121, 23);
            this.BTNcrearPermiso.TabIndex = 11;
            this.BTNcrearPermiso.Text = "Crear Permiso";
            this.BTNcrearPermiso.UseVisualStyleBackColor = true;
            this.BTNcrearPermiso.Click += new System.EventHandler(this.BTNcrearPermiso_Click);
            // 
            // BTNcrearRol
            // 
            this.BTNcrearRol.Location = new System.Drawing.Point(223, 79);
            this.BTNcrearRol.Name = "BTNcrearRol";
            this.BTNcrearRol.Size = new System.Drawing.Size(121, 23);
            this.BTNcrearRol.TabIndex = 12;
            this.BTNcrearRol.Text = "Crear Rol";
            this.BTNcrearRol.UseVisualStyleBackColor = true;
            this.BTNcrearRol.Click += new System.EventHandler(this.BTNcrearRol_Click);
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(543, 12);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(164, 13);
            this.label4.TabIndex = 13;
            this.label4.Text = "Seleccione un Rol para visualizar";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(12, 17);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(90, 13);
            this.label5.TabIndex = 14;
            this.label5.Text = "Roles y Permisos ";
            // 
            // BTNabrirrolusuario
            // 
            this.BTNabrirrolusuario.Location = new System.Drawing.Point(235, 343);
            this.BTNabrirrolusuario.Name = "BTNabrirrolusuario";
            this.BTNabrirrolusuario.Size = new System.Drawing.Size(288, 58);
            this.BTNabrirrolusuario.TabIndex = 15;
            this.BTNabrirrolusuario.Text = "Asignar Roles a Usuario";
            this.BTNabrirrolusuario.UseVisualStyleBackColor = true;
            this.BTNabrirrolusuario.Click += new System.EventHandler(this.BTNabrirrolusuario_Click);
            // 
            // FormPermisosRoles
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(902, 424);
            this.Controls.Add(this.BTNabrirrolusuario);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.BTNcrearRol);
            this.Controls.Add(this.BTNcrearPermiso);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.BTNquitarDelRol);
            this.Controls.Add(this.BTNagregarAlRol);
            this.Controls.Add(this.CMBroles);
            this.Controls.Add(this.TXTnomRol);
            this.Controls.Add(this.TXTinternopatente);
            this.Controls.Add(this.TXTnomPatente);
            this.Controls.Add(this.LBXcomponentes);
            this.Controls.Add(this.ArbolPermisos);
            this.Name = "FormPermisosRoles";
            this.Text = "FormPermisosRoles";
            this.Load += new System.EventHandler(this.FormPermisosRoles_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TreeView ArbolPermisos;
        private System.Windows.Forms.ListBox LBXcomponentes;
        private System.Windows.Forms.TextBox TXTnomPatente;
        private System.Windows.Forms.TextBox TXTinternopatente;
        private System.Windows.Forms.TextBox TXTnomRol;
        private System.Windows.Forms.ComboBox CMBroles;
        private System.Windows.Forms.Button BTNagregarAlRol;
        private System.Windows.Forms.Button BTNquitarDelRol;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button BTNcrearPermiso;
        private System.Windows.Forms.Button BTNcrearRol;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button BTNabrirrolusuario;
    }
}