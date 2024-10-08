USE [master]
GO
/****** Object:  Database [DB_ROKYS]    Script Date: 16/08/2024 22:51:51 ******/
CREATE DATABASE [DB_ROKYS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_ROKYS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DB_ROKYS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_ROKYS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DB_ROKYS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DB_ROKYS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_ROKYS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_ROKYS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_ROKYS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_ROKYS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_ROKYS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_ROKYS] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_ROKYS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_ROKYS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_ROKYS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_ROKYS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_ROKYS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_ROKYS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_ROKYS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_ROKYS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_ROKYS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_ROKYS] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DB_ROKYS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_ROKYS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_ROKYS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_ROKYS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_ROKYS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_ROKYS] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_ROKYS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_ROKYS] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_ROKYS] SET  MULTI_USER 
GO
ALTER DATABASE [DB_ROKYS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_ROKYS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_ROKYS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_ROKYS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_ROKYS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_ROKYS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_ROKYS', N'ON'
GO
ALTER DATABASE [DB_ROKYS] SET QUERY_STORE = ON
GO
ALTER DATABASE [DB_ROKYS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DB_ROKYS]
GO
/****** Object:  Table [dbo].[TB_ALMACENERO]    Script Date: 16/08/2024 22:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_ALMACENERO](
	[cod_almacen] [int] IDENTITY(1,1) NOT NULL,
	[stock_actual] [decimal](18, 2) NULL,
	[cod_Empleado] [int] NULL,
	[codigo_pr] [int] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_TB_ALMACENERO] PRIMARY KEY CLUSTERED 
(
	[cod_almacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_CAJERO]    Script Date: 16/08/2024 22:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CAJERO](
	[cod_Cajero] [int] IDENTITY(1,1) NOT NULL,
	[saldo_caj] [decimal](18, 2) NULL,
	[cambio_caj] [varchar](50) NULL,
	[cod_Empleado] [int] NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_TB_CAJERO] PRIMARY KEY CLUSTERED 
(
	[cod_Cajero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_CATEGORIAS]    Script Date: 16/08/2024 22:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CATEGORIAS](
	[codigo_ca] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_ca] [varchar](50) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_TB_CATEGORIAS] PRIMARY KEY CLUSTERED 
(
	[codigo_ca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_CLIENTE]    Script Date: 16/08/2024 22:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_CLIENTE](
	[cod_cli] [int] IDENTITY(1,1) NOT NULL,
	[nombre_cli] [varchar](30) NULL,
	[apelldio_cli] [varchar](30) NULL,
	[dni_cli] [varchar](8) NULL,
	[telefono_cli] [varchar](9) NULL,
	[correo_cli] [varchar](50) NULL,
 CONSTRAINT [PK_TB_CLIENTE] PRIMARY KEY CLUSTERED 
(
	[cod_cli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_COMPROBANTE]    Script Date: 16/08/2024 22:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_COMPROBANTE](
	[cod_Comprobante] [int] IDENTITY(1,1) NOT NULL,
	[Igv] [decimal](18, 2) NULL,
	[total] [decimal](18, 2) NULL,
	[fecha_comprobante] [datetime] NULL,
	[cod_Cajero] [int] NULL,
	[medio_pago] [varchar](30) NULL,
	[ruc_cli] [varchar](11) NULL,
	[correo_cli] [varchar](30) NULL,
	[razon_social] [varchar](50) NULL,
	[cod_cli] [int] NULL,
 CONSTRAINT [PK_TB_COMPROBANTE] PRIMARY KEY CLUSTERED 
(
	[cod_Comprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_EMPLEADO]    Script Date: 16/08/2024 22:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_EMPLEADO](
	[cod_Empleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre_em] [varchar](80) NULL,
	[apellido_em] [varchar](50) NULL,
	[cargo_em] [varchar](50) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_TB_EMPLEADO] PRIMARY KEY CLUSTERED 
(
	[cod_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_MEDIDAS]    Script Date: 16/08/2024 22:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_MEDIDAS](
	[codigo_me] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_me] [varchar](20) NULL,
	[activo] [bit] NULL,
 CONSTRAINT [PK_TB_MEDIDAS] PRIMARY KEY CLUSTERED 
(
	[codigo_me] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_PRODUCTOS]    Script Date: 16/08/2024 22:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_PRODUCTOS](
	[codigo_pr] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_pr] [varchar](80) NULL,
	[marca_pr] [varchar](30) NULL,
	[codigo_me] [int] NULL,
	[codigo_ca] [int] NULL,
	[stock_actual] [decimal](18, 2) NULL,
	[fecha_crea] [datetime] NULL,
	[activo] [bit] NULL,
	[cod_almacen] [int] NULL,
	[precio_pr] [decimal](18, 2) NULL,
 CONSTRAINT [PK_TB_PRODUCTOS] PRIMARY KEY CLUSTERED 
(
	[codigo_pr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TB_VENTAS]    Script Date: 16/08/2024 22:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TB_VENTAS](
	[cod_venta] [int] IDENTITY(1,1) NOT NULL,
	[precio_pr] [decimal](18, 2) NULL,
	[stock_actual] [decimal](18, 2) NULL,
	[descripcion_pr] [varchar](80) NULL,
	[codigo_pr] [int] NULL,
	[codigo_ca] [int] NULL,
	[activo] [bit] NULL,
	[cod_Comprobante] [int] NULL,
 CONSTRAINT [PK_TB_VENTAS] PRIMARY KEY CLUSTERED 
(
	[cod_venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TB_CATEGORIAS] ON 

INSERT [dbo].[TB_CATEGORIAS] ([codigo_ca], [descripcion_ca], [activo]) VALUES (1, N'POLLOS', 1)
INSERT [dbo].[TB_CATEGORIAS] ([codigo_ca], [descripcion_ca], [activo]) VALUES (2, N'CARNES', 1)
INSERT [dbo].[TB_CATEGORIAS] ([codigo_ca], [descripcion_ca], [activo]) VALUES (3, N'BEBIDAS', 1)
INSERT [dbo].[TB_CATEGORIAS] ([codigo_ca], [descripcion_ca], [activo]) VALUES (4, N'MENAJE', 1)
SET IDENTITY_INSERT [dbo].[TB_CATEGORIAS] OFF
GO
SET IDENTITY_INSERT [dbo].[TB_MEDIDAS] ON 

INSERT [dbo].[TB_MEDIDAS] ([codigo_me], [descripcion_me], [activo]) VALUES (1, N'UNIDAD', 1)
INSERT [dbo].[TB_MEDIDAS] ([codigo_me], [descripcion_me], [activo]) VALUES (2, N'KILOGRAMOS', 1)
INSERT [dbo].[TB_MEDIDAS] ([codigo_me], [descripcion_me], [activo]) VALUES (3, N'LITROS', 1)
INSERT [dbo].[TB_MEDIDAS] ([codigo_me], [descripcion_me], [activo]) VALUES (4, N'CAJAS', 1)
SET IDENTITY_INSERT [dbo].[TB_MEDIDAS] OFF
GO
SET IDENTITY_INSERT [dbo].[TB_PRODUCTOS] ON 

INSERT [dbo].[TB_PRODUCTOS] ([codigo_pr], [descripcion_pr], [marca_pr], [codigo_me], [codigo_ca], [stock_actual], [fecha_crea], [activo], [cod_almacen], [precio_pr]) VALUES (1, N'pollo de corral', N'san fernando', 1, 1, CAST(23.00 AS Decimal(18, 2)), CAST(N'2024-08-11T04:57:08.440' AS DateTime), 1, NULL, CAST(18.00 AS Decimal(18, 2)))
INSERT [dbo].[TB_PRODUCTOS] ([codigo_pr], [descripcion_pr], [marca_pr], [codigo_me], [codigo_ca], [stock_actual], [fecha_crea], [activo], [cod_almacen], [precio_pr]) VALUES (2, N'gaseosa', N'pepsi', 4, 3, CAST(80.00 AS Decimal(18, 2)), CAST(N'2024-08-11T12:30:54.570' AS DateTime), 0, NULL, NULL)
INSERT [dbo].[TB_PRODUCTOS] ([codigo_pr], [descripcion_pr], [marca_pr], [codigo_me], [codigo_ca], [stock_actual], [fecha_crea], [activo], [cod_almacen], [precio_pr]) VALUES (3, N'cerveza', N'pilsen', 4, 3, CAST(50.00 AS Decimal(18, 2)), CAST(N'2024-08-11T12:31:09.837' AS DateTime), 0, NULL, CAST(5.00 AS Decimal(18, 2)))
INSERT [dbo].[TB_PRODUCTOS] ([codigo_pr], [descripcion_pr], [marca_pr], [codigo_me], [codigo_ca], [stock_actual], [fecha_crea], [activo], [cod_almacen], [precio_pr]) VALUES (4, N'carne de caballo', N'el venecol', 2, 2, CAST(50.00 AS Decimal(18, 2)), CAST(N'2024-08-11T13:39:05.637' AS DateTime), 1, NULL, CAST(15.00 AS Decimal(18, 2)))
INSERT [dbo].[TB_PRODUCTOS] ([codigo_pr], [descripcion_pr], [marca_pr], [codigo_me], [codigo_ca], [stock_actual], [fecha_crea], [activo], [cod_almacen], [precio_pr]) VALUES (5, N'inca', N'coca cola', 1, 3, CAST(70.00 AS Decimal(18, 2)), CAST(N'2024-08-15T17:51:02.753' AS DateTime), 1, NULL, CAST(6.50 AS Decimal(18, 2)))
INSERT [dbo].[TB_PRODUCTOS] ([codigo_pr], [descripcion_pr], [marca_pr], [codigo_me], [codigo_ca], [stock_actual], [fecha_crea], [activo], [cod_almacen], [precio_pr]) VALUES (6, N'pollo promocion con inca', N'generico', 1, 1, CAST(20.00 AS Decimal(18, 2)), CAST(N'2024-08-15T22:34:59.440' AS DateTime), 1, NULL, CAST(68.50 AS Decimal(18, 2)))
INSERT [dbo].[TB_PRODUCTOS] ([codigo_pr], [descripcion_pr], [marca_pr], [codigo_me], [codigo_ca], [stock_actual], [fecha_crea], [activo], [cod_almacen], [precio_pr]) VALUES (7, N'cuchillos', N'generico', 1, 4, CAST(30.00 AS Decimal(18, 2)), CAST(N'2024-08-16T21:11:23.383' AS DateTime), 1, NULL, CAST(1.20 AS Decimal(18, 2)))
INSERT [dbo].[TB_PRODUCTOS] ([codigo_pr], [descripcion_pr], [marca_pr], [codigo_me], [codigo_ca], [stock_actual], [fecha_crea], [activo], [cod_almacen], [precio_pr]) VALUES (8, N'platos', N'generico', 1, 4, CAST(200.00 AS Decimal(18, 2)), CAST(N'2024-08-16T21:12:11.220' AS DateTime), 1, NULL, CAST(5.80 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TB_PRODUCTOS] OFF
GO
ALTER TABLE [dbo].[TB_ALMACENERO]  WITH CHECK ADD  CONSTRAINT [FK_TB_ALMACENERO_TB_EMPLEADO] FOREIGN KEY([cod_Empleado])
REFERENCES [dbo].[TB_EMPLEADO] ([cod_Empleado])
GO
ALTER TABLE [dbo].[TB_ALMACENERO] CHECK CONSTRAINT [FK_TB_ALMACENERO_TB_EMPLEADO]
GO
ALTER TABLE [dbo].[TB_CAJERO]  WITH CHECK ADD  CONSTRAINT [FK_TB_CAJERO_TB_EMPLEADO] FOREIGN KEY([cod_Empleado])
REFERENCES [dbo].[TB_EMPLEADO] ([cod_Empleado])
GO
ALTER TABLE [dbo].[TB_CAJERO] CHECK CONSTRAINT [FK_TB_CAJERO_TB_EMPLEADO]
GO
ALTER TABLE [dbo].[TB_COMPROBANTE]  WITH CHECK ADD  CONSTRAINT [FK_TB_COMPROBANTE_TB_CAJERO1] FOREIGN KEY([cod_Cajero])
REFERENCES [dbo].[TB_CAJERO] ([cod_Cajero])
GO
ALTER TABLE [dbo].[TB_COMPROBANTE] CHECK CONSTRAINT [FK_TB_COMPROBANTE_TB_CAJERO1]
GO
ALTER TABLE [dbo].[TB_COMPROBANTE]  WITH CHECK ADD  CONSTRAINT [FK_TB_COMPROBANTE_TB_CLIENTE] FOREIGN KEY([cod_cli])
REFERENCES [dbo].[TB_CLIENTE] ([cod_cli])
GO
ALTER TABLE [dbo].[TB_COMPROBANTE] CHECK CONSTRAINT [FK_TB_COMPROBANTE_TB_CLIENTE]
GO
ALTER TABLE [dbo].[TB_PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_TB_PRODUCTOS_TB_ALMACENERO] FOREIGN KEY([cod_almacen])
REFERENCES [dbo].[TB_ALMACENERO] ([cod_almacen])
GO
ALTER TABLE [dbo].[TB_PRODUCTOS] CHECK CONSTRAINT [FK_TB_PRODUCTOS_TB_ALMACENERO]
GO
ALTER TABLE [dbo].[TB_PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_TB_PRODUCTOS_TB_CATEGORIAS] FOREIGN KEY([codigo_ca])
REFERENCES [dbo].[TB_CATEGORIAS] ([codigo_ca])
GO
ALTER TABLE [dbo].[TB_PRODUCTOS] CHECK CONSTRAINT [FK_TB_PRODUCTOS_TB_CATEGORIAS]
GO
ALTER TABLE [dbo].[TB_PRODUCTOS]  WITH CHECK ADD  CONSTRAINT [FK_TB_PRODUCTOS_TB_MEDIDAS] FOREIGN KEY([codigo_me])
REFERENCES [dbo].[TB_MEDIDAS] ([codigo_me])
GO
ALTER TABLE [dbo].[TB_PRODUCTOS] CHECK CONSTRAINT [FK_TB_PRODUCTOS_TB_MEDIDAS]
GO
ALTER TABLE [dbo].[TB_VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_TB_VENTAS_TB_CATEGORIAS] FOREIGN KEY([codigo_ca])
REFERENCES [dbo].[TB_CATEGORIAS] ([codigo_ca])
GO
ALTER TABLE [dbo].[TB_VENTAS] CHECK CONSTRAINT [FK_TB_VENTAS_TB_CATEGORIAS]
GO
ALTER TABLE [dbo].[TB_VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_TB_VENTAS_TB_COMPROBANTE] FOREIGN KEY([cod_Comprobante])
REFERENCES [dbo].[TB_COMPROBANTE] ([cod_Comprobante])
GO
ALTER TABLE [dbo].[TB_VENTAS] CHECK CONSTRAINT [FK_TB_VENTAS_TB_COMPROBANTE]
GO
ALTER TABLE [dbo].[TB_VENTAS]  WITH CHECK ADD  CONSTRAINT [FK_TB_VENTAS_TB_PRODUCTOS] FOREIGN KEY([codigo_pr])
REFERENCES [dbo].[TB_PRODUCTOS] ([codigo_pr])
GO
ALTER TABLE [dbo].[TB_VENTAS] CHECK CONSTRAINT [FK_TB_VENTAS_TB_PRODUCTOS]
GO
/****** Object:  StoredProcedure [dbo].[ACTIVO_PR]    Script Date: 16/08/2024 22:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ACTIVO_PR]
@nCodigo_pr int,
@bEstado_activo bit
AS
	update TB_PRODUCTOS set activo=@bEstado_activo
						where codigo_pr=@nCodigo_pr;
GO
/****** Object:  StoredProcedure [dbo].[USP_DELETEVENTA]    Script Date: 16/08/2024 22:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_DELETEVENTA]
    @cod_venta INT
AS
BEGIN
    DELETE FROM TB_VENTAS
    WHERE cod_venta = @cod_venta;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GETVENTA]    Script Date: 16/08/2024 22:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GETVENTA]
    @cod_venta INT
AS
BEGIN
    SELECT cod_venta, precio_pr, stock_actual, descripcion_pr, codigo_pr, codigo_ca, activo, cod_Comprobante
    FROM TB_VENTAS
    WHERE cod_venta = @cod_venta;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_GUARDAR_PR]    Script Date: 16/08/2024 22:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_GUARDAR_PR]  
@Opcion int=1,  
@nCodigo_pr int,  
@cDescripcion_pr varchar(80),  
@cMarca_pr varchar(30),  
@nCodigo_me int,  
@nCodigo_ca int,  
@nStock_actual decimal(18,2),
@nPrecio_pr decimal(18,2)
AS  
if @Opcion=1  
 begin  
  INSERT INTO TB_PRODUCTOS(descripcion_pr,  
         marca_pr,  
         codigo_me,  
         codigo_ca,  
         stock_actual, 
		 precio_pr,
         fecha_crea,  
         activo)  
       values(@cDescripcion_pr,  
        @cMarca_pr,  
        @nCodigo_me,  
        @nCodigo_ca,  
        @nStock_actual,
		@nPrecio_pr,
        GETDATE(),  
        1);  
 end;  
else  
begin  
 update TB_PRODUCTOS set descripcion_pr=@cDescripcion_pr,  
       marca_pr=@cMarca_pr,  
       codigo_me=@nCodigo_me,  
       codigo_ca=@nCodigo_ca,  
       stock_actual=@nStock_actual,
	   precio_pr=@nPrecio_pr
     where codigo_pr=@nCodigo_pr;          
end;
GO
/****** Object:  StoredProcedure [dbo].[USP_INSERTVENTA]    Script Date: 16/08/2024 22:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_INSERTVENTA]
    @precio_pr DECIMAL(18,2),
    @stock_actual DECIMAL(18,2),
    @descripcion_pr VARCHAR(80),
    @codigo_pr INT,
    @codigo_ca INT,
    @activo BIT,
    @cod_Comprobante INT
AS
BEGIN
    INSERT INTO TB_VENTAS (precio_pr, stock_actual, descripcion_pr, codigo_pr, codigo_ca, activo, cod_Comprobante)
    VALUES (@precio_pr, @stock_actual, @descripcion_pr, @codigo_pr, @codigo_ca, @activo, @cod_Comprobante);
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LISTADO_CA]    Script Date: 16/08/2024 22:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LISTADO_CA] 
AS    
SELECT descripcion_ca, codigo_ca    
FROM TB_CATEGORIAS    
WHERE activo=1;
GO
/****** Object:  StoredProcedure [dbo].[USP_LISTADO_ME]    Script Date: 16/08/2024 22:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LISTADO_ME]
AS
SELECT descripcion_me,
	   codigo_me
FROM TB_MEDIDAS
WHERE activo=1;
GO
/****** Object:  StoredProcedure [dbo].[USP_LISTADO_PR]    Script Date: 16/08/2024 22:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LISTADO_PR]  
@cTexto varchar(80)=''  
AS  
SELECT a.codigo_pr,  
    a.descripcion_pr,  
    a.marca_pr,  
    b.descripcion_me,  
    c.descripcion_ca, 
	a.precio_pr,
    a.stock_actual,  
    a.codigo_me,  
    a.codigo_ca  
FROM TB_PRODUCTOS a  
INNER JOIN TB_MEDIDAS b ON a.codigo_me=b.codigo_me  
INNER JOIN TB_CATEGORIAS c ON a.codigo_ca=c.codigo_ca  
where a.activo=1 and  
upper(trim(a.descripcion_pr) + trim(a.marca_pr)) like '%'+upper(trim(@cTexto))+'%'  
order by a.codigo_pr;  
GO
/****** Object:  StoredProcedure [dbo].[USP_LISTADO_PR_POR_CATEGORIA]    Script Date: 16/08/2024 22:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LISTADO_PR_POR_CATEGORIA]
    @cCategoria VARCHAR(50)
AS
BEGIN
    SELECT 
        p.descripcion_pr, 
        p.codigo_pr, 
        p.marca_pr, 
        p.stock_actual, 
        p.precio_pr
    FROM 
        TB_PRODUCTOS p
    INNER JOIN 
        TB_CATEGORIAS c ON p.codigo_ca = c.codigo_ca
    WHERE 
        c.descripcion_ca = @cCategoria 
        AND p.activo = 1;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_LISTVENTAS]    Script Date: 16/08/2024 22:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_LISTVENTAS]
AS
BEGIN
    SELECT cod_venta, precio_pr, stock_actual, descripcion_pr, codigo_pr, codigo_ca, activo, cod_Comprobante
    FROM TB_VENTAS;
END
GO
/****** Object:  StoredProcedure [dbo].[USP_UPDATEVENTA]    Script Date: 16/08/2024 22:51:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[USP_UPDATEVENTA]
    @cod_venta INT,
    @precio_pr DECIMAL(18,2),
    @stock_actual DECIMAL(18,2),
    @descripcion_pr VARCHAR(80),
    @codigo_pr INT,
    @codigo_ca INT,
    @activo BIT,
    @cod_Comprobante INT
AS
BEGIN
    UPDATE TB_VENTAS
    SET precio_pr = @precio_pr,
        stock_actual = @stock_actual,
        descripcion_pr = @descripcion_pr,
        codigo_pr = @codigo_pr,
        codigo_ca = @codigo_ca,
        activo = @activo,
        cod_Comprobante = @cod_Comprobante
    WHERE cod_venta = @cod_venta;
END
GO
USE [master]
GO
ALTER DATABASE [DB_ROKYS] SET  READ_WRITE 
GO
