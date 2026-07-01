-- ============================================================
-- Setup_BD_limpio.sql
-- Recreación completa de DB_ingenieria_de_software
-- basada en Setup_BD.sql de Ezequiel.
--
-- REQUISITO: crear la BD vacía primero desde SSMS:
--   Object Explorer → Databases → New Database...
--   Name: DB_ingenieria_de_software → OK
--
-- Luego ejecutar este script con F5 estando conectado a esa BD.
-- ============================================================

USE [DB_ingenieria_de_software]
GO

-- ============================================================
-- TABLAS
-- ============================================================

CREATE TABLE [dbo].[Bitacora] (
    [Bitacora_Id]        INT IDENTITY(1,1) NOT NULL,
    [Bitacora_Usuario]   NVARCHAR(50)      NOT NULL,
    [Bitacora_Actividad] NVARCHAR(100)     NOT NULL,
    [Bitacora_FechaHora] DATETIME          NOT NULL,
    PRIMARY KEY CLUSTERED ([Bitacora_Id] ASC)
)
GO

CREATE TABLE [dbo].[Componente] (
    [Componente_Id] INT          NOT NULL,
    [Nombre]        VARCHAR(100) NOT NULL,
    [NombreInterno] VARCHAR(100) NULL,
    [EsFamilia]     BIT          NOT NULL,
    CONSTRAINT [PK_Componente] PRIMARY KEY CLUSTERED ([Componente_Id] ASC)
)
GO

CREATE TABLE [dbo].[Componente_Hijo] (
    [Padre_Id] INT NOT NULL,
    [Hijo_Id]  INT NOT NULL,
    CONSTRAINT [PK_Componente_Hijo] PRIMARY KEY CLUSTERED ([Padre_Id] ASC, [Hijo_Id] ASC)
)
GO

CREATE TABLE [dbo].[DigitoVerificadorVertical] (
    [DVV_Tabla] VARCHAR(50) NOT NULL,
    [DVV_Hash]  VARCHAR(64) NOT NULL,
    PRIMARY KEY CLUSTERED ([DVV_Tabla] ASC)
)
GO

CREATE TABLE [dbo].[Usuario] (
    [Usuario_Id]            INT          NOT NULL,
    [Usuario_NombreUsuario] NVARCHAR(50) NOT NULL,
    [Usuario_Contraseña]    CHAR(64)     NOT NULL,
    [Usuario_Activo]        BIT          NULL DEFAULT 0,
    [Usuario_Permiso]       SMALLINT     NULL DEFAULT 0,
    [Usuario_BloqueoDV]     BIT          NULL DEFAULT 0,
    [Usuario_DVH]           CHAR(64)     NULL,
    PRIMARY KEY CLUSTERED ([Usuario_Id] ASC)
)
GO

CREATE TABLE [dbo].[Usuario_Componente] (
    [Usuario_Id]    INT NOT NULL,
    [Componente_Id] INT NOT NULL,
    CONSTRAINT [PK_Usuario_Componente] PRIMARY KEY CLUSTERED ([Usuario_Id] ASC, [Componente_Id] ASC)
)
GO

-- ============================================================
-- ÍNDICE ÚNICO en NombreInterno (filtra NULLs)
-- ============================================================

CREATE UNIQUE NONCLUSTERED INDEX [UX_Componente_NombreInterno_NoNulos]
ON [dbo].[Componente] ([NombreInterno] ASC)
WHERE ([NombreInterno] IS NOT NULL)
GO

-- ============================================================
-- FK CONSTRAINTS
-- ============================================================

ALTER TABLE [dbo].[Componente_Hijo]
    WITH CHECK ADD CONSTRAINT [FK_Componente_Hijo_Hijo]
    FOREIGN KEY ([Hijo_Id]) REFERENCES [dbo].[Componente] ([Componente_Id])
GO
ALTER TABLE [dbo].[Componente_Hijo] CHECK CONSTRAINT [FK_Componente_Hijo_Hijo]
GO

ALTER TABLE [dbo].[Componente_Hijo]
    WITH CHECK ADD CONSTRAINT [FK_Componente_Hijo_Padre]
    FOREIGN KEY ([Padre_Id]) REFERENCES [dbo].[Componente] ([Componente_Id])
    ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Componente_Hijo] CHECK CONSTRAINT [FK_Componente_Hijo_Padre]
GO

ALTER TABLE [dbo].[Usuario_Componente]
    WITH CHECK ADD CONSTRAINT [FK_Usuario_Componente_Componente]
    FOREIGN KEY ([Componente_Id]) REFERENCES [dbo].[Componente] ([Componente_Id])
GO
ALTER TABLE [dbo].[Usuario_Componente] CHECK CONSTRAINT [FK_Usuario_Componente_Componente]
GO

ALTER TABLE [dbo].[Usuario_Componente]
    WITH CHECK ADD CONSTRAINT [FK_Usuario_Componente_Usuario]
    FOREIGN KEY ([Usuario_Id]) REFERENCES [dbo].[Usuario] ([Usuario_Id])
    ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Usuario_Componente] CHECK CONSTRAINT [FK_Usuario_Componente_Usuario]
GO

-- ============================================================
-- DATOS: Bitácora (historial de Ezequiel)
-- ============================================================

SET IDENTITY_INSERT [dbo].[Bitacora] ON
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (1,N'Juan66',N'Login',CAST(N'2026-06-19T15:00:36.177' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (2,N'Juan66',N'Alta de usuario: Jose',CAST(N'2026-06-19T15:01:58.043' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (3,N'Juan66',N'Logout',CAST(N'2026-06-19T15:03:48.813' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (4,N'Juan66',N'Login',CAST(N'2026-06-20T01:55:29.867' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (5,N'Juan66',N'Logout',CAST(N'2026-06-20T01:55:41.270' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (6,N'Juan66',N'Login',CAST(N'2026-06-20T18:58:08.077' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (7,N'Juan66',N'Logout',CAST(N'2026-06-20T19:00:09.740' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (8,N'Juan66',N'Login',CAST(N'2026-06-20T19:07:31.933' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (9,N'Juan66',N'Logout',CAST(N'2026-06-20T19:08:17.117' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (10,N'Juan66',N'Login',CAST(N'2026-06-20T19:17:03.030' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (11,N'Juan66',N'Logout',CAST(N'2026-06-20T19:17:41.347' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (12,N'Juan66',N'Login',CAST(N'2026-06-20T19:17:47.020' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (13,N'Juan66',N'Logout',CAST(N'2026-06-20T19:17:53.413' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (14,N'Juan66',N'Login',CAST(N'2026-06-20T20:00:23.917' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (15,N'Juan66',N'Alta de usuario: Milanesa',CAST(N'2026-06-20T20:02:08.670' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (16,N'Juan66',N'Modificacion de usuario: Milanesa',CAST(N'2026-06-20T20:02:18.737' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (17,N'Juan66',N'Logout',CAST(N'2026-06-20T20:02:27.663' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (18,N'Juan66',N'Login',CAST(N'2026-06-20T20:02:30.203' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (19,N'Juan66',N'Baja de usuario: Milanesa',CAST(N'2026-06-20T20:02:42.533' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (20,N'Juan66',N'Logout',CAST(N'2026-06-20T20:02:46.647' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (21,N'Juan66',N'Login',CAST(N'2026-06-20T20:04:31.347' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (22,N'Juan66',N'Alta de usuario: ElPepe',CAST(N'2026-06-20T20:05:23.967' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (23,N'Juan66',N'Baja de usuario: ElPepe',CAST(N'2026-06-20T20:05:32.653' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (24,N'Juan66',N'Logout',CAST(N'2026-06-20T20:05:43.763' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (25,N'Juan66',N'Login',CAST(N'2026-06-20T20:09:38.753' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (26,N'Juan66',N'Modificacion de usuario: Maria01',CAST(N'2026-06-20T20:10:00.970' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (27,N'Juan66',N'Logout',CAST(N'2026-06-20T20:10:13.693' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (28,N'Juan66',N'Login',CAST(N'2026-06-20T20:10:16.440' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (29,N'Juan66',N'Logout',CAST(N'2026-06-20T20:11:53.870' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (30,N'Juan66',N'Login',CAST(N'2026-06-28T16:07:42.513' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (31,N'Juan66',N'Logout',CAST(N'2026-06-28T16:12:42.957' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (32,N'Juan66',N'Login',CAST(N'2026-06-28T16:16:08.267' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (33,N'Juan66',N'Logout',CAST(N'2026-06-28T16:19:19.623' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (34,N'Juan66',N'Login',CAST(N'2026-06-28T16:21:40.427' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (35,N'Juan66',N'Logout',CAST(N'2026-06-28T16:24:22.923' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (36,N'Juan66',N'Login',CAST(N'2026-06-28T16:38:02.197' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (37,N'Juan66',N'Logout',CAST(N'2026-06-28T16:39:33.017' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (38,N'Juan66',N'Login',CAST(N'2026-06-28T19:48:10.060' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (39,N'Juan66',N'Logout',CAST(N'2026-06-28T19:49:29.153' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (40,N'Juan66',N'Login',CAST(N'2026-06-28T19:52:56.007' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (41,N'Juan66',N'Logout',CAST(N'2026-06-28T19:55:34.133' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (42,N'Juan66',N'Login',CAST(N'2026-06-28T20:26:34.063' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (43,N'Juan66',N'Logout',CAST(N'2026-06-28T20:26:54.780' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (44,N'Juan66',N'Login',CAST(N'2026-06-28T20:27:08.980' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (45,N'Juan66',N'Logout',CAST(N'2026-06-28T20:31:02.567' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (46,N'Juan66',N'Login',CAST(N'2026-06-28T20:32:18.133' AS DateTime))
INSERT [dbo].[Bitacora] ([Bitacora_Id],[Bitacora_Usuario],[Bitacora_Actividad],[Bitacora_FechaHora]) VALUES (47,N'Juan66',N'Logout',CAST(N'2026-06-28T20:38:34.767' AS DateTime))
SET IDENTITY_INSERT [dbo].[Bitacora] OFF
GO

-- ============================================================
-- DATOS: Componentes (catálogo de roles y permisos)
-- ============================================================

INSERT [dbo].[Componente] ([Componente_Id],[Nombre],[NombreInterno],[EsFamilia]) VALUES (1, N'Acceso de Rescate por Falla',      N'Permiso_Rescate',           0)
INSERT [dbo].[Componente] ([Componente_Id],[Nombre],[NombreInterno],[EsFamilia]) VALUES (2, N'Visualizar Usuarios',              N'Permiso_Ver_Usuarios',      0)
INSERT [dbo].[Componente] ([Componente_Id],[Nombre],[NombreInterno],[EsFamilia]) VALUES (3, N'Alta de Usuarios',                 N'Permiso_Alta_Usuario',      0)
INSERT [dbo].[Componente] ([Componente_Id],[Nombre],[NombreInterno],[EsFamilia]) VALUES (4, N'Modificacion de Usuarios',         N'Permiso_Modificar_Usuario', 0)
INSERT [dbo].[Componente] ([Componente_Id],[Nombre],[NombreInterno],[EsFamilia]) VALUES (5, N'Baja de Usuarios',                 N'Permiso_Baja_Usuario',      0)
INSERT [dbo].[Componente] ([Componente_Id],[Nombre],[NombreInterno],[EsFamilia]) VALUES (6, N'Asignar Roles a Usuarios',         N'Permiso_Asignar_Roles',     0)
INSERT [dbo].[Componente] ([Componente_Id],[Nombre],[NombreInterno],[EsFamilia]) VALUES (7, N'Ver Logs de Bitacora',             N'Permiso_Ver_Bitacora',      0)
INSERT [dbo].[Componente] ([Componente_Id],[Nombre],[NombreInterno],[EsFamilia]) VALUES (8, N'Recalcular Digitos Verificadores', N'Permiso_Recalcular_DV',     0)
INSERT [dbo].[Componente] ([Componente_Id],[Nombre],[NombreInterno],[EsFamilia]) VALUES (9,  N'Rol Administrador de Rescate', N'Rol_Rescate', 1)
INSERT [dbo].[Componente] ([Componente_Id],[Nombre],[NombreInterno],[EsFamilia]) VALUES (10, N'Rol Administrador General',    N'Rol_Admin',   1)
INSERT [dbo].[Componente] ([Componente_Id],[Nombre],[NombreInterno],[EsFamilia]) VALUES (11, N'Rol Sin Proposito',            NULL,           1)
INSERT [dbo].[Componente] ([Componente_Id],[Nombre],[NombreInterno],[EsFamilia]) VALUES (12, N'Permiso sin proposito',        N'Permiso_Sin_proposito', 0)
GO

-- ============================================================
-- DATOS: Árbol de componentes
-- ============================================================

INSERT [dbo].[Componente_Hijo] ([Padre_Id],[Hijo_Id]) VALUES (9,  1)
INSERT [dbo].[Componente_Hijo] ([Padre_Id],[Hijo_Id]) VALUES (9,  11)
INSERT [dbo].[Componente_Hijo] ([Padre_Id],[Hijo_Id]) VALUES (10, 2)
INSERT [dbo].[Componente_Hijo] ([Padre_Id],[Hijo_Id]) VALUES (10, 3)
INSERT [dbo].[Componente_Hijo] ([Padre_Id],[Hijo_Id]) VALUES (10, 4)
INSERT [dbo].[Componente_Hijo] ([Padre_Id],[Hijo_Id]) VALUES (10, 5)
INSERT [dbo].[Componente_Hijo] ([Padre_Id],[Hijo_Id]) VALUES (10, 6)
INSERT [dbo].[Componente_Hijo] ([Padre_Id],[Hijo_Id]) VALUES (10, 7)
INSERT [dbo].[Componente_Hijo] ([Padre_Id],[Hijo_Id]) VALUES (10, 8)
INSERT [dbo].[Componente_Hijo] ([Padre_Id],[Hijo_Id]) VALUES (11, 12)
GO

-- ============================================================
-- DATOS: DVV
-- Hash calculado por Ezequiel con todos los DVH actualizados.
-- ============================================================

INSERT [dbo].[DigitoVerificadorVertical] ([DVV_Tabla],[DVV_Hash])
VALUES (N'Usuario', N'f3c1a577ffda1fb22faa3e5232b6e8eb34c9ded82aa8047f1c3cd6ac4c9c3f20')
GO

-- ============================================================
-- DATOS: Usuarios
--
-- Contraseñas en texto plano (para hacer pruebas):
--   Juan66   → 123456
--   Maria01  → miPerro
--   Carlos22 → contrasenia
--   Ana77    → reina2001
--   PedroX   → elmascapo67
--
-- DVH calculado por Ezequiel con permisos asignados incluidos.
-- ============================================================

INSERT [dbo].[Usuario] ([Usuario_Id],[Usuario_NombreUsuario],[Usuario_Contraseña],[Usuario_Activo],[Usuario_Permiso],[Usuario_BloqueoDV],[Usuario_DVH])
VALUES (1, N'Juan66',
    N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',
    1, 1, 0,
    N'c2fd2249cd83b6b7c2eff41b31f203845439b5058333683c829c01524f739ce1')

INSERT [dbo].[Usuario] ([Usuario_Id],[Usuario_NombreUsuario],[Usuario_Contraseña],[Usuario_Activo],[Usuario_Permiso],[Usuario_BloqueoDV],[Usuario_DVH])
VALUES (2, N'Maria01',
    N'b1ef627fe51fca5bea57e92eb41bcad3ae17d376cc9217e05cc8b2779c546b8c',
    1, 2, 0,
    N'df810a7f652eb441ae3796dd92f7af10a14c5cdfa874ab220d5008d5552a0e8b')

INSERT [dbo].[Usuario] ([Usuario_Id],[Usuario_NombreUsuario],[Usuario_Contraseña],[Usuario_Activo],[Usuario_Permiso],[Usuario_BloqueoDV],[Usuario_DVH])
VALUES (3, N'Carlos22',
    N'a4e7c6ae4013276deabc1be4f9c65a6dc382f317e0cb81497aba26915cde5b66',
    0, 2, 0,
    N'ecad3628aef2e665016b7d84afc88d725561a5c490a1c9c435aaa2cf5d3a4e94')

INSERT [dbo].[Usuario] ([Usuario_Id],[Usuario_NombreUsuario],[Usuario_Contraseña],[Usuario_Activo],[Usuario_Permiso],[Usuario_BloqueoDV],[Usuario_DVH])
VALUES (4, N'Ana77',
    N'9d811f403c5f1b7748bdb5c813f44b6c82a033bd925a1031d75537998c9747b0',
    1, 2, 0,
    N'51a03cb600c7298abe5a0f81455a08a823166860dd3e3415809b47671443d1da')

INSERT [dbo].[Usuario] ([Usuario_Id],[Usuario_NombreUsuario],[Usuario_Contraseña],[Usuario_Activo],[Usuario_Permiso],[Usuario_BloqueoDV],[Usuario_DVH])
VALUES (5, N'PedroX',
    N'85c05cac729def53c4d21e21a035c600a81976ef7c65a1be0db354ba7636b2d4',
    1, 1, 0,
    N'0e35b0664dae7ef4c57caeba4573951037cd84bb12460616826518449bb6b89f')
GO

-- ============================================================
-- DATOS: Asignación de roles a usuarios
--   Juan66  → Rol_Rescate(9) + Rol_Admin(10)
--   Maria01 → Rol_Admin(10)
--   PedroX  → Rol_Rescate(9) + Rol_Admin(10)
-- ============================================================

INSERT [dbo].[Usuario_Componente] ([Usuario_Id],[Componente_Id]) VALUES (1, 9)
INSERT [dbo].[Usuario_Componente] ([Usuario_Id],[Componente_Id]) VALUES (1, 10)
INSERT [dbo].[Usuario_Componente] ([Usuario_Id],[Componente_Id]) VALUES (2, 10)
INSERT [dbo].[Usuario_Componente] ([Usuario_Id],[Componente_Id]) VALUES (5, 9)
INSERT [dbo].[Usuario_Componente] ([Usuario_Id],[Componente_Id]) VALUES (5, 10)
GO

PRINT '=== Setup completado exitosamente ==='
PRINT 'Si el login falla por DV, ver instrucciones en Setup_BD_limpio.sql'
GO

-- ============================================================
-- NOTA SOBRE DVH
-- ============================================================
-- Los DVH incluidos fueron calculados por Ezequiel en su máquina
-- con el mismo algoritmo del TP (ValidadorDeIntegridad.CalcularDVH).
-- Si el login falla con error de DV, significa que el orden de
-- devolución de permisos difiere. En ese caso:
--
--   1. Comentar ValidarItegridadDeLosDatos() en Form1.cs línea ~41
--   2. Correr la app y entrar con Juan66 / 123456
--   3. En Gestión de Usuarios: abrir y guardar cada usuario
--   4. Descomentar la línea y probar de nuevo
-- ============================================================
