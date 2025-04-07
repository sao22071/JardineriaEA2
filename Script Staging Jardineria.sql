USE [master]
GO
/****** Object:  Database [StagingJardineria]    Script Date: 3/30/2025 6:59:22 PM ******/
CREATE DATABASE [StagingJardineria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StagingJardineria', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\StagingJardineria.mdf' , SIZE = 139264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StagingJardineria_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\StagingJardineria_log.ldf' , SIZE = 991232KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [StagingJardineria] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StagingJardineria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StagingJardineria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StagingJardineria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StagingJardineria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StagingJardineria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StagingJardineria] SET ARITHABORT OFF 
GO
ALTER DATABASE [StagingJardineria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StagingJardineria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StagingJardineria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StagingJardineria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StagingJardineria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StagingJardineria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StagingJardineria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StagingJardineria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StagingJardineria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StagingJardineria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StagingJardineria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StagingJardineria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StagingJardineria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StagingJardineria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StagingJardineria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StagingJardineria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StagingJardineria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StagingJardineria] SET RECOVERY FULL 
GO
ALTER DATABASE [StagingJardineria] SET  MULTI_USER 
GO
ALTER DATABASE [StagingJardineria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StagingJardineria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StagingJardineria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StagingJardineria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StagingJardineria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [StagingJardineria] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'StagingJardineria', N'ON'
GO
ALTER DATABASE [StagingJardineria] SET QUERY_STORE = ON
GO
ALTER DATABASE [StagingJardineria] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [StagingJardineria]
GO
/****** Object:  Table [dbo].[DIMCliente]    Script Date: 3/30/2025 6:59:22 PM ******/
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
/****** Object:  Table [dbo].[DIMEmpleado]    Script Date: 3/30/2025 6:59:22 PM ******/
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
/****** Object:  Table [dbo].[DIMProducto]    Script Date: 3/30/2025 6:59:22 PM ******/
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
/****** Object:  Table [dbo].[DIMTiempo]    Script Date: 3/30/2025 6:59:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DIMTiempo](
	[IDTiempo] [int] IDENTITY(1,1) NOT NULL,
	[fecha_pedido] [date] NULL,
	[Day] [int] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
	[NumWeek] [int] NULL,
	[Quarter] [int] NULL,
	[DayWeek] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IDTiempo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fact_Pedido]    Script Date: 3/30/2025 6:59:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fact_Pedido](
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
/****** Object:  Table [dbo].[STJardinera_Cliente]    Script Date: 3/30/2025 6:59:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STJardinera_Cliente](
	[ID_cliente] [int] NULL,
	[nombre_cliente] [nvarchar](50) NULL,
	[nombre_contacto] [nvarchar](30) NULL,
	[apellido_contacto] [nvarchar](30) NULL,
	[ID_empleado_rep_ventas] [int] NULL,
	[telefono] [nvarchar](15) NULL,
	[ciudad] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STJardinera_Empleado]    Script Date: 3/30/2025 6:59:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STJardinera_Empleado](
	[ID_empleado] [int] NULL,
	[nombre] [nvarchar](50) NULL,
	[apellido1] [nvarchar](50) NULL,
	[apellido2] [nvarchar](50) NULL,
	[ID_oficina] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STJardinera_Producto]    Script Date: 3/30/2025 6:59:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STJardinera_Producto](
	[ID_producto] [int] NULL,
	[CodigoProducto] [nvarchar](15) NULL,
	[nombre] [nvarchar](70) NULL,
	[Categoria] [int] NULL,
	[dimensiones] [nvarchar](25) NULL,
	[proveedor] [nvarchar](50) NULL,
	[descripcion] [nvarchar](max) NULL,
	[cantidad_en_stock] [smallint] NULL,
	[precio_venta] [numeric](15, 2) NULL,
	[precio_proveedor] [numeric](15, 2) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STJardineria_Categoria_producto]    Script Date: 3/30/2025 6:59:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STJardineria_Categoria_producto](
	[Id_Categoria] [int] NULL,
	[Desc_Categoria] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STJardineria_Oficina]    Script Date: 3/30/2025 6:59:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STJardineria_Oficina](
	[ID_oficina] [int] NULL,
	[ciudad] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STJardineria_Pedido_Tiempo]    Script Date: 3/30/2025 6:59:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STJardineria_Pedido_Tiempo](
	[fecha_pedido] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STJardineriaFact_Pedido]    Script Date: 3/30/2025 6:59:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STJardineriaFact_Pedido](
	[ID_pedido] [int] NULL,
	[ID_producto] [int] NULL,
	[cantidad] [int] NULL,
	[precio_unidad] [numeric](15, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[STJardineriaPedido]    Script Date: 3/30/2025 6:59:22 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STJardineriaPedido](
	[ID_pedido] [int] NULL,
	[fecha_pedido] [date] NULL,
	[fecha_esperada] [date] NULL,
	[fecha_entrega] [date] NULL,
	[estado] [nvarchar](15) NULL,
	[ID_cliente] [int] NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [StagingJardineria] SET  READ_WRITE 
GO
