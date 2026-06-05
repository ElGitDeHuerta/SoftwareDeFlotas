
CREATE DATABASE [DB_ingenieria_de_software]
GO

USE [DB_ingenieria_de_software]
GO

CREATE TABLE [dbo].[Usuario] (
    [Usuario_Id]             INT           NOT NULL,
    [Usuario_NombreUsuario]  NVARCHAR(50)  NOT NULL,
    [Usuario_Contraseña]     CHAR(64)      NOT NULL,
    [Usuario_Activo]         BIT           NULL DEFAULT ((0)),
    PRIMARY KEY CLUSTERED ([Usuario_Id] ASC)
)
GO

-- Usuarios de prueba (contraseñas hasheadas en SHA256)
-- Juan66     / 123456
-- Maria01    / miPerro
-- Carlos22   / contrasenia  (INACTIVO)
-- Ana77      / reina2001
-- PedroX     / elmascapo67

INSERT [dbo].[Usuario] ([Usuario_Id], [Usuario_NombreUsuario], [Usuario_Contraseña], [Usuario_Activo]) VALUES (1, N'Juan66', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1);
INSERT [dbo].[Usuario] ([Usuario_Id], [Usuario_NombreUsuario], [Usuario_Contraseña], [Usuario_Activo]) VALUES (2, N'Maria01', N'b1ef627fe51fca5bea57e92eb41bcad3ae17d376cc9217e05cc8b2779c546b8c', 1);
INSERT [dbo].[Usuario] ([Usuario_Id], [Usuario_NombreUsuario], [Usuario_Contraseña], [Usuario_Activo]) VALUES (3, N'Carlos22', N'a4e7c6ae4013276deabc1be4f9c65a6dc382f317e0cb81497aba26915cde5b66', 0);
INSERT [dbo].[Usuario] ([Usuario_Id], [Usuario_NombreUsuario], [Usuario_Contraseña], [Usuario_Activo]) VALUES (4, N'Ana77', N'9d811f403c5f1b7748bdb5c813f44b6c82a033bd925a1031d75537998c9747b0', 1);
INSERT [dbo].[Usuario] ([Usuario_Id], [Usuario_NombreUsuario], [Usuario_Contraseña], [Usuario_Activo]) VALUES (5, N'PedroX', N'85c05cac729def53c4d21e21a035c600a81976ef7c65a1be0db354ba7636b2d4', 1);
GO

CREATE TABLE [dbo].[Bitacora] (
    [Bitacora_Id]        INT           NOT NULL IDENTITY(1,1),
    [Bitacora_Usuario]   NVARCHAR(50)  NOT NULL,
    [Bitacora_Actividad] NVARCHAR(100) NOT NULL,
    [Bitacora_FechaHora] DATETIME      NOT NULL,
    PRIMARY KEY CLUSTERED ([Bitacora_Id] ASC)
)
GO
