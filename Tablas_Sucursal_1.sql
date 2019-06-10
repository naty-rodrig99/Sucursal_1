create database Sucursal_1
go

use Sucursal_1
go

CREATE TABLE [dbo].[Sucursal](
	[idSucursal] [int] IDENTITY(1,1) NOT NULL,
	[ubicacion] [geometry] NULL,
	[pais] [varchar](30) NULL,
	[horaEntrada] [time](4) NULL,
	[horaSalida] [time](4) NULL,
 CONSTRAINT [PK_Sucursal] PRIMARY KEY CLUSTERED 
(
	[idSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO


CREATE TABLE [dbo].[Empleado](
	[idEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](30) NULL,
	[apellido1] [varchar](30) NULL,
	[apellido2] [varchar](30) NULL,
 CONSTRAINT [PK_Empleado] PRIMARY KEY CLUSTERED 
(
	[idEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[TipoPago](
	[idTipoPago] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](20) NULL,
 CONSTRAINT [PK_TipoPago] PRIMARY KEY CLUSTERED 
(
	[idTipoPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[Venta](
	[idVenta] [int] IDENTITY(1,1) NOT NULL,
	[fecha] [date] NULL,
	[monto] [money] NULL,
	[idTipoPago] [int] NULL,
 CONSTRAINT [PK_Venta] PRIMARY KEY CLUSTERED 
(
	[idVenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Venta]  WITH CHECK ADD  CONSTRAINT [FK_Venta_TipoPago] FOREIGN KEY([idTipoPago])
REFERENCES [dbo].[TipoPago] ([idTipoPago])
GO

ALTER TABLE [dbo].[Venta] CHECK CONSTRAINT [FK_Venta_TipoPago]
GO



CREATE TABLE [dbo].[Factura](
	[idFactura] [int] IDENTITY(1,1) NOT NULL,
	[descuento] [float] NULL,
 CONSTRAINT [PK_Factura] PRIMARY KEY CLUSTERED 
(
	[idFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[Pago](
	[idPago] [int] IDENTITY(1,1) NOT NULL,
	[monto] [money] NULL,
	[fecha] [date] NULL,
 CONSTRAINT [PK_Pago] PRIMARY KEY CLUSTERED 
(
	[idPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[Financiamiento](
	[idFinanciamiento] [int] IDENTITY(1,1) NOT NULL,
	[tasaInteres] [float] NULL,
	[plazo] [int] NULL,
 CONSTRAINT [PK_Financiamiento] PRIMARY KEY CLUSTERED 
(
	[idFinanciamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[AutoxSucxVentaxCli](
	[idAutoxSucxVentaXCli] [int] IDENTITY(1,1) NOT NULL,
	[idVentaxCliente] [int] NULL,
	[idAutomovilxSucursal] [int] NULL,
 CONSTRAINT [PK_AutoxSucxVentaxCli] PRIMARY KEY CLUSTERED 
(
	[idAutoxSucxVentaXCli] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[Detalle](
	[idDetalle] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[idAutoxSucxVentaxCli] [int] NULL,
 CONSTRAINT [PK_Detalle] PRIMARY KEY CLUSTERED 
(
	[idDetalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Detalle]  WITH CHECK ADD  CONSTRAINT [FK_Detalle_AutoxSucxVentaxCli] FOREIGN KEY([idAutoxSucxVentaxCli])
REFERENCES [dbo].[AutoxSucxVentaxCli] ([idAutoxSucxVentaXCli])
GO

ALTER TABLE [dbo].[Detalle] CHECK CONSTRAINT [FK_Detalle_AutoxSucxVentaxCli]
GO




CREATE TABLE [dbo].[AutomovilxSucursal](
	[idAutomovilxSucursal] [int] IDENTITY(1,1) NOT NULL,
	[idSucursal] [int] NULL,
	[idAutomovil] [int] NULL,
	[estado] [bit] NULL,
 CONSTRAINT [PK_AutomovilxSucursal] PRIMARY KEY CLUSTERED 
(
	[idAutomovilxSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[AutomovilxSucursal]  WITH CHECK ADD  CONSTRAINT [FK_AutomovilxSucursal_Sucursal] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO

ALTER TABLE [dbo].[AutomovilxSucursal] CHECK CONSTRAINT [FK_AutomovilxSucursal_Sucursal]
GO



CREATE TABLE [dbo].[EmpleadoxSucursal](
	[idEmpleadoxSucursal] [int] IDENTITY(1,1) NOT NULL,
	[idEmpleado] [int] NULL,
	[idSucursal] [int] NULL,
	[fechaContratacion] [date] NULL,
 CONSTRAINT [PK_EmpleadoxSucursal] PRIMARY KEY CLUSTERED 
(
	[idEmpleadoxSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[EmpleadoxSucursal]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoxSucursal_Empleado] FOREIGN KEY([idEmpleado])
REFERENCES [dbo].[Empleado] ([idEmpleado])
GO

ALTER TABLE [dbo].[EmpleadoxSucursal] CHECK CONSTRAINT [FK_EmpleadoxSucursal_Empleado]
GO

ALTER TABLE [dbo].[EmpleadoxSucursal]  WITH CHECK ADD  CONSTRAINT [FK_EmpleadoxSucursal_Sucursal] FOREIGN KEY([idSucursal])
REFERENCES [dbo].[Sucursal] ([idSucursal])
GO

ALTER TABLE [dbo].[EmpleadoxSucursal] CHECK CONSTRAINT [FK_EmpleadoxSucursal_Sucursal]
GO



CREATE TABLE [dbo].[VentaxCliente](
	[idVentaxCliente] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NULL,
	[idVenta] [int] NULL,
 CONSTRAINT [PK_VentaxCliente] PRIMARY KEY CLUSTERED 
(
	[idVentaxCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[VentaxCliente]  WITH CHECK ADD  CONSTRAINT [FK_VentaxCliente_Venta] FOREIGN KEY([idVenta])
REFERENCES [dbo].[Venta] ([idVenta])
GO

ALTER TABLE [dbo].[VentaxCliente] CHECK CONSTRAINT [FK_VentaxCliente_Venta]
GO



CREATE TABLE [dbo].[DetallexFactura](
	[idDetallexFactura] [int] IDENTITY(1,1) NOT NULL,
	[idFactura] [int] NULL,
	[idDetalle] [int] NULL,
 CONSTRAINT [PK_DetallexFactura] PRIMARY KEY CLUSTERED 
(
	[idDetallexFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[DetallexFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetallexFactura_Detalle] FOREIGN KEY([idDetalle])
REFERENCES [dbo].[Detalle] ([idDetalle])
GO

ALTER TABLE [dbo].[DetallexFactura] CHECK CONSTRAINT [FK_DetallexFactura_Detalle]
GO

ALTER TABLE [dbo].[DetallexFactura]  WITH CHECK ADD  CONSTRAINT [FK_DetallexFactura_Factura] FOREIGN KEY([idFactura])
REFERENCES [dbo].[Factura] ([idFactura])
GO

ALTER TABLE [dbo].[DetallexFactura] CHECK CONSTRAINT [FK_DetallexFactura_Factura]
GO




CREATE TABLE [dbo].[ClientexFinanciamiento](
	[idClientexFinanciamiento] [int] IDENTITY(1,1) NOT NULL,
	[idCliente] [int] NULL,
	[idFinanciamiento] [int] NULL,
 CONSTRAINT [PK_ClientexFinanciamiento] PRIMARY KEY CLUSTERED 
(
	[idClientexFinanciamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[ClientexFinanciamiento]  WITH CHECK ADD  CONSTRAINT [FK_ClientexFinanciamiento_Financiamiento] FOREIGN KEY([idFinanciamiento])
REFERENCES [dbo].[Financiamiento] ([idFinanciamiento])
GO

ALTER TABLE [dbo].[ClientexFinanciamiento] CHECK CONSTRAINT [FK_ClientexFinanciamiento_Financiamiento]
GO




CREATE TABLE [dbo].[PagoxClientexFinanciamiento](
	[idPagoxClientexFinanciamiento] [int] IDENTITY(1,1) NOT NULL,
	[idPago] [int] NULL,
	[idClientexFinanciamiento] [int] NULL,
 CONSTRAINT [PK_PagoxClientexFinanciamiento] PRIMARY KEY CLUSTERED 
(
	[idPagoxClientexFinanciamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[PagoxClientexFinanciamiento]  WITH CHECK ADD  CONSTRAINT [FK_PagoxClientexFinanciamiento_ClientexFinanciamiento] FOREIGN KEY([idClientexFinanciamiento])
REFERENCES [dbo].[ClientexFinanciamiento] ([idClientexFinanciamiento])
GO

ALTER TABLE [dbo].[PagoxClientexFinanciamiento] CHECK CONSTRAINT [FK_PagoxClientexFinanciamiento_ClientexFinanciamiento]
GO

ALTER TABLE [dbo].[PagoxClientexFinanciamiento]  WITH CHECK ADD  CONSTRAINT [FK_PagoxClientexFinanciamiento_Pago] FOREIGN KEY([idPago])
REFERENCES [dbo].[Pago] ([idPago])
GO

ALTER TABLE [dbo].[PagoxClientexFinanciamiento] CHECK CONSTRAINT [FK_PagoxClientexFinanciamiento_Pago]
GO


