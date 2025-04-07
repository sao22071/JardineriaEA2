USE [master]
GO
/****** Object:  Database [DMPedidos]    Script Date: 3/30/2025 6:57:16 PM ******/
CREATE DATABASE [DMPedidos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DMPedidos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DMPedidos.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DMPedidos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DMPedidos_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DMPedidos] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DMPedidos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DMPedidos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DMPedidos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DMPedidos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DMPedidos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DMPedidos] SET ARITHABORT OFF 
GO
ALTER DATABASE [DMPedidos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DMPedidos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DMPedidos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DMPedidos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DMPedidos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DMPedidos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DMPedidos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DMPedidos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DMPedidos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DMPedidos] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DMPedidos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DMPedidos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DMPedidos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DMPedidos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DMPedidos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DMPedidos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DMPedidos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DMPedidos] SET RECOVERY FULL 
GO
ALTER DATABASE [DMPedidos] SET  MULTI_USER 
GO
ALTER DATABASE [DMPedidos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DMPedidos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DMPedidos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DMPedidos] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DMPedidos] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DMPedidos] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DMPedidos', N'ON'
GO
ALTER DATABASE [DMPedidos] SET QUERY_STORE = ON
GO
ALTER DATABASE [DMPedidos] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [DMPedidos]
GO
/****** Object:  Table [dbo].[DIMCliente]    Script Date: 3/30/2025 6:57:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIMCliente](
	[ID_cliente] [int] NULL,
	[Nombre Cliente] [nvarchar](50) NULL,
	[Nombre Contacto] [nvarchar](30) NULL,
	[Apellido Contacto] [nvarchar](30) NULL,
	[ID_empleado_rep_ventas] [int] NULL,
	[Telefono] [nvarchar](15) NULL,
	[Ciudad] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIMEmpleado]    Script Date: 3/30/2025 6:57:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIMEmpleado](
	[ID_empleado] [int] NULL,
	[Nombres] [nvarchar](50) NULL,
	[Apellidos] [nvarchar](101) NULL,
	[ID_oficina] [int] NULL,
	[Ciudad] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIMProducto]    Script Date: 3/30/2025 6:57:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIMProducto](
	[ID_producto] [int] NULL,
	[CodigoProducto] [nvarchar](15) NULL,
	[nombre] [nvarchar](70) NULL,
	[Categoria] [nvarchar](50) NULL,
	[Dimension] [nvarchar](25) NULL,
	[proveedor] [nvarchar](50) NULL,
	[Descripcion] [nvarchar](max) NULL,
	[cantidad_en_stock] [smallint] NULL,
	[precio_venta] [numeric](15, 2) NULL,
	[precio_proveedor] [numeric](15, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DIMTiempo]    Script Date: 3/30/2025 6:57:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIMTiempo](
	[IDTiempo] [int] NULL,
	[fecha_pedido] [date] NULL,
	[Day] [int] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[NumWeek] [int] NULL,
	[Quarter] [int] NULL,
	[DayWeek] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FACT_Pedido]    Script Date: 3/30/2025 6:57:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FACT_Pedido](
	[ID_pedido] [int] NULL,
	[ID_producto] [int] NULL,
	[ID_empleado] [int] NULL,
	[ID_oficina] [int] NULL,
	[ID_cliente] [int] NULL,
	[cantidad] [int] NULL,
	[precio_unidad] [numeric](15, 2) NULL,
	[estado] [nvarchar](15) NULL,
	[Fecha_pedido] [date] NULL,
	[Fecha_esperada] [date] NULL,
	[Fecha_entrega] [date] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [DMPedidos] SET  READ_WRITE 
GO
