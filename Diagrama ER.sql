USE [DWHNorthwind]
GO

/****** Object:  Table [DHW].[FactOrdenes]    Script Date: 27/10/2024 22:12:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [DHW].[FactOrdenes](
	[FactOrdenesKey] [int] IDENTITY(1,1) NOT NULL,
	[OrdenID] [int] NOT NULL,
	[ClienteID] [int] NOT NULL,
	[ProductoID] [int] NOT NULL,
	[EmpleadoID] [int] NOT NULL,
	[FechaPedido] [int] NOT NULL,
	[Cargador] [int] NOT NULL,
	[Ciudad] [nvarchar](20) NOT NULL,
	[Pais] [nvarchar](20) NOT NULL,
	[Region] [nvarchar](20) NOT NULL,
	[Precio] [money] NOT NULL,
	[Cantidad] [smallint] NOT NULL,
 CONSTRAINT [PK_FactOrdenes] PRIMARY KEY CLUSTERED 
(
	[FactOrdenesKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Current]
) ON [Current]
GO

ALTER TABLE [DHW].[FactOrdenes]  WITH CHECK ADD  CONSTRAINT [FK_FactOrdenes_DimCargadores] FOREIGN KEY([Cargador])
REFERENCES [DHW].[DimCargadores] ([DimCargadoresKey])
GO

ALTER TABLE [DHW].[FactOrdenes] CHECK CONSTRAINT [FK_FactOrdenes_DimCargadores]
GO

ALTER TABLE [DHW].[FactOrdenes]  WITH CHECK ADD  CONSTRAINT [FK_FactOrdenes_DimClientes] FOREIGN KEY([ClienteID])
REFERENCES [DHW].[DimClientes] ([DimClienteKey])
GO

ALTER TABLE [DHW].[FactOrdenes] CHECK CONSTRAINT [FK_FactOrdenes_DimClientes]
GO

ALTER TABLE [DHW].[FactOrdenes]  WITH CHECK ADD  CONSTRAINT [FK_FactOrdenes_DimEmpleados] FOREIGN KEY([FactOrdenesKey])
REFERENCES [DHW].[DimEmpleados] ([DimEmpleadoKey])
GO

ALTER TABLE [DHW].[FactOrdenes] CHECK CONSTRAINT [FK_FactOrdenes_DimEmpleados]
GO


