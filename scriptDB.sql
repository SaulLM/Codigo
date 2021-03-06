USE [master]
GO
/****** Object:  Database [lbprod]    Script Date: 5/12/2019 10:08:51 PM ******/
CREATE DATABASE [lbprod]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'lbprod', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\lbprod.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'lbprod_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\lbprod_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [lbprod] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [lbprod].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [lbprod] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [lbprod] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [lbprod] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [lbprod] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [lbprod] SET ARITHABORT OFF 
GO
ALTER DATABASE [lbprod] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [lbprod] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [lbprod] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [lbprod] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [lbprod] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [lbprod] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [lbprod] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [lbprod] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [lbprod] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [lbprod] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [lbprod] SET  DISABLE_BROKER 
GO
ALTER DATABASE [lbprod] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [lbprod] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [lbprod] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [lbprod] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [lbprod] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [lbprod] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [lbprod] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [lbprod] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [lbprod] SET  MULTI_USER 
GO
ALTER DATABASE [lbprod] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [lbprod] SET DB_CHAINING OFF 
GO
ALTER DATABASE [lbprod] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [lbprod] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [lbprod]
GO
/****** Object:  Table [dbo].[lb_acceso_cliente]    Script Date: 5/12/2019 10:08:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lb_acceso_cliente](
	[ac_codcli] [int] NOT NULL,
	[ac_password] [varchar](50) NOT NULL,
	[ac_created_date] [date] NOT NULL,
	[ac_created_by] [varchar](50) NOT NULL,
 CONSTRAINT [PK_lb_acceso_cliente] PRIMARY KEY CLUSTERED 
(
	[ac_codcli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lb_cliente]    Script Date: 5/12/2019 10:08:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lb_cliente](
	[cli_codigo] [int] NOT NULL,
	[cli_nombre] [varchar](50) NULL,
	[cli_apellido] [varchar](50) NULL,
	[cli_created_date] [date] NULL,
	[cli_created_by] [varchar](50) NULL,
	[cli_estado] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[cli_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lb_cliente_beneficiario]    Script Date: 5/12/2019 10:08:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lb_cliente_beneficiario](
	[cb_codigo] [int] NOT NULL,
	[cb_codcli_ori] [int] NOT NULL,
	[cb_codcli_des] [int] NOT NULL,
	[cb_codpro] [int] NOT NULL,
	[cb_email_des] [varchar](100) NOT NULL,
	[cb_estado_afiliacion] [varchar](50) NOT NULL,
	[cb_created_date] [date] NOT NULL,
	[cb_created_by] [varchar](50) NOT NULL,
 CONSTRAINT [PK_lb_cliente_beneficiario] PRIMARY KEY CLUSTERED 
(
	[cb_codcli_ori] ASC,
	[cb_codcli_des] ASC,
	[cb_codpro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[cb_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lb_cuenta_producto]    Script Date: 5/12/2019 10:08:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lb_cuenta_producto](
	[cp_codcli] [int] NOT NULL,
	[cp_cuenta] [int] NOT NULL,
	[cp_codpro] [int] NOT NULL,
	[cp_estado] [varchar](50) NOT NULL,
	[cp_created_date] [date] NULL,
	[cp_created_by] [varchar](50) NULL,
 CONSTRAINT [PK_lb_cuenta_producto] PRIMARY KEY CLUSTERED 
(
	[cp_cuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lb_estado_cuenta]    Script Date: 5/12/2019 10:08:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lb_estado_cuenta](
	[ec_codigo] [int] NOT NULL,
	[ec_valor_estado] [varchar](50) NOT NULL,
	[ec_descripcion] [varchar](150) NOT NULL,
	[ec_created_date] [date] NOT NULL,
	[ec_created_by] [varchar](50) NULL,
 CONSTRAINT [PK_lb_estado_cuenta] PRIMARY KEY CLUSTERED 
(
	[ec_valor_estado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lb_ops_pro]    Script Date: 5/12/2019 10:08:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lb_ops_pro](
	[opp_codigo] [int] NOT NULL,
	[opp_codpro] [int] NOT NULL,
	[opp_codtp] [int] NOT NULL,
	[opp_descripcion] [varchar](100) NOT NULL,
	[opp_estado] [varchar](50) NOT NULL,
	[opp_created_date] [date] NOT NULL,
	[opp_created_by] [varchar](50) NOT NULL,
 CONSTRAINT [PK_lb_ops_pro] PRIMARY KEY CLUSTERED 
(
	[opp_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lb_producto]    Script Date: 5/12/2019 10:08:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lb_producto](
	[pro_codigo] [int] NOT NULL,
	[pro_nombre] [varchar](50) NOT NULL,
	[pro_created_date] [date] NULL,
	[pro_created_by] [varchar](50) NULL,
 CONSTRAINT [PK_lb_producto] PRIMARY KEY CLUSTERED 
(
	[pro_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lb_saldo_cliente]    Script Date: 5/12/2019 10:08:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lb_saldo_cliente](
	[sc_codcli] [int] NOT NULL,
	[sc_codcta] [int] NOT NULL,
	[sc_codpro] [int] NOT NULL,
	[sc_saldo] [float] NOT NULL,
	[sc_modified_date] [date] NOT NULL,
	[sc_created_date] [date] NOT NULL,
	[sc_created_by] [varchar](50) NOT NULL,
	[sc_modified_by] [varchar](50) NOT NULL,
 CONSTRAINT [PK_lb_saldo_cliente] PRIMARY KEY CLUSTERED 
(
	[sc_codcli] ASC,
	[sc_codcta] ASC,
	[sc_codpro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lb_tipo_operacion]    Script Date: 5/12/2019 10:08:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lb_tipo_operacion](
	[tp_codigo] [int] NOT NULL,
	[tp_operacion] [varchar](50) NOT NULL,
	[tp_nombre] [varchar](50) NULL,
	[tp_created_date] [varchar](50) NULL,
	[tp_created_by] [varchar](50) NULL,
 CONSTRAINT [PK_lb_tipo_operacion] PRIMARY KEY CLUSTERED 
(
	[tp_codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lb_transaccion]    Script Date: 5/12/2019 10:08:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lb_transaccion](
	[tra_codcli] [int] NOT NULL,
	[tra_codpro] [int] NOT NULL,
	[tra_codopp] [int] NOT NULL,
	[tra_fecha_transaccion] [date] NOT NULL,
	[tra_num_autorizacion] [int] NOT NULL,
	[tra_numero] [int] NOT NULL,
	[tra_descripcion] [varchar](200) NULL,
	[tra_created_date] [date] NOT NULL,
	[tra_created_by] [varchar](50) NOT NULL,
	[tra_codben] [int] NULL,
	[tra_monto] [real] NULL,
 CONSTRAINT [PK_lb_transaccion] PRIMARY KEY CLUSTERED 
(
	[tra_numero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  UserDefinedFunction [dbo].[consulta_productos]    Script Date: 5/12/2019 10:08:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[consulta_productos] ()
RETURNS TABLE  
AS  
RETURN   
(  
   select cli.cli_codigo codigo_cliente,cli.cli_nombre nombre,
			cli.cli_apellido apellido,cu.cp_cuenta numero_cuenta,pro.pro_nombre producto
		from dbo.lb_cliente cli
			,dbo.lb_cuenta_producto cu
			,dbo.lb_producto pro
		where cli.cli_codigo = cu.cp_codcli
		and cu.cp_codpro = pro.pro_codigo
); 


GO
/****** Object:  UserDefinedFunction [dbo].[consulta_transaccion]    Script Date: 5/12/2019 10:08:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE FUNCTION [dbo].[consulta_transaccion] ()
RETURNS TABLE  
AS  
RETURN   
(  
   select cli.cli_codigo codigo_cliente,
        cli.cli_nombre nombre,
		cli.cli_apellido apellido,
		pro.pro_nombre Producto,
		aa.opp_descripcion tipo_operacion,
		tra.tra_num_autorizacion num_autorizacion,
		tra.tra_fecha_transaccion fecha_transaccion,
		tra.tra_descripcion descripcion
from dbo.lb_transaccion tra
	,dbo.lb_producto pro
	,dbo.lb_ops_pro aa
	,dbo.lb_cliente cli
where tra.tra_codcli = cli.cli_codigo
and tra.tra_codpro = pro.pro_codigo
and tra.tra_codopp = aa.opp_codigo

); 



GO
ALTER TABLE [dbo].[lb_acceso_cliente]  WITH CHECK ADD  CONSTRAINT [FK_lb_acceso_cliente_lb_cliente] FOREIGN KEY([ac_codcli])
REFERENCES [dbo].[lb_cliente] ([cli_codigo])
GO
ALTER TABLE [dbo].[lb_acceso_cliente] CHECK CONSTRAINT [FK_lb_acceso_cliente_lb_cliente]
GO
ALTER TABLE [dbo].[lb_cliente]  WITH CHECK ADD  CONSTRAINT [FK_lb_cliente_lb_estado_cuenta] FOREIGN KEY([cli_estado])
REFERENCES [dbo].[lb_estado_cuenta] ([ec_valor_estado])
GO
ALTER TABLE [dbo].[lb_cliente] CHECK CONSTRAINT [FK_lb_cliente_lb_estado_cuenta]
GO
ALTER TABLE [dbo].[lb_cliente_beneficiario]  WITH CHECK ADD  CONSTRAINT [FK_lb_cliente_beneficiario_des] FOREIGN KEY([cb_codcli_des])
REFERENCES [dbo].[lb_cliente] ([cli_codigo])
GO
ALTER TABLE [dbo].[lb_cliente_beneficiario] CHECK CONSTRAINT [FK_lb_cliente_beneficiario_des]
GO
ALTER TABLE [dbo].[lb_cliente_beneficiario]  WITH CHECK ADD  CONSTRAINT [FK_lb_cliente_beneficiario_lb_producto] FOREIGN KEY([cb_codpro])
REFERENCES [dbo].[lb_producto] ([pro_codigo])
GO
ALTER TABLE [dbo].[lb_cliente_beneficiario] CHECK CONSTRAINT [FK_lb_cliente_beneficiario_lb_producto]
GO
ALTER TABLE [dbo].[lb_cliente_beneficiario]  WITH CHECK ADD  CONSTRAINT [FK_lb_cliente_beneficiario_ori] FOREIGN KEY([cb_codcli_ori])
REFERENCES [dbo].[lb_cliente] ([cli_codigo])
GO
ALTER TABLE [dbo].[lb_cliente_beneficiario] CHECK CONSTRAINT [FK_lb_cliente_beneficiario_ori]
GO
ALTER TABLE [dbo].[lb_cuenta_producto]  WITH CHECK ADD  CONSTRAINT [FK_lb_cuenta_producto_lb_cliente] FOREIGN KEY([cp_codcli])
REFERENCES [dbo].[lb_cliente] ([cli_codigo])
GO
ALTER TABLE [dbo].[lb_cuenta_producto] CHECK CONSTRAINT [FK_lb_cuenta_producto_lb_cliente]
GO
ALTER TABLE [dbo].[lb_cuenta_producto]  WITH CHECK ADD  CONSTRAINT [FK_lb_cuenta_producto_lb_producto] FOREIGN KEY([cp_codpro])
REFERENCES [dbo].[lb_producto] ([pro_codigo])
GO
ALTER TABLE [dbo].[lb_cuenta_producto] CHECK CONSTRAINT [FK_lb_cuenta_producto_lb_producto]
GO
ALTER TABLE [dbo].[lb_ops_pro]  WITH CHECK ADD  CONSTRAINT [FK_lb_ops_pro_lb_estado_cuenta] FOREIGN KEY([opp_estado])
REFERENCES [dbo].[lb_estado_cuenta] ([ec_valor_estado])
GO
ALTER TABLE [dbo].[lb_ops_pro] CHECK CONSTRAINT [FK_lb_ops_pro_lb_estado_cuenta]
GO
ALTER TABLE [dbo].[lb_ops_pro]  WITH CHECK ADD  CONSTRAINT [FK_lb_ops_pro_lb_producto] FOREIGN KEY([opp_codpro])
REFERENCES [dbo].[lb_producto] ([pro_codigo])
GO
ALTER TABLE [dbo].[lb_ops_pro] CHECK CONSTRAINT [FK_lb_ops_pro_lb_producto]
GO
ALTER TABLE [dbo].[lb_ops_pro]  WITH CHECK ADD  CONSTRAINT [FK_lb_ops_pro_tipo_operacion] FOREIGN KEY([opp_codtp])
REFERENCES [dbo].[lb_tipo_operacion] ([tp_codigo])
GO
ALTER TABLE [dbo].[lb_ops_pro] CHECK CONSTRAINT [FK_lb_ops_pro_tipo_operacion]
GO
ALTER TABLE [dbo].[lb_saldo_cliente]  WITH CHECK ADD  CONSTRAINT [FK_lb_saldo_cliente_lb_cliente] FOREIGN KEY([sc_codcli])
REFERENCES [dbo].[lb_cliente] ([cli_codigo])
GO
ALTER TABLE [dbo].[lb_saldo_cliente] CHECK CONSTRAINT [FK_lb_saldo_cliente_lb_cliente]
GO
ALTER TABLE [dbo].[lb_saldo_cliente]  WITH CHECK ADD  CONSTRAINT [FK_lb_saldo_cliente_lb_cuenta_producto] FOREIGN KEY([sc_codcta])
REFERENCES [dbo].[lb_cuenta_producto] ([cp_cuenta])
GO
ALTER TABLE [dbo].[lb_saldo_cliente] CHECK CONSTRAINT [FK_lb_saldo_cliente_lb_cuenta_producto]
GO
ALTER TABLE [dbo].[lb_saldo_cliente]  WITH CHECK ADD  CONSTRAINT [FK_lb_saldo_cliente_lb_producto] FOREIGN KEY([sc_codpro])
REFERENCES [dbo].[lb_producto] ([pro_codigo])
GO
ALTER TABLE [dbo].[lb_saldo_cliente] CHECK CONSTRAINT [FK_lb_saldo_cliente_lb_producto]
GO
ALTER TABLE [dbo].[lb_transaccion]  WITH CHECK ADD  CONSTRAINT [FK_lb_transaccion_lb_cliente] FOREIGN KEY([tra_codcli])
REFERENCES [dbo].[lb_cliente] ([cli_codigo])
GO
ALTER TABLE [dbo].[lb_transaccion] CHECK CONSTRAINT [FK_lb_transaccion_lb_cliente]
GO
ALTER TABLE [dbo].[lb_transaccion]  WITH CHECK ADD  CONSTRAINT [FK_lb_transaccion_lb_ops_pro] FOREIGN KEY([tra_codopp])
REFERENCES [dbo].[lb_ops_pro] ([opp_codigo])
GO
ALTER TABLE [dbo].[lb_transaccion] CHECK CONSTRAINT [FK_lb_transaccion_lb_ops_pro]
GO
ALTER TABLE [dbo].[lb_transaccion]  WITH CHECK ADD  CONSTRAINT [FK_lb_transaccion_lb_producto] FOREIGN KEY([tra_codpro])
REFERENCES [dbo].[lb_producto] ([pro_codigo])
GO
ALTER TABLE [dbo].[lb_transaccion] CHECK CONSTRAINT [FK_lb_transaccion_lb_producto]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'detalle de cuenta por producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lb_cuenta_producto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'llave de producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lb_ops_pro', @level2type=N'CONSTRAINT',@level2name=N'FK_lb_ops_pro_lb_producto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'llave de tipo de operacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lb_ops_pro', @level2type=N'CONSTRAINT',@level2name=N'FK_lb_ops_pro_tipo_operacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'detalle de cuentas por producto' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lb_producto'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'catalogo de tipos de operacion del banco' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'lb_tipo_operacion'
GO
USE [master]
GO
ALTER DATABASE [lbprod] SET  READ_WRITE 
GO
