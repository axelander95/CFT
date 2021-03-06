USE [master]
GO
/****** Object:  Database [db_cft]    Script Date: 10/09/2015 2:41:35 ******/
CREATE DATABASE [db_cft] ON  PRIMARY 
( NAME = N'db_cft', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.ANDRESLEON\MSSQL\DATA\db_cft.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'db_cft_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.ANDRESLEON\MSSQL\DATA\db_cft_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [db_cft] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [db_cft].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [db_cft] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [db_cft] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [db_cft] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [db_cft] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [db_cft] SET ARITHABORT OFF 
GO
ALTER DATABASE [db_cft] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [db_cft] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [db_cft] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [db_cft] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [db_cft] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [db_cft] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [db_cft] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [db_cft] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [db_cft] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [db_cft] SET  DISABLE_BROKER 
GO
ALTER DATABASE [db_cft] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [db_cft] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [db_cft] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [db_cft] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [db_cft] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [db_cft] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [db_cft] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [db_cft] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [db_cft] SET  MULTI_USER 
GO
ALTER DATABASE [db_cft] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [db_cft] SET DB_CHAINING OFF 
GO
USE [db_cft]
GO
/****** Object:  Table [dbo].[tb_carrera]    Script Date: 10/09/2015 2:41:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_carrera](
	[id_carrera] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tb_carrera] PRIMARY KEY CLUSTERED 
(
	[id_carrera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_categoria]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_categoria](
	[id_categoria] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tb_categoria] PRIMARY KEY CLUSTERED 
(
	[id_categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_certificacion]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_certificacion](
	[id_certificacion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tb_certificacion] PRIMARY KEY CLUSTERED 
(
	[id_certificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_curso]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_curso](
	[id_curso] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[id_categoria] [int] NOT NULL,
	[objetivo] [varchar](max) NOT NULL,
	[dirigido_a] [varchar](max) NOT NULL,
	[pre_requisitos] [varchar](max) NOT NULL,
	[aprendizaje] [varchar](max) NOT NULL,
	[precio_ucsg] [decimal](18, 2) NOT NULL,
	[precio_publico] [decimal](18, 2) NOT NULL,
	[maximo_estudiantes] [int] NOT NULL,
	[minimo_estudiantes] [int] NOT NULL,
	[id_docente] [int] NOT NULL,
	[certificacion] [bit] NOT NULL,
	[horas] [int] NOT NULL,
	[fecha_inicio] [date] NOT NULL,
	[url_imagen] [varchar](max) NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tb_curso] PRIMARY KEY CLUSTERED 
(
	[id_curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_curso_dia]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_curso_dia](
	[id_curso] [int] NOT NULL,
	[id_dia] [int] NOT NULL,
	[desde] [time](7) NOT NULL,
	[hasta] [time](7) NOT NULL,
 CONSTRAINT [PK_tb_curso_dia] PRIMARY KEY CLUSTERED 
(
	[id_curso] ASC,
	[id_dia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_dia]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_dia](
	[id_dia] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tb_dia] PRIMARY KEY CLUSTERED 
(
	[id_dia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_docente]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_docente](
	[id_docente] [int] IDENTITY(1,1) NOT NULL,
	[cedula] [varchar](10) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[telefono_casa] [varchar](10) NULL,
	[telefono_trabajo] [varchar](10) NULL,
	[celular] [varchar](10) NULL,
	[correo_electronico] [varchar](100) NOT NULL,
	[id_profesion] [int] NOT NULL,
	[id_universidad] [int] NULL,
	[experiencia] [varchar](max) NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tb_docente] PRIMARY KEY CLUSTERED 
(
	[id_docente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_docente_certificacion]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_docente_certificacion](
	[id_docente] [int] NOT NULL,
	[id_certificacion] [int] NOT NULL,
 CONSTRAINT [PK_tb_docente_certificacion] PRIMARY KEY CLUSTERED 
(
	[id_docente] ASC,
	[id_certificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_evento]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_evento](
	[id_evento] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](100) NOT NULL,
	[descripcion] [varchar](max) NULL,
	[url_imagen] [varchar](max) NOT NULL,
	[fecha_publicacion] [datetime] NOT NULL,
	[fecha_evento] [date] NULL,
	[hora_inicio] [time](7) NULL,
	[hora_fin] [time](7) NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tb_evento] PRIMARY KEY CLUSTERED 
(
	[id_evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_inscripcion]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_inscripcion](
	[id_usuario] [int] NOT NULL,
	[id_curso] [int] NOT NULL,
	[fecha_inscripcion] [datetime] NOT NULL,
 CONSTRAINT [PK_tb_usuario_inscripcion] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[id_curso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_interes]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_interes](
	[id_interes] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tb_interes] PRIMARY KEY CLUSTERED 
(
	[id_interes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_ocupacion]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_ocupacion](
	[id_ocupacion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tb_ocupacion] PRIMARY KEY CLUSTERED 
(
	[id_ocupacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_pregunta_secreta]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_pregunta_secreta](
	[id_pregunta_secreta] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tb_pregunta_secreta] PRIMARY KEY CLUSTERED 
(
	[id_pregunta_secreta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_profesion]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_profesion](
	[id_profesion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tb_profesion] PRIMARY KEY CLUSTERED 
(
	[id_profesion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_profesor_dia]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_profesor_dia](
	[id_docente] [int] NOT NULL,
	[id_dia] [int] NOT NULL,
	[desde] [time](7) NOT NULL,
	[hasta] [time](7) NOT NULL,
 CONSTRAINT [PK_tb_profesor_dia] PRIMARY KEY CLUSTERED 
(
	[id_docente] ASC,
	[id_dia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tb_tipo_identificacion]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_tipo_identificacion](
	[id_tipo_identificacion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tb_tipo_identificacion] PRIMARY KEY CLUSTERED 
(
	[id_tipo_identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_universidad]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_universidad](
	[id_universidad] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](100) NOT NULL,
	[precio_ucsg] [bit] NOT NULL,
	[estado] [bit] NOT NULL,
 CONSTRAINT [PK_tb_universidad] PRIMARY KEY CLUSTERED 
(
	[id_universidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_usuario]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tb_usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[id_tipo_identificacion] [int] NOT NULL,
	[identificacion] [varchar](13) NOT NULL,
	[nombre_razon_social] [varchar](100) NOT NULL,
	[correo_electronico] [varchar](100) NOT NULL,
	[nombre_usuario] [varchar](30) NOT NULL,
	[contraseña] [varchar](max) NOT NULL,
	[id_pregunta_secreta] [int] NOT NULL,
	[respuesta_secreta] [varchar](100) NOT NULL,
	[sexo] [char](1) NOT NULL,
	[direccion] [varchar](100) NOT NULL,
	[telefono] [varchar](10) NULL,
	[celular] [varchar](10) NULL,
	[pagina_web] [varchar](max) NULL,
	[id_ocupacion] [int] NOT NULL,
	[id_universidad] [int] NULL,
	[id_carrera] [int] NULL,
	[fecha_nacimiento] [date] NOT NULL,
	[fecha_registro] [datetime] NOT NULL,
	[estado] [char](10) NOT NULL,
 CONSTRAINT [PK_tb_usuario] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tb_usuario_interes]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_usuario_interes](
	[id_usuario] [int] NOT NULL,
	[id_interes] [int] NOT NULL,
 CONSTRAINT [PK_tb_usuario_interes] PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC,
	[id_interes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tb_docente]    Script Date: 10/09/2015 2:41:38 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_docente] ON [dbo].[tb_docente]
(
	[cedula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tb_docente_1]    Script Date: 10/09/2015 2:41:38 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_docente_1] ON [dbo].[tb_docente]
(
	[correo_electronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tb_usuario]    Script Date: 10/09/2015 2:41:38 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_usuario] ON [dbo].[tb_usuario]
(
	[correo_electronico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tb_usuario_1]    Script Date: 10/09/2015 2:41:38 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_usuario_1] ON [dbo].[tb_usuario]
(
	[nombre_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_tb_usuario_2]    Script Date: 10/09/2015 2:41:38 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_tb_usuario_2] ON [dbo].[tb_usuario]
(
	[identificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tb_curso]  WITH CHECK ADD  CONSTRAINT [FK_tb_curso_tb_categoria] FOREIGN KEY([id_categoria])
REFERENCES [dbo].[tb_categoria] ([id_categoria])
GO
ALTER TABLE [dbo].[tb_curso] CHECK CONSTRAINT [FK_tb_curso_tb_categoria]
GO
ALTER TABLE [dbo].[tb_curso]  WITH CHECK ADD  CONSTRAINT [FK_tb_curso_tb_docente] FOREIGN KEY([id_docente])
REFERENCES [dbo].[tb_docente] ([id_docente])
GO
ALTER TABLE [dbo].[tb_curso] CHECK CONSTRAINT [FK_tb_curso_tb_docente]
GO
ALTER TABLE [dbo].[tb_docente]  WITH CHECK ADD  CONSTRAINT [FK_tb_docente_tb_profesion] FOREIGN KEY([id_profesion])
REFERENCES [dbo].[tb_profesion] ([id_profesion])
GO
ALTER TABLE [dbo].[tb_docente] CHECK CONSTRAINT [FK_tb_docente_tb_profesion]
GO
ALTER TABLE [dbo].[tb_docente]  WITH CHECK ADD  CONSTRAINT [FK_tb_docente_tb_universidad] FOREIGN KEY([id_universidad])
REFERENCES [dbo].[tb_universidad] ([id_universidad])
GO
ALTER TABLE [dbo].[tb_docente] CHECK CONSTRAINT [FK_tb_docente_tb_universidad]
GO
ALTER TABLE [dbo].[tb_docente_certificacion]  WITH CHECK ADD  CONSTRAINT [FK_tb_docente_certificacion_tb_certificacion] FOREIGN KEY([id_certificacion])
REFERENCES [dbo].[tb_certificacion] ([id_certificacion])
GO
ALTER TABLE [dbo].[tb_docente_certificacion] CHECK CONSTRAINT [FK_tb_docente_certificacion_tb_certificacion]
GO
ALTER TABLE [dbo].[tb_docente_certificacion]  WITH CHECK ADD  CONSTRAINT [FK_tb_docente_certificacion_tb_docente] FOREIGN KEY([id_docente])
REFERENCES [dbo].[tb_docente] ([id_docente])
GO
ALTER TABLE [dbo].[tb_docente_certificacion] CHECK CONSTRAINT [FK_tb_docente_certificacion_tb_docente]
GO
ALTER TABLE [dbo].[tb_inscripcion]  WITH CHECK ADD  CONSTRAINT [FK_tb_usuario_inscripcion_tb_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[tb_usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[tb_inscripcion] CHECK CONSTRAINT [FK_tb_usuario_inscripcion_tb_usuario]
GO
ALTER TABLE [dbo].[tb_profesor_dia]  WITH CHECK ADD  CONSTRAINT [FK_tb_profesor_dia_tb_dia] FOREIGN KEY([id_dia])
REFERENCES [dbo].[tb_dia] ([id_dia])
GO
ALTER TABLE [dbo].[tb_profesor_dia] CHECK CONSTRAINT [FK_tb_profesor_dia_tb_dia]
GO
ALTER TABLE [dbo].[tb_profesor_dia]  WITH CHECK ADD  CONSTRAINT [FK_tb_profesor_dia_tb_docente] FOREIGN KEY([id_docente])
REFERENCES [dbo].[tb_docente] ([id_docente])
GO
ALTER TABLE [dbo].[tb_profesor_dia] CHECK CONSTRAINT [FK_tb_profesor_dia_tb_docente]
GO
ALTER TABLE [dbo].[tb_usuario]  WITH CHECK ADD  CONSTRAINT [FK_tb_usuario_tb_carrera] FOREIGN KEY([id_carrera])
REFERENCES [dbo].[tb_carrera] ([id_carrera])
GO
ALTER TABLE [dbo].[tb_usuario] CHECK CONSTRAINT [FK_tb_usuario_tb_carrera]
GO
ALTER TABLE [dbo].[tb_usuario]  WITH CHECK ADD  CONSTRAINT [FK_tb_usuario_tb_ocupacion] FOREIGN KEY([id_ocupacion])
REFERENCES [dbo].[tb_ocupacion] ([id_ocupacion])
GO
ALTER TABLE [dbo].[tb_usuario] CHECK CONSTRAINT [FK_tb_usuario_tb_ocupacion]
GO
ALTER TABLE [dbo].[tb_usuario]  WITH CHECK ADD  CONSTRAINT [FK_tb_usuario_tb_pregunta_secreta] FOREIGN KEY([id_pregunta_secreta])
REFERENCES [dbo].[tb_pregunta_secreta] ([id_pregunta_secreta])
GO
ALTER TABLE [dbo].[tb_usuario] CHECK CONSTRAINT [FK_tb_usuario_tb_pregunta_secreta]
GO
ALTER TABLE [dbo].[tb_usuario]  WITH CHECK ADD  CONSTRAINT [FK_tb_usuario_tb_tipo_identificacion] FOREIGN KEY([id_tipo_identificacion])
REFERENCES [dbo].[tb_tipo_identificacion] ([id_tipo_identificacion])
GO
ALTER TABLE [dbo].[tb_usuario] CHECK CONSTRAINT [FK_tb_usuario_tb_tipo_identificacion]
GO
ALTER TABLE [dbo].[tb_usuario]  WITH CHECK ADD  CONSTRAINT [FK_tb_usuario_tb_universidad] FOREIGN KEY([id_universidad])
REFERENCES [dbo].[tb_universidad] ([id_universidad])
GO
ALTER TABLE [dbo].[tb_usuario] CHECK CONSTRAINT [FK_tb_usuario_tb_universidad]
GO
ALTER TABLE [dbo].[tb_usuario_interes]  WITH CHECK ADD  CONSTRAINT [FK_tb_usuario_interes_tb_interes] FOREIGN KEY([id_interes])
REFERENCES [dbo].[tb_interes] ([id_interes])
GO
ALTER TABLE [dbo].[tb_usuario_interes] CHECK CONSTRAINT [FK_tb_usuario_interes_tb_interes]
GO
ALTER TABLE [dbo].[tb_usuario_interes]  WITH CHECK ADD  CONSTRAINT [FK_tb_usuario_interes_tb_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[tb_usuario] ([id_usuario])
GO
ALTER TABLE [dbo].[tb_usuario_interes] CHECK CONSTRAINT [FK_tb_usuario_interes_tb_usuario]
GO
/****** Object:  StoredProcedure [dbo].[ACTIVA_INACTIVA_USUARIO]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ACTIVA_INACTIVA_USUARIO]
	@id_usuario AS INT,
	@estado AS CHAR(1)
AS
BEGIN
	SET NOCOUNT OFF;
	UPDATE tb_usuario SET estado = @estado WHERE id_usuario = @id_usuario
END

GO
/****** Object:  StoredProcedure [dbo].[CAMBIA_CONTRASEÑA_USUARIO]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CAMBIA_CONTRASEÑA_USUARIO]
@nombre_usuario AS VARCHAR(50),
@contraseña_nueva AS VARCHAR(MAX)
AS
BEGIN
	UPDATE tb_usuario SET contraseña = @contraseña_nueva WHERE nombre_usuario = @nombre_usuario
END

GO
/****** Object:  StoredProcedure [dbo].[ELIMINA_USUARIO_INSCRIPCION]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ELIMINA_USUARIO_INSCRIPCION]
@id_curso AS INT,
@id_usuario AS INT
AS
BEGIN
	SET NOCOUNT OFF;
	DELETE FROM tb_inscripcion WHERE id_curso = @id_curso AND id_usuario = @id_usuario
END

GO
/****** Object:  StoredProcedure [dbo].[INSCRIBIR_USUARIO_CURSO]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSCRIBIR_USUARIO_CURSO]
@id_usuario AS INT,
@id_curso AS INT
AS
BEGIN
	SET NOCOUNT ON;
	IF EXISTS (SELECT * FROM tb_inscripcion WHERE id_usuario = @id_usuario AND id_curso = @id_curso)
		SELECT '¡Ya se encuentra inscrito!' AS mensaje
	ELSE
		BEGIN
			INSERT INTO tb_inscripcion (id_usuario, id_curso, fecha_inscripcion) VALUES (@id_usuario, @id_curso, GETDATE())
			SELECT 'Inscripción exitosa.' AS mensaje
		END
END

GO
/****** Object:  StoredProcedure [dbo].[INSERTA_CERTIFICACION_DOCENTE]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTA_CERTIFICACION_DOCENTE]
@id_docente AS INT,
@id_certificacion AS INT
AS
BEGIN
	SET NOCOUNT OFF;
	INSERT INTO tb_docente_certificacion (id_docente, id_certificacion) VALUES (@id_docente,  @id_certificacion)
END

GO
/****** Object:  StoredProcedure [dbo].[INSERTA_HORARIO_CURSO]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTA_HORARIO_CURSO]
@id_dia AS INT,
@id_curso AS INT,
@desde AS TIME(7),
@hasta AS TIME(7)
AS
BEGIN
	SET NOCOUNT OFF;
	INSERT INTO tb_curso_dia (id_dia, id_curso, desde, hasta) VALUES (@id_dia, @id_curso, @desde, @hasta)
END

GO
/****** Object:  StoredProcedure [dbo].[INSERTA_HORARIO_DOCENTE]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTA_HORARIO_DOCENTE]
	@id_docente AS INT,
	@id_dia AS INT,
	@desde AS TIME(7),
	@hasta AS TIME(7)
AS
BEGIN
	SET NOCOUNT OFF;
	INSERT INTO tb_profesor_dia (id_docente, id_dia, desde, hasta) VALUES (@id_docente, @id_dia, @desde, @hasta)
END

GO
/****** Object:  StoredProcedure [dbo].[INSERTA_MODIFICA_CATEGORIA]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTA_MODIFICA_CATEGORIA]
@id_categoria AS INT,
@descripcion AS VARCHAR(50),
@estado AS BIT
AS
BEGIN
	SET NOCOUNT ON;
	IF @id_categoria = 0 
		BEGIN
			INSERT INTO tb_categoria (descripcion, estado) VALUES (@descripcion, @estado)
		END
	ELSE
		BEGIN
			UPDATE tb_categoria SET descripcion = @descripcion, estado = @estado 
			WHERE id_categoria = @id_categoria
		END
	SELECT IDENT_CURRENT('tb_categoria') AS id_categoria
END

GO
/****** Object:  StoredProcedure [dbo].[INSERTA_MODIFICA_CURSO]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTA_MODIFICA_CURSO]
@id_curso AS INT,
@nombre AS VARCHAR(100),
@descripcion AS VARCHAR(100),
@id_categoria AS INT,
@objetivo AS VARCHAR(MAX),
@dirigido_a AS VARCHAR(MAX),
@pre_requisitos AS VARCHAR(MAX),
@aprendizaje AS VARCHAR(MAX),
@precio_ucsg AS DECIMAL(18,2),
@precio_publico AS DECIMAL(18,2),
@maximo_estudiantes AS INT,
@minimo_estudiantes AS INT,
@id_docente AS INT,
@certificacion AS BIT,
@horas AS INT,
@fecha_inicio AS DATE,
@url_imagen AS VARCHAR(MAX),
@estado AS BIT
AS
BEGIN
	SET NOCOUNT ON;
	IF @id_curso = 0
		BEGIN
			INSERT INTO tb_curso (nombre, descripcion, id_categoria, objetivo, dirigido_a,
			pre_requisitos, aprendizaje, precio_ucsg, precio_publico, maximo_estudiantes, minimo_estudiantes,
			id_docente, certificacion, horas, fecha_inicio, url_imagen, estado)
			VALUES (@nombre, @descripcion, @id_categoria, @objetivo, @dirigido_a, @pre_requisitos, 
			@aprendizaje, @precio_ucsg, @precio_publico, @maximo_estudiantes, @minimo_estudiantes, @id_docente,
			@certificacion, @horas, @fecha_inicio, @url_imagen, @estado)
		END
	ELSE
		BEGIN
			UPDATE tb_curso SET nombre = @nombre, descripcion = @descripcion, id_categoria = @id_categoria,
			objetivo = @objetivo, dirigido_a = @dirigido_a, pre_requisitos = @pre_requisitos,
			aprendizaje = @aprendizaje, precio_ucsg = @precio_ucsg, precio_publico = @precio_publico,
			maximo_estudiantes = @maximo_estudiantes, minimo_estudiantes = @minimo_estudiantes,
			id_docente = @id_docente, certificacion = @certificacion, horas = @horas,
			fecha_inicio = @fecha_inicio, url_imagen = @url_imagen, estado = @estado
			WHERE id_curso = @id_curso
			DELETE FROM tb_curso_dia WHERE id_curso = @id_curso
		END
	SELECT IDENT_CURRENT('tb_curso') AS id_curso
END

GO
/****** Object:  StoredProcedure [dbo].[INSERTA_MODIFICA_DOCENTE]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTA_MODIFICA_DOCENTE]
@id_docente AS INT,
@cedula AS VARCHAR(10),
@nombre AS VARCHAR(100),
@direccion AS VARCHAR(100),
@telefono_casa AS VARCHAR(10),
@telefono_trabajo AS VARCHAR(10),
@celular AS VARCHAR(10),
@correo_electronico AS VARCHAR(100),
@id_profesion AS INT,
@id_universidad AS INT,
@experiencia AS VARCHAR(MAX),
@estado AS BIT
AS
BEGIN
	SET NOCOUNT ON;
	IF @id_docente = 0
		BEGIN
			INSERT INTO tb_docente (cedula, nombre, direccion, telefono_casa, telefono_trabajo, celular,
			correo_electronico, id_profesion, id_universidad, experiencia, estado)
			VALUES (@cedula, @nombre, @direccion, @telefono_casa, @telefono_trabajo, @celular,
			@correo_electronico, @id_profesion, @id_universidad, @experiencia, @estado)
		END
	ELSE
		BEGIN
			UPDATE tb_docente SET nombre = @nombre, direccion = @direccion, telefono_casa = @telefono_casa,
			telefono_trabajo = @telefono_trabajo, celular = @celular, correo_electronico = @correo_electronico,
			id_profesion = @id_profesion, id_universidad = @id_universidad, experiencia = @experiencia,
			estado = @estado WHERE id_docente = @id_docente
			DELETE FROM tb_profesor_dia WHERE id_docente = @id_docente
			DELETE FROM tb_docente_certificacion WHERE id_docente = @id_docente
		END
	SELECT IDENT_CURRENT('tb_docente') AS id_docente
END

GO
/****** Object:  StoredProcedure [dbo].[INSERTA_MODIFICA_EVENTO]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTA_MODIFICA_EVENTO]
@id_evento AS INT,
@titulo AS VARCHAR(100),
@descripcion AS VARCHAR(MAX),
@url_imagen AS VARCHAR(MAX),
@fecha_evento AS DATE,
@hora_inicio AS TIME(7),
@hora_fin AS TIME(7),
@estado AS BIT
AS
BEGIN
DECLARE @id INT
	SET NOCOUNT ON;
	IF @id_evento = 0
		BEGIN
			INSERT INTO tb_evento (titulo, descripcion, url_imagen, fecha_publicacion, fecha_evento,
			hora_inicio, hora_fin, estado)
			VALUES (@titulo, @descripcion, @url_imagen, GETDATE(), @fecha_evento, @hora_inicio, @hora_fin,
			@estado)
		END
	ELSE
		BEGIN
			UPDATE tb_evento SET titulo = @titulo, descripcion = @descripcion, url_imagen = @url_imagen,
			fecha_evento = @fecha_evento, hora_inicio = @hora_inicio, hora_fin = @hora_fin, estado = @estado WHERE id_evento = @id_evento
		END
	SET @id = IDENT_CURRENT('tb_evento')
	SELECT @id AS id_evento
END

GO
/****** Object:  StoredProcedure [dbo].[INSERTA_MODIFICA_USUARIO]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[INSERTA_MODIFICA_USUARIO]
	@id_usuario AS INT,
	@id_tipo_identificacion AS INT,
	@identificacion AS VARCHAR(13),
	@nombre_razon_social AS VARCHAR(100),
	@correo_electronico AS VARCHAR(100),
	@nombre_usuario AS VARCHAR(30),
	@contraseña AS VARCHAR(MAX),
	@id_pregunta_secreta AS INT,
	@respuesta_secreta AS VARCHAR(100),
	@sexo AS CHAR(1),
	@direccion AS VARCHAR(100),
	@telefono AS VARCHAR(10),
	@celular AS VARCHAR(10),
	@pagina_web AS VARCHAR(MAX),
	@id_ocupacion AS INT,
	@id_universidad AS INT,
	@id_carrera AS INT,
	@fecha_nacimiento AS DATE
AS
BEGIN
DECLARE @error_message VARCHAR(100)
	SET NOCOUNT ON;
	IF @id_usuario = 0
	BEGIN
		IF EXISTS(SELECT correo_electronico FROM tb_usuario WHERE correo_electronico = @correo_electronico)
			BEGIN
				SET @error_message = 'El correo electrónico ya existe.'
				RAISERROR(@error_message, 1, 1)
			END
		INSERT INTO tb_usuario (
			id_tipo_identificacion, identificacion, nombre_razon_social, correo_electronico, nombre_usuario, 
			contraseña,id_pregunta_secreta, respuesta_secreta, sexo, direccion, telefono, celular, pagina_web,
			id_ocupacion, id_universidad, id_carrera, fecha_nacimiento, fecha_registro, estado
		)
		VALUES (
			@id_tipo_identificacion, @identificacion, @nombre_razon_social, @correo_electronico, 
			@nombre_usuario, @contraseña, @id_pregunta_secreta, @respuesta_secreta, @sexo, @direccion, 
			@telefono, @celular, @pagina_web, @id_ocupacion, @id_universidad, @id_carrera, @fecha_nacimiento, 
			GETDATE(), 'P'
		)
	END
	ELSE
	BEGIN
			UPDATE tb_usuario SET nombre_razon_social = @nombre_razon_social, 
			correo_electronico = @correo_electronico, id_pregunta_secreta = @id_pregunta_secreta,
			respuesta_secreta = @respuesta_secreta, sexo = @sexo, direccion = @direccion,
			telefono = @telefono, celular = @celular, pagina_web = @pagina_web, id_ocupacion = @id_ocupacion,
			id_universidad = @id_universidad, id_carrera = @id_carrera, fecha_nacimiento = @fecha_nacimiento
			WHERE id_usuario = @id_usuario
	END
	SELECT IDENT_CURRENT('tb_usuario') AS id_usuario
END

GO
/****** Object:  StoredProcedure [dbo].[RESPONDE_PREGUNTA_SECRETA]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[RESPONDE_PREGUNTA_SECRETA]
@respuesta AS VARCHAR(100),
@nombre_usuario AS VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM tb_usuario WHERE nombre_usuario = @nombre_usuario AND	 respuesta_secreta = @respuesta
END

GO
/****** Object:  StoredProcedure [dbo].[SELECCIONA_CURSOS]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECCIONA_CURSOS]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM tb_curso WHERE estado = 1 ORDER BY id_curso DESC
END

GO
/****** Object:  StoredProcedure [dbo].[SELECCIONA_EVENTO_FECHA]    Script Date: 10/09/2015 2:41:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECCIONA_EVENTO_FECHA]
@fecha AS DATE
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM tb_evento WHERE estado = 1 AND fecha_evento = @fecha ORDER BY fecha_evento DESC
END

GO
/****** Object:  StoredProcedure [dbo].[SELECCIONA_INSCRIPCION_CONSULTA]    Script Date: 10/09/2015 2:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECCIONA_INSCRIPCION_CONSULTA]
@columna AS VARCHAR(50),
@dato AS VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	EXEC ('SELECT tb_curso.nombre AS curso, tb_curso.fecha_inicio AS fecha_inicio, 
	tb_usuario.nombre_razon_social AS estudiante, tb_docente.nombre AS docente FROM tb_inscripcion
	INNER JOIN tb_curso ON tb_curso.id_curso = tb_inscripcion.id_curso
	INNER JOIN tb_usuario ON tb_usuario.id_usuario = tb_inscripcion.id_usuario
	INNER JOIN tb_docente ON tb_docente.id_docente = tb_curso.id_curso
	WHERE ' + @columna + ' LIKE ''%' + @dato + '%''')
END

GO
/****** Object:  StoredProcedure [dbo].[SELECCIONA_INSCRIPCION_CURSO]    Script Date: 10/09/2015 2:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECCIONA_INSCRIPCION_CURSO]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT tb_usuario.nombre_razon_social AS Nombre, fecha_inscripcion AS Fecha, tb_curso.nombre AS Curso FROM tb_inscripcion
	INNER JOIN tb_usuario ON tb_inscripcion.id_usuario = tb_usuario.id_usuario
	INNER JOIN tb_curso ON tb_inscripcion.id_curso = tb_curso.id_curso ORDER BY tb_inscripcion.id_curso DESC
END

GO
/****** Object:  StoredProcedure [dbo].[SELECCIONA_LISTA_INSCRIPCIONES]    Script Date: 10/09/2015 2:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECCIONA_LISTA_INSCRIPCIONES]
@id_usuario AS INT
AS
BEGIN
	SET NOCOUNT ON;
	SELECT tb_curso.nombre, tb_curso.id_curso FROM tb_inscripcion INNER JOIN tb_curso ON tb_curso.id_curso = tb_inscripcion.id_curso WHERE id_usuario = @id_usuario
END

GO
/****** Object:  StoredProcedure [dbo].[SELECCIONA_REGISTRO_CONSULTA]    Script Date: 10/09/2015 2:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECCIONA_REGISTRO_CONSULTA]
@tabla AS VARCHAR(100),
@columna AS VARCHAR(100),
@dato AS VARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;
	EXEC('SELECT * FROM ' + @tabla + ' WHERE ' + @columna + ' LIKE ''%' + @dato + '%''')
END

GO
/****** Object:  StoredProcedure [dbo].[SELECCIONA_REGISTRO_ESPECIFICO]    Script Date: 10/09/2015 2:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECCIONA_REGISTRO_ESPECIFICO]
@tabla AS VARCHAR(100),
@columna AS VARCHAR(100),
@dato AS VARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;
	EXEC ('SELECT * FROM ' + @tabla + ' WHERE ' + @columna + '=' + @dato)
END

GO
/****** Object:  StoredProcedure [dbo].[SELECCIONA_REGISTRO_ESPECIFICO_TEXTO]    Script Date: 10/09/2015 2:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECCIONA_REGISTRO_ESPECIFICO_TEXTO]
@tabla AS VARCHAR(50),
@columna AS VARCHAR(50),
@dato AS VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
	EXEC('SELECT * FROM ' + @tabla + ' WHERE ' + @columna + ' = ''' + @dato + '''')
	
END

GO
/****** Object:  StoredProcedure [dbo].[SELECCIONA_TABLA_GENERAL]    Script Date: 10/09/2015 2:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECCIONA_TABLA_GENERAL]
@tabla AS VARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;
	EXEC('SELECT * FROM ' + @tabla)
END

GO
/****** Object:  StoredProcedure [dbo].[SELECCIONA_TABLA_GENERAL_POR_ESTADO]    Script Date: 10/09/2015 2:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECCIONA_TABLA_GENERAL_POR_ESTADO]
@tabla AS VARCHAR(100)
AS
BEGIN
	SET NOCOUNT ON;
	EXEC('SELECT * FROM ' + @tabla + ' WHERE estado = 1')
END

GO
/****** Object:  StoredProcedure [dbo].[SELECCIONA_USUARIO]    Script Date: 10/09/2015 2:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SELECCIONA_USUARIO]
@nombre_usuario AS VARCHAR(30),
@contraseña AS VARCHAR(MAX)
AS
BEGIN
	SET NOCOUNT ON;
	SELECT * FROM tb_usuario WHERE nombre_usuario = @nombre_usuario AND contraseña = @contraseña
	AND estado = 'A'
END

GO
/****** Object:  StoredProcedure [dbo].[ULTIMAS_INSCRIPCIONES]    Script Date: 10/09/2015 2:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ULTIMAS_INSCRIPCIONES]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT TOP 10 tb_usuario.nombre_razon_social, tb_curso.nombre FROM tb_inscripcion
	INNER JOIN tb_usuario ON tb_usuario.id_usuario = tb_inscripcion.id_usuario 
	INNER JOIN tb_curso ON tb_curso.id_curso = tb_inscripcion.id_curso
	ORDER BY tb_inscripcion.fecha_inscripcion DESC
END

GO
/****** Object:  StoredProcedure [dbo].[ULTIMOS_USUARIOS]    Script Date: 10/09/2015 2:41:39 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ULTIMOS_USUARIOS]
AS
BEGIN
	SET NOCOUNT ON;
	SELECT TOP 10 * FROM tb_usuario WHERE estado = 'A' ORDER BY id_usuario DESC
END

GO
USE [master]
GO
ALTER DATABASE [db_cft] SET  READ_WRITE 
GO
