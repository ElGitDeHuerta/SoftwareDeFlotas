USE [DB_ingenieria_de_software]
GO

-- ============================================================
-- Update_BD_Composite.sql
-- Agrega las tablas y datos del sistema de Componentes (T04)
-- Ejecutar una sola vez sobre la BD existente.
-- ============================================================


-- ============================================================
-- 1. TABLA: Componente (catálogo de permisos y roles)
-- ============================================================

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Componente')
BEGIN
    CREATE TABLE [dbo].[Componente] (
        [Componente_Id]  INT           NOT NULL,
        [Nombre]         VARCHAR(100)  NOT NULL,
        [NombreInterno]  VARCHAR(100)  NULL,
        [EsFamilia]      BIT           NOT NULL,
        CONSTRAINT [PK_Componente] PRIMARY KEY CLUSTERED ([Componente_Id] ASC)
    )
    PRINT 'Tabla Componente creada.'
END
ELSE
    PRINT 'Tabla Componente ya existe — se omite CREATE.'
GO

-- ============================================================
-- 2. TABLA: Componente_Hijo (árbol padre → hijo)
-- ============================================================

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Componente_Hijo')
BEGIN
    CREATE TABLE [dbo].[Componente_Hijo] (
        [Padre_Id] INT NOT NULL,
        [Hijo_Id]  INT NOT NULL,
        CONSTRAINT [PK_Componente_Hijo] PRIMARY KEY CLUSTERED ([Padre_Id] ASC, [Hijo_Id] ASC),
        CONSTRAINT [FK_Componente_Hijo_Padre] FOREIGN KEY ([Padre_Id])
            REFERENCES [dbo].[Componente] ([Componente_Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_Componente_Hijo_Hijo]  FOREIGN KEY ([Hijo_Id])
            REFERENCES [dbo].[Componente] ([Componente_Id])
    )
    PRINT 'Tabla Componente_Hijo creada.'
END
ELSE
    PRINT 'Tabla Componente_Hijo ya existe — se omite CREATE.'
GO

-- ============================================================
-- 3. TABLA: Usuario_Componente (usuario ↔ componente asignado)
-- ============================================================

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Usuario_Componente')
BEGIN
    CREATE TABLE [dbo].[Usuario_Componente] (
        [Usuario_Id]    INT NOT NULL,
        [Componente_Id] INT NOT NULL,
        CONSTRAINT [PK_Usuario_Componente] PRIMARY KEY CLUSTERED ([Usuario_Id] ASC, [Componente_Id] ASC),
        CONSTRAINT [FK_UC_Usuario]    FOREIGN KEY ([Usuario_Id])
            REFERENCES [dbo].[Usuario] ([Usuario_Id]) ON DELETE CASCADE,
        CONSTRAINT [FK_UC_Componente] FOREIGN KEY ([Componente_Id])
            REFERENCES [dbo].[Componente] ([Componente_Id])
    )
    PRINT 'Tabla Usuario_Componente creada.'
END
ELSE
    PRINT 'Tabla Usuario_Componente ya existe — se omite CREATE.'
GO

-- ============================================================
-- 4. TABLA: DigitoVerificadorVertical (por si no existe aún)
-- ============================================================

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'DigitoVerificadorVertical')
BEGIN
    CREATE TABLE [dbo].[DigitoVerificadorVertical] (
        [DVV_Tabla] VARCHAR(50) NOT NULL,
        [DVV_Hash]  VARCHAR(64) NOT NULL,
        PRIMARY KEY CLUSTERED ([DVV_Tabla] ASC)
    )
    PRINT 'Tabla DigitoVerificadorVertical creada.'
END
ELSE
    PRINT 'Tabla DigitoVerificadorVertical ya existe — se omite CREATE.'
GO

-- ============================================================
-- 5. ÍNDICE ÚNICO en NombreInterno (filtra NULLs)
-- ============================================================

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE name = 'UX_Componente_NombreInterno_NoNulos')
BEGIN
    CREATE UNIQUE NONCLUSTERED INDEX [UX_Componente_NombreInterno_NoNulos]
    ON [dbo].[Componente] ([NombreInterno] ASC)
    WHERE ([NombreInterno] IS NOT NULL)
    PRINT 'Índice único NombreInterno creado.'
END
ELSE
    PRINT 'Índice ya existe — se omite CREATE.'
GO

-- ============================================================
-- 6. DATOS: Catálogo de permisos (hojas) y roles (contenedores)
-- ============================================================

IF NOT EXISTS (SELECT 1 FROM Componente WHERE Componente_Id = 1)
BEGIN
    INSERT INTO [dbo].[Componente] (Componente_Id, Nombre, NombreInterno, EsFamilia) VALUES
    -- Permisos (hojas) — EsFamilia = 0
    (1,  'Acceso de Rescate por Falla',      'Permiso_Rescate',           0),
    (2,  'Visualizar Usuarios',              'Permiso_Ver_Usuarios',      0),
    (3,  'Alta de Usuarios',                 'Permiso_Alta_Usuario',      0),
    (4,  'Modificación de Usuarios',         'Permiso_Modificar_Usuario', 0),
    (5,  'Baja de Usuarios',                 'Permiso_Baja_Usuario',      0),
    (6,  'Asignar Roles a Usuarios',         'Permiso_Asignar_Roles',     0),
    (7,  'Ver Logs de Bitácora',             'Permiso_Ver_Bitacora',      0),
    (8,  'Recalcular Dígitos Verificadores', 'Permiso_Recalcular_DV',    0),
    (12, 'Permiso sin propósito',            'Permiso_Sin_proposito',     0),
    -- Roles (contenedores) — EsFamilia = 1
    (9,  'Rol Administrador de Rescate',     'Rol_Rescate',               1),
    (10, 'Rol Administrador General',        'Rol_Admin',                 1),
    (11, 'Rol Sin Propósito',               NULL,                         1)

    PRINT 'Catálogo de Componentes insertado.'
END
ELSE
    PRINT 'Catálogo ya existe — se omiten los INSERTs.'
GO

-- ============================================================
-- 7. DATOS: Árbol de relaciones (quién tiene qué)
--
--   Rol_Rescate (9) → Permiso_Rescate (1), Rol_Sin_Proposito (11)
--   Rol_Admin  (10) → todos los permisos de gestión (2-8)
--   Rol_Sin_Proposito (11) → Permiso_Sin_proposito (12)
-- ============================================================

IF NOT EXISTS (SELECT 1 FROM Componente_Hijo WHERE Padre_Id = 10)
BEGIN
    INSERT INTO [dbo].[Componente_Hijo] (Padre_Id, Hijo_Id) VALUES
    (9,  1),    -- Rol_Rescate      → Permiso_Rescate
    (9,  11),   -- Rol_Rescate      → Rol_Sin_Proposito
    (10, 2),    -- Rol_Admin        → Permiso_Ver_Usuarios
    (10, 3),    -- Rol_Admin        → Permiso_Alta_Usuario
    (10, 4),    -- Rol_Admin        → Permiso_Modificar_Usuario
    (10, 5),    -- Rol_Admin        → Permiso_Baja_Usuario
    (10, 6),    -- Rol_Admin        → Permiso_Asignar_Roles
    (10, 7),    -- Rol_Admin        → Permiso_Ver_Bitacora
    (10, 8),    -- Rol_Admin        → Permiso_Recalcular_DV
    (11, 12)    -- Rol_Sin_Proposito→ Permiso_Sin_proposito

    PRINT 'Relaciones Componente_Hijo insertadas.'
END
ELSE
    PRINT 'Relaciones ya existen — se omiten los INSERTs.'
GO

-- ============================================================
-- 8. DATOS: Asignación de usuarios a roles
--
--   Juan66  (Id=1) → Rol_Rescate (9) + Rol_Admin (10)
--   Maria01 (Id=2) → Rol_Admin (10)
--   PedroX  (Id=5) → Rol_Rescate (9) + Rol_Admin (10)
--   Carlos22 y Ana77 quedan sin rol (se asignan desde la app)
-- ============================================================

IF NOT EXISTS (SELECT 1 FROM Usuario_Componente WHERE Usuario_Id = 1)
    AND EXISTS (SELECT 1 FROM Usuario WHERE Usuario_Id = 1)
BEGIN
    INSERT INTO [dbo].[Usuario_Componente] (Usuario_Id, Componente_Id) VALUES (1, 9), (1, 10)
    PRINT 'Roles asignados a Juan66.'
END
GO

IF NOT EXISTS (SELECT 1 FROM Usuario_Componente WHERE Usuario_Id = 2)
    AND EXISTS (SELECT 1 FROM Usuario WHERE Usuario_Id = 2)
BEGIN
    INSERT INTO [dbo].[Usuario_Componente] (Usuario_Id, Componente_Id) VALUES (2, 10)
    PRINT 'Rol asignado a Maria01.'
END
GO

IF NOT EXISTS (SELECT 1 FROM Usuario_Componente WHERE Usuario_Id = 5)
    AND EXISTS (SELECT 1 FROM Usuario WHERE Usuario_Id = 5)
BEGIN
    INSERT INTO [dbo].[Usuario_Componente] (Usuario_Id, Componente_Id) VALUES (5, 9), (5, 10)
    PRINT 'Roles asignados a PedroX.'
END
GO

-- ============================================================
-- AVISO IMPORTANTE sobre Dígitos Verificadores
-- ============================================================
--
-- El DVH de cada usuario se calcula incluyendo sus Permisos asignados.
-- Al ejecutar este script los DVH existentes quedan DESACTUALIZADOS
-- porque los usuarios ahora tienen componentes asignados.
--
-- Consecuencia: al iniciar la app, el DV fallará y bloqueará
-- a los usuarios no-admin (Carlos22, Ana77).
-- Juan66 y PedroX (NivelPermisos=1) NO serán bloqueados.
--
-- Solución: luego de correr este script, iniciar sesión como Juan66
-- y recalcular el DV desde la opción correspondiente en el sistema.
-- ============================================================

PRINT '=== Script finalizado. Ver aviso sobre DVH arriba. ==='
GO
