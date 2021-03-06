USE [5S]
GO
/****** Object:  Table [dbo].[AreaFasePreguntas]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AreaFasePreguntas](
	[IdAreaPreguntaFase] [int] IDENTITY(1,1) NOT NULL,
	[IdArea] [int] NULL,
	[IdFase] [int] NULL,
	[IdPregunta] [int] NULL,
	[Estado] [bit] NULL,
	[FechCrea] [smalldatetime] NULL,
	[UsuCrea] [varchar](30) NULL,
	[EstacionCrea] [varchar](30) NULL,
	[FechModi] [smalldatetime] NULL,
	[UsuModi] [varchar](30) NULL,
	[EstacionModi] [varchar](30) NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdAreaPreguntaFase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Areas]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Areas](
	[IdArea] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Descripcion] [varchar](60) NULL,
	[Estado] [bit] NOT NULL,
	[FechCrea] [smalldatetime] NULL,
	[UsuCrea] [varchar](30) NULL,
	[EstacionCrea] [varchar](30) NULL,
	[UsuModi] [varchar](30) NULL,
	[EstacionModi] [varchar](30) NULL,
	[FechModi] [smalldatetime] NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[IdArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EvaluacionDetalles]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EvaluacionDetalles](
	[IdEvalucionDetalle] [int] NOT NULL,
	[IdEvalucion] [int] NOT NULL,
	[IdAreaPreguntaFase] [int] NULL,
	[Cumple] [smallint] NULL,
	[NoCumple] [smallint] NULL,
 CONSTRAINT [PK_EvaluacionDetalles] PRIMARY KEY CLUSTERED 
(
	[IdEvalucionDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Evaluaciones]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Evaluaciones](
	[IdEvalucion] [int] IDENTITY(1,1) NOT NULL,
	[IdAreaPreguntaFase] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdPeriodo] [int] NULL,
	[Secuencia] [smallint] NULL,
	[TotalCumple] [nchar](10) NULL,
	[TotalNoCumple] [nchar](10) NULL,
	[ResultadoFinal] [nchar](10) NULL,
	[Estado] [nchar](10) NULL,
	[FechaEvaluacion] [smalldatetime] NULL,
	[FechCrea] [smalldatetime] NULL,
	[UsuCrea] [varchar](30) NULL,
	[EstacionCrea] [varchar](30) NULL,
	[FechModi] [smalldatetime] NULL,
	[UsuaModi] [varchar](30) NULL,
	[EstacionModi] [varchar](30) NULL,
 CONSTRAINT [PK_Evaluciones] PRIMARY KEY CLUSTERED 
(
	[IdEvalucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fases]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fases](
	[IdFase] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Descripcion] [varchar](60) NULL,
	[Estado] [bit] NULL,
	[FechCrea] [smalldatetime] NULL,
	[UsuCrea] [varchar](30) NULL,
	[EstacionCrea] [varchar](30) NULL,
	[FechModi] [smalldatetime] NULL,
	[UsuModi] [varchar](30) NULL,
	[EstacionModi] [varchar](30) NULL,
 CONSTRAINT [PK_Fase] PRIMARY KEY CLUSTERED 
(
	[IdFase] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Periodos]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Periodos](
	[IdPeriodo] [int] IDENTITY(1,1) NOT NULL,
	[FechaInicio] [smalldatetime] NOT NULL,
	[FechaFin] [smalldatetime] NOT NULL,
	[Nombre] [varchar](60) NOT NULL,
	[Descripcion] [varchar](300) NULL,
	[Estado] [bit] NOT NULL,
	[FechCrea] [smalldatetime] NULL,
	[UsuCrea] [varchar](30) NULL,
	[EstacionCrea] [varchar](30) NULL,
	[FechModi] [smalldatetime] NULL,
	[UsuModi] [varchar](30) NULL,
	[EstacionModi] [varchar](30) NULL,
 CONSTRAINT [PK_Periodos] PRIMARY KEY CLUSTERED 
(
	[IdPeriodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](300) NULL,
	[Descripcion] [varchar](300) NULL,
	[Puntaje] [smallint] NULL,
	[Estado] [bit] NOT NULL,
	[FechCrea] [smalldatetime] NULL,
	[UsuCrea] [varchar](30) NULL,
	[EstacionCrea] [varchar](30) NULL,
	[FechModi] [smalldatetime] NULL,
	[UsuModi] [varchar](30) NULL,
	[EstacionModi] [varchar](30) NULL,
 CONSTRAINT [PK_Preguntas_1] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Usuarios]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Usuarios](
	[IdUsuario] [int] IDENTITY(1,1) NOT NULL,
	[Nombres] [varchar](30) NULL,
	[Apellidos] [varchar](30) NULL,
	[Login] [varchar](8) NULL,
	[Clave] [varchar](8) NULL,
	[TipoUsuario] [varchar](15) NULL,
	[Area] [int] NULL,
	[Estado] [bit] NULL,
	[FechCrea] [nchar](10) NULL,
	[UsuCrea] [varchar](30) NULL,
	[EstacionCrea] [varchar](30) NULL,
	[FechModi] [smalldatetime] NULL,
	[UsuModi] [varchar](30) NULL,
	[EstacionModi] [varchar](30) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AreaFasePreguntas] ON 

INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (1, 1, 1, 1, 1, CAST(N'2020-01-30T12:37:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (2, 1, 1, 2, 1, CAST(N'2020-01-30T12:38:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (3, 1, 1, 3, 1, CAST(N'2020-01-30T12:38:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:42:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (4, 1, 1, 4, 1, CAST(N'2020-01-30T12:38:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (5, 2, 2, 5, 1, CAST(N'2020-01-30T12:39:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:49:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (6, 2, 2, 6, 1, CAST(N'2020-01-30T12:39:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:49:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (7, 2, 2, 7, 1, CAST(N'2020-01-30T12:39:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:49:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (8, 2, 2, 8, 1, CAST(N'2020-01-30T12:43:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:49:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (9, 3, 3, 9, 1, CAST(N'2020-01-30T12:46:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (10, 3, 3, 10, 1, CAST(N'2020-01-30T12:51:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (11, 3, 3, 11, 1, CAST(N'2020-01-30T12:52:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (12, 3, 3, 11, 0, CAST(N'2020-01-30T12:53:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (13, 3, 3, 12, 1, CAST(N'2020-01-30T12:53:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (14, 4, 4, 13, 1, CAST(N'2020-01-30T12:53:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (15, 4, 4, 14, 1, CAST(N'2020-01-30T12:53:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (16, 4, 4, 15, 1, CAST(N'2020-01-30T12:53:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (17, 4, 4, 16, 1, CAST(N'2020-01-30T12:53:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (18, 5, 5, 17, 1, CAST(N'2020-01-30T12:54:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (19, 5, 5, 18, 1, CAST(N'2020-01-30T12:54:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (20, 5, 5, 19, 1, CAST(N'2020-01-30T12:54:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (21, 5, 5, 20, 1, CAST(N'2020-01-30T12:54:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
INSERT [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase], [IdArea], [IdFase], [IdPregunta], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (22, 1, 2, 21, 1, CAST(N'2020-01-30T12:54:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[AreaFasePreguntas] OFF
SET IDENTITY_INSERT [dbo].[Areas] ON 

INSERT [dbo].[Areas] ([IdArea], [Nombre], [Descripcion], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [UsuModi], [EstacionModi], [FechModi]) VALUES (1, N'Almacen', N'Almacen Acabados', 1, CAST(N'2020-01-30T12:06:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:07:00' AS SmallDateTime))
INSERT [dbo].[Areas] ([IdArea], [Nombre], [Descripcion], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [UsuModi], [EstacionModi], [FechModi]) VALUES (2, N'Costura', N'Constura', 1, CAST(N'2020-01-30T12:08:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
INSERT [dbo].[Areas] ([IdArea], [Nombre], [Descripcion], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [UsuModi], [EstacionModi], [FechModi]) VALUES (3, N'Avios', N'Avios', 1, CAST(N'2020-01-30T12:08:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
INSERT [dbo].[Areas] ([IdArea], [Nombre], [Descripcion], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [UsuModi], [EstacionModi], [FechModi]) VALUES (4, N'Tejeduria', N'TJ', 1, CAST(N'2020-01-30T12:45:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
INSERT [dbo].[Areas] ([IdArea], [Nombre], [Descripcion], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [UsuModi], [EstacionModi], [FechModi]) VALUES (5, N'RR.HH', N'RH', 1, CAST(N'2020-01-30T12:45:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Areas] OFF
SET IDENTITY_INSERT [dbo].[Fases] ON 

INSERT [dbo].[Fases] ([IdFase], [Nombre], [Descripcion], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (1, N'S1:Clasificar', N'S1 : Clasificación (SEIRI)', 1, CAST(N'2020-01-29T10:17:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T11:47:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Fases] ([IdFase], [Nombre], [Descripcion], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (2, N'S2:Ordenar', N'S2 : Orden  (SEITON)', 1, CAST(N'2020-01-29T10:18:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T11:47:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Fases] ([IdFase], [Nombre], [Descripcion], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (3, N'S3:Limpiar', N'S3 : Limpieza (SEISO) ', 1, CAST(N'2020-01-30T11:49:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T11:47:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Fases] ([IdFase], [Nombre], [Descripcion], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (4, N'S4:Estandarizar', N'S4 : Estandarizar (SEIKETSU)', 1, CAST(N'2020-01-30T11:50:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T11:47:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Fases] ([IdFase], [Nombre], [Descripcion], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (5, N'S5:Discplina', N'S5 : Disciplina (SHITSUKE)', 1, CAST(N'2020-01-30T11:51:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T11:47:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
SET IDENTITY_INSERT [dbo].[Fases] OFF
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (1, N'Se cuenta solo con máquinas y/o equipos necesarios en el area.', N'01', 5, 1, CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (2, N'Se cuenta solo con los materiales necesarios en el área.', N'01', 5, 1, CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (3, N'Se cuenta con un mapa de responsabilidades publicado en el Tablero de Gestión 5S.', N'01', 5, 1, CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (4, N'El equipo entiende el concepto de la S1: Lo que no sirve, estorba', N'01', 5, 1, CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (5, N'Las máquinas, equipos, zonas de trabajo y almacenamiento están identificadas (rotulado y demarcado según aplique) y se cumple.', N'02', 5, 1, CAST(N'2020-01-30T12:29:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (6, N'Los materiales tiene un lugar identificado (rotulado y demarcado según aplique) acorde a la operación y se cumple.', N'02', 5, 1, CAST(N'2020-01-30T12:29:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (7, N'Las vías de tránsito y accesos están libres de objetos.', N'02', 5, 1, CAST(N'2020-01-30T12:30:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (8, N'El equipo entiende el concepto de la S2: Un lugar para cada cosa, y cada cosa en su lugar', N'02', 5, 1, CAST(N'2020-01-30T12:30:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (9, N'Las instalaciones (pisos, paredes, luminarias) se encuentran limpios.', N'03', 5, 1, CAST(N'2020-01-30T12:30:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (10, N'Se cumple un Programa de limpieza dentro del área y el cronograma es visible.', N'03', 5, 1, CAST(N'2020-01-30T12:30:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (11, N'Los equipos, materiales y herramientas se encuentran en óptimo estado.', N'03', 5, 1, CAST(N'2020-01-30T12:31:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (12, N'El equipo entiende el concepto de la S3: Limpieza es inspección', N'03', 5, 1, CAST(N'2020-01-30T12:31:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (13, N'Las condiciones del área son seguras y sin riesgo al personal.', N'04', 5, 1, CAST(N'2020-01-30T12:31:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (14, N'Existe información documentada de orden y limpieza. (Imagen estándar).', N'04', 5, 1, CAST(N'2020-01-30T12:32:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (15, N'Las zonas de seguridad o evacuación están demarcadas, identificadas y son visibles (Señalética)', N'04', 5, 1, CAST(N'2020-01-30T12:32:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'NULLDELL-PRUEBA')
INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (16, N'El equipo conoce el estándar establecido en las tres primeras S.S4: Establecer la mejor práctica para su aplicación constante', N'04', 5, 1, CAST(N'2020-01-30T12:32:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (17, N'El estándar y controles están actualizados, publicados y se verifican cumplimiento según su frecuencia.', N'05', 5, 1, CAST(N'2020-01-30T12:33:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (18, N'Los cajones, estantes, lugares de almacenaje se encuentran ordenados.', N'05', 5, 1, CAST(N'2020-01-30T12:33:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (19, N'Cuando existen desviaciones del estándar, se realiza planes de acción (Responsables y fechas).', N'05', 5, 1, CAST(N'2020-01-30T12:33:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (20, N'Está todo el personal capacitado y motivado para llevar a cabo los procedimientos estándares 5S. Incorporar las 5S en nuestro estilo de vida diario.', N'05', 4, 1, CAST(N'2020-01-30T12:34:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
INSERT [dbo].[Preguntas] ([IdPregunta], [Nombre], [Descripcion], [Puntaje], [Estado], [FechCrea], [UsuCrea], [EstacionCrea], [FechModi], [UsuModi], [EstacionModi]) VALUES (21, N' Pregunta de prueba', N'06', 5, 1, CAST(N'2020-01-30T12:34:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA', CAST(N'2020-01-30T12:28:00' AS SmallDateTime), N'juangu', N'DELL-PRUEBA')
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
ALTER TABLE [dbo].[AreaFasePreguntas]  WITH CHECK ADD  CONSTRAINT [FK_AreaFasePregunta_Areas1] FOREIGN KEY([IdArea])
REFERENCES [dbo].[Areas] ([IdArea])
GO
ALTER TABLE [dbo].[AreaFasePreguntas] CHECK CONSTRAINT [FK_AreaFasePregunta_Areas1]
GO
ALTER TABLE [dbo].[AreaFasePreguntas]  WITH CHECK ADD  CONSTRAINT [FK_AreaFasePregunta_Fases1] FOREIGN KEY([IdFase])
REFERENCES [dbo].[Fases] ([IdFase])
GO
ALTER TABLE [dbo].[AreaFasePreguntas] CHECK CONSTRAINT [FK_AreaFasePregunta_Fases1]
GO
ALTER TABLE [dbo].[AreaFasePreguntas]  WITH CHECK ADD  CONSTRAINT [FK_AreaFasePregunta_Preguntas] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
GO
ALTER TABLE [dbo].[AreaFasePreguntas] CHECK CONSTRAINT [FK_AreaFasePregunta_Preguntas]
GO
ALTER TABLE [dbo].[EvaluacionDetalles]  WITH CHECK ADD  CONSTRAINT [FK_EvaluacionDetalles_AreaFasePreguntas] FOREIGN KEY([IdAreaPreguntaFase])
REFERENCES [dbo].[AreaFasePreguntas] ([IdAreaPreguntaFase])
GO
ALTER TABLE [dbo].[EvaluacionDetalles] CHECK CONSTRAINT [FK_EvaluacionDetalles_AreaFasePreguntas]
GO
ALTER TABLE [dbo].[EvaluacionDetalles]  WITH CHECK ADD  CONSTRAINT [FK_EvaluacionDetalles_Evaluaciones] FOREIGN KEY([IdEvalucion])
REFERENCES [dbo].[Evaluaciones] ([IdEvalucion])
GO
ALTER TABLE [dbo].[EvaluacionDetalles] CHECK CONSTRAINT [FK_EvaluacionDetalles_Evaluaciones]
GO
ALTER TABLE [dbo].[Evaluaciones]  WITH CHECK ADD  CONSTRAINT [FK_Evaluciones_Periodos1] FOREIGN KEY([IdPeriodo])
REFERENCES [dbo].[Periodos] ([IdPeriodo])
GO
ALTER TABLE [dbo].[Evaluaciones] CHECK CONSTRAINT [FK_Evaluciones_Periodos1]
GO
ALTER TABLE [dbo].[Evaluaciones]  WITH CHECK ADD  CONSTRAINT [FK_Evaluciones_Usuarios] FOREIGN KEY([IdPeriodo])
REFERENCES [dbo].[Usuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Evaluaciones] CHECK CONSTRAINT [FK_Evaluciones_Usuarios]
GO
/****** Object:  StoredProcedure [dbo].[Wsp_ActualizaAreaFasePreguntas]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Wsp_ActualizaAreaFasePreguntas]
@pIdAreaPreguntaFase Int               , 
@pIdArea             Int               ,
@pIdFase             Int               ,  
@pIdPregunta         Int               , 
@pUsuModi            Varchar       (30),
@pEstacionModi       varchar       (30)
as
Begin
	Update AreaFasePreguntas  Set
								
	IdArea					  = @pIdArea       ,
	IdFase					  = @pIdFase       ,
	IdPregunta				  = @pIdPregunta   ,
	FechModi				  = GETDATE()      ,
	UsuModi					  = @pUsuModi      ,
	EstacionModi			  = @pEstacionModi 
	Where IdAreaPreguntaFase  = @pIdAreaPreguntaFase
End
GO
/****** Object:  StoredProcedure [dbo].[Wsp_ActualizaAreas]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Wsp_ActualizaAreas]
@pIdArea        Int               ,
@pNombre        Varchar       (30),  
@pDescripcion   Varchar       (60), 
@pUsuModi       Varchar       (30),
@pEstacionModi  varchar       (30)
as
Begin
	Update Areas Set
	Nombre       = @pNombre       ,
	Descripcion  = @pDescripcion  ,
	FechModi     = GETDATE()      ,
	UsuModi      = @pUsuModi      ,
	EstacionModi = @pEstacionModi 
	Where IdArea = @pIdArea
End

GO
/****** Object:  StoredProcedure [dbo].[Wsp_ActualizaFases]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Wsp_ActualizaFases]
@pIdFase       Int               ,
@pNombre        Varchar       (30),  
@pDescripcion   Varchar       (60), 
@pUsuModi       Varchar       (30),
@pEstacionModi  varchar       (30)
as
Begin
	Update Fases Set
	Nombre       = @pNombre       ,
	Descripcion  = @pDescripcion  ,
	FechModi     = GETDATE()     ,
	UsuModi      = @pUsuModi      ,
	EstacionModi = @pEstacionModi 
	Where IdFase  = @pIdFase 
	end
GO
/****** Object:  StoredProcedure [dbo].[Wsp_ActualizaPeriodos]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Wsp_ActualizaPeriodos]
@pIdPeriodo     Int               ,
@pFecha         SmalldateTime     ,
@pNombre        Varchar       (30),  
@pDescripcion   Varchar       (60), 
@pUsuModi       Varchar       (30),
@pEstacionModi  varchar       (30)
as
Begin
	Update Periodos Set
	Fecha		     = @pFecha        ,
	Nombre           = @pNombre       ,
	Descripcion      = @pDescripcion  ,
	FechModi         =GETDATE()       ,
	UsuModi          = @pUsuModi      ,
	EstacionModi     = @pEstacionModi 
	Where IdPeriodo  = @pIdPeriodo
End
GO
/****** Object:  StoredProcedure [dbo].[Wsp_ActualizaPreguntas]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Wsp_ActualizaPreguntas]    
@pIdPregunta    Int               ,    
@pNombre        Varchar       (300),      
@pDescripcion   Varchar       (300),     
@pPuntaje       smallint          ,      
@pUsuModi       Varchar       (30),    
@pEstacionModi  varchar       (30)    
as    
Begin    
 Update Preguntas Set    
 Nombre       = @pNombre       ,    
 Descripcion  = @pDescripcion  ,    
 Puntaje      = @pPuntaje      ,    
 FechModi     = GETDATE()      ,    
 UsuModi      = @pUsuModi      ,    
 EstacionModi = @pEstacionModi     
 Where IdPregunta = @pIdPregunta    
End 
GO
/****** Object:  StoredProcedure [dbo].[Wsp_ActualizaUsuarios]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Wsp_ActualizaUsuarios]
@pIdUsuario     Int               ,  
@pNombres      Varchar(30)       ,
@pApellidos    Varchar(30)       ,
@pLogin        Varchar(8)        ,
@pClave        Varchar(8)        ,
@pTipoUsuario  Varchar(15)       ,
@pArea         Int		         ,	
@pFechModi     Smalldatetime     ,   
@pUsuModi      Varchar       (30),
@pEstacionModi varchar       (30)
as
Begin
	Update Usuarios  Set
 	 Nombres         = @pNombres    
	,Apellidos       = @pApellidos  
	,Login           = @pLogin      
	,Clave           = @pClave      
	,TipoUsuario     = @pTipoUsuario
	,Area            = @pArea
	,FechModi        = GETDATE()
	,UsuModi         = @pUsuModi     
	,EstacionModi    = @pEstacionModi		
	Where IdUsuario  = @pIdUsuario
End
GO
/****** Object:  StoredProcedure [dbo].[Wsp_ConsultaAreaFasePreguntas]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Proc [dbo].[Wsp_ConsultaAreaFasePreguntas]
as
Begin
Select 
	
     f.IdFase           ,
	 p.IdPregunta       ,
     a.Nombre as Area   ,
     f.Nombre as Fase   ,

	 Ltrim(str(
	           Row_Number()Over (Partition By f.IdFase Order By f.IdFase)
		    )) +

	 '.'+ SPACE(1)+p.Nombre as Pregunta,p.Puntaje

From AreaFasePreguntas as x

Join Areas     as a on a.IdArea     = x.IdArea
Join Fases     as f on f.IdFase     = x.IdFase
join Preguntas as p on p.IdPregunta = x.IdPregunta
WHERE X.Estado=1 and p.Estado=1

End
GO
/****** Object:  StoredProcedure [dbo].[Wsp_ConsultaAreaFasePreguntasId]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Wsp_ConsultaAreaFasePreguntasId]
@pIdArea int=null
as
Begin

Select 
     a.IdArea as Codigo  ,
     a.Nombre as Area    ,
     f.Nombre as Fase    ,
	 p.Nombre as Pregunta,
	 p.Puntaje
From AreaFasePreguntas as x

Join Areas     as a on a.IdArea     = x.IdArea
Join Fases     as f on f.IdFase     = x.IdFase
join Preguntas as p on p.IdPregunta = x.IdPregunta
Where a.IdArea=@pIdArea
Order By a.IdArea

End
GO
/****** Object:  StoredProcedure [dbo].[Wsp_ConsultaAreas]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[Wsp_ConsultaAreas]
as
Begin

Select  
	IdArea
	,Nombre
	,Descripcion
	,Estado
	,FechCrea
	,UsuCrea
	,EstacionCrea
	--,UsuModi
	--,EstacionModi
	--,FechModi
From Areas
Where Estado=1

End


GO
/****** Object:  StoredProcedure [dbo].[Wsp_ConsultaFases]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[Wsp_ConsultaFases]
as
Begin

Select  
	IdFase
	,Nombre
	,Descripcion
	--,Estado
	--,FechCrea
	--,UsuCrea
	--,EstacionCrea
	--,UsuModi
	--,EstacionModi
	--,FechModi
From Fases
Where Estado=1
End


GO
/****** Object:  StoredProcedure [dbo].[Wsp_ConsultaPeriodos]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Wsp_ConsultaPeriodos]
as
Begin

Select  
	IdPeriodo
	,Nombre
	,Descripcion
	,Estado
	,FechCrea
	,UsuCrea
	,EstacionCrea
	,UsuModi
	,EstacionModi
	,FechModi
From Periodos

End
GO
/****** Object:  StoredProcedure [dbo].[Wsp_ConsultaPreguntas]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Wsp_ConsultaPreguntas]
as
Begin

Select  
	IdPregunta
	,Nombre
	,Descripcion
	,Puntaje
	,Estado
	,FechCrea
	,UsuCrea
	,EstacionCrea
	,UsuModi
	,EstacionModi
	,FechModi
From Preguntas

End

GO
/****** Object:  StoredProcedure [dbo].[Wsp_ConsultaUsuarios]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[Wsp_ConsultaUsuarios]
as
Begin

Select 
   u.IdUsuario
  ,u.Nombres
  ,u.Apellidos
  ,u.Login
  ,u.Clave
  ,u.TipoUsuario
  ,a.Nombre
  ,u.Estado
  ,u.FechCrea
  ,u.UsuCrea
  ,u.EstacionCrea
  ,u.FechModi
  ,u.UsuModi
  ,u.EstacionModi	  	  	  

  From     Usuarios as u
  Join     Areas    as a on a.IdArea = u.Area
  Order By a.IdArea

End
GO
/****** Object:  StoredProcedure [dbo].[Wsp_EliminaAreaFasePreguntas]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[Wsp_EliminaAreaFasePreguntas]
@pIdAreaPreguntaFase        Int
as
Begin

    
	Update AreaFasePreguntas Set
	Estado=0
	Where IdAreaPreguntaFase  = @pIdAreaPreguntaFase

End
GO
/****** Object:  StoredProcedure [dbo].[Wsp_EliminaAreas]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Wsp_EliminaAreas]
@pIdArea        Int
as
Begin
	Update Areas Set
	Estado=0
	Where IdArea = @pIdArea
	RAISERROR('Eliminado',-1,-1)
End
GO
/****** Object:  StoredProcedure [dbo].[Wsp_EliminaFases]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Wsp_EliminaFases]
@pIdFase     Int
as
Begin
	Update Fases Set
	Estado = 0
	Where IdFase = @pIdFase
End
GO
/****** Object:  StoredProcedure [dbo].[Wsp_EliminaPeriodos]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Wsp_EliminaPeriodos]
@pIdPeriodo        Int
as
Begin
	Update Periodos Set
	Estado=0
	Where IdPeriodo  = @pIdPeriodo
End
GO
/****** Object:  StoredProcedure [dbo].[Wsp_EliminaPreguntas]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Wsp_EliminaPreguntas]
@pIdPregunta        Int
as
Begin
	Update Preguntas Set
	Estado=0
	Where IdPregunta = @pIdPregunta
End
GO
/****** Object:  StoredProcedure [dbo].[Wsp_EliminaUsuarios]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Proc [dbo].[Wsp_EliminaUsuarios]
@pIdUsuario        Int
as
Begin

    
	Update Usuarios Set
	Estado=0
	Where IdUsuario  = @pIdUsuario

End
GO
/****** Object:  StoredProcedure [dbo].[Wsp_InsertaAreaFasePreguntas]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[Wsp_InsertaAreaFasePreguntas]
@pIdArea        Int               ,
@pIdFase       	Int               ,
@pIdPregunta	Int               ,
@pUsuCrea       varchar       (30), 
@pEstacionCrea  varchar       (30)
as
Begin

Insert into AreaFasePreguntas
(
 IdArea    
,IdFase    
,IdPregunta
,Estado
,FechCrea    
,UsuCrea     
,EstacionCrea
)
Values
(
 @pIdArea        
,@pIdFase       	
,@pIdPregunta	  
,1
,GETDATE()
,@pUsuCrea     
,@pEstacionCrea
)
raiserror('Insertado',-1,-1)
 end
GO
/****** Object:  StoredProcedure [dbo].[Wsp_InsertaAreas]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Wsp_InsertaAreas]  
@pNombre        varchar       (30),    
@pDescripcion   varchar       (60),   
@pUsuCrea       varchar       (30),   
@pEstacionCrea  varchar       (30)  
as  
Begin  
  
  
  
DECLARE @storedProcedureName VARCHAR(100)  

  
  
--Select @IdObject=str((Select object_id From sys.sql_modules Where object_id = OBJECT_NAME(@@PROCID)))  
  
SELECT @storedProcedureName ='El registro ya existe en la base de datos.'+ space(1)+OBJECT_NAME(@@PROCID)
  
  
  
  
if  exists(select Nombre,Descripcion from Areas where Nombre=@pNombre and @pDescripcion=Descripcion)  
BEGIN  
--Raiserror(15600,-1,-1,'El registro ya existe')  
RAISERROR(@storedProcedureName,16,1)  
return  
END  
  
  
  
Insert into Areas   
(  
 Nombre        
,Descripcion   
,Estado        
,FechCrea      
,UsuCrea       
,EstacionCrea  
)  
Values  
(  
 @pNombre        
,@pDescripcion   
,1       
,GETDATE()      
,@pUsuCrea       
,@pEstacionCrea  
)  
 end
GO
/****** Object:  StoredProcedure [dbo].[Wsp_InsertaFases]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Wsp_InsertaFases]
@pNombre        varchar       (30),  
@pDescripcion   varchar       (60), 
@pUsuCrea       varchar       (30), 
@pEstacionCrea  varchar       (30)
as
Begin


if  exists(select Nombre,Descripcion from Fases where Nombre=@pNombre and @pDescripcion=Descripcion)
BEGIN
--Raiserror(15600,-1,-1,'El registro ya existe')
RAISERROR('El registro ya existe en la base de datos',16,1)
return
END
Insert into Fases 
(
 Nombre      
,Descripcion 
,Estado      
,FechCrea    
,UsuCrea     
,EstacionCrea
)
Values
(
 @pNombre      
,@pDescripcion 
,1     
,GETDATE()  
,@pUsuCrea     
,@pEstacionCrea
)
 end
GO
/****** Object:  StoredProcedure [dbo].[Wsp_InsertaPeriodos]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Wsp_InsertaPeriodos]
@pFecha         Smalldatetime     ,  
@pNombre        Varchar       (30),  
@pDescripcion   Varchar       (60), 
@pUsuCrea       Varchar       (30), 
@pEstacionCrea  Varchar       (30)
as
Begin
Insert into Periodos 
(
 Fecha
,Nombre      
,Descripcion 
,Estado  
,FechCrea    
,UsuCrea     
,EstacionCrea
)
Values
(
 @pFecha
,@pNombre      
,@pDescripcion
,1     
,GETDATE()    
,@pUsuCrea     
,@pEstacionCrea
)
End
GO
/****** Object:  StoredProcedure [dbo].[Wsp_InsertaPreguntas]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Proc [dbo].[Wsp_InsertaPreguntas]      
@pNombre        varchar       (300),        
@pDescripcion   varchar       (300),       
@pPuntaje       smallint          ,       
@pUsuCrea       varchar       (30),       
@pEstacionCrea  varchar       (30)      
as      
Begin      
      
Insert into Preguntas       
(      
 Nombre            
,Descripcion       
,Puntaje      
,Estado        
,FechCrea          
,UsuCrea           
,EstacionCrea      
)      
Values      
(      
 @pNombre            
,@pDescripcion      
,@pPuntaje      
,1           
,GETDATE()     
,@pUsuCrea           
,@pEstacionCrea      
)      
 end 
GO
/****** Object:  StoredProcedure [dbo].[Wsp_InsertaUsuarios]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Proc [dbo].[Wsp_InsertaUsuarios]
@pNombres      Varchar(30) ,
@pApellidos    Varchar(30) ,
@pLogin        Varchar(8)  ,
@pClave        Varchar(8)  ,
@pTipoUsuario  Varchar(15) ,
@pArea         Int		   ,	
@pUsuCrea      varchar(30) , 
@pEstacionCrea varchar(30)
as
Begin

Insert into Usuarios 
(
 Nombres     
,Apellidos   
,Login       
,Clave       
,TipoUsuario 
,Area
,FechCrea
,UsuCrea     
,EstacionCrea
)

Values
(
 @pNombres     
,@pApellidos   
,@pLogin       
,@pClave       
,@pTipoUsuario 
,@pArea   
,GETDATE()
,@pUsuCrea     
,@pEstacionCrea
)

end
GO
/****** Object:  StoredProcedure [dbo].[WspClearTablas]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Proc [dbo].[WspClearTablas]
AS

begin
Delete from Areas
Delete from Fases
Delete from Preguntas
Delete from Periodos

DBCC CHECKIDENT (Areas, RESEED,0)
DBCC CHECKIDENT (Fases, RESEED,0)
DBCC CHECKIDENT (Preguntas, RESEED,0)
DBCC CHECKIDENT (Periodos, RESEED,0)

select 'Limpiado' as Resultado


END
GO
/****** Object:  StoredProcedure [dbo].[WspSelectTablas]    Script Date: 8/02/2020 09:58:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create Proc [dbo].[WspSelectTablas]
AS

begin
select * from Areas
select * from Fases
select * from Preguntas
select * from Periodos
select * from AreaFasePreguntas




END
GO
