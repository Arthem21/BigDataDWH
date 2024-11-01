USE [DWHNorthwind]
GO
/****** Object:  Schema [DHW]    Script Date: 28/10/2024 16:40:05 ******/
CREATE SCHEMA [DHW]
GO
/****** Object:  Schema [DHW_View]    Script Date: 28/10/2024 16:40:05 ******/
CREATE SCHEMA [DHW_View]
GO
/****** Object:  Table [DHW].[DimCargadores]    Script Date: 28/10/2024 16:40:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DHW].[DimCargadores](
	[DimCargadoresKey] [int] IDENTITY(1,1) NOT NULL,
	[CargadorID] [int] NOT NULL,
	[Cargador] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DimCargadores] PRIMARY KEY CLUSTERED 
(
	[DimCargadoresKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Current]
) ON [Current]
GO
/****** Object:  Table [DHW].[DimClientes]    Script Date: 28/10/2024 16:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DHW].[DimClientes](
	[DimClienteKey] [int] IDENTITY(1,1) NOT NULL,
	[ClienteID] [nchar](10) NOT NULL,
	[Compañia] [nvarchar](50) NOT NULL,
	[Contacto] [nvarchar](50) NULL,
 CONSTRAINT [PK_DimClientes] PRIMARY KEY CLUSTERED 
(
	[DimClienteKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Current]
) ON [Current]
GO
/****** Object:  Table [DHW].[DimEmpleados]    Script Date: 28/10/2024 16:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DHW].[DimEmpleados](
	[DimEmpleadoKey] [int] IDENTITY(1,1) NOT NULL,
	[EmpleadoID] [int] NOT NULL,
	[Nombre] [nvarchar](25) NOT NULL,
	[Apellido] [nvarchar](15) NOT NULL,
	[Titulo] [nvarchar](30) NULL,
 CONSTRAINT [PK_DimEmpleados] PRIMARY KEY CLUSTERED 
(
	[DimEmpleadoKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Current]
) ON [Current]
GO
/****** Object:  Table [DHW].[DimFecha]    Script Date: 28/10/2024 16:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DHW].[DimFecha](
	[DimFechaKey] [int] IDENTITY(1,1) NOT NULL,
	[OrdenFecha] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[NombreFecha] [nvarchar](50) NOT NULL,
	[Año] [int] NOT NULL,
	[Mes] [int] NOT NULL,
	[Dia] [int] NOT NULL,
	[Trimestre] [int] NOT NULL,
	[NombreMes] [nvarchar](50) NOT NULL,
	[NombreDia] [nvarchar](50) NOT NULL,
	[NombreTrimestre] [nvarchar](50) NOT NULL,
	[FormatoCompleto] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_DimFecha] PRIMARY KEY CLUSTERED 
(
	[DimFechaKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Current]
) ON [Current]
GO
/****** Object:  Table [DHW].[DimProductos]    Script Date: 28/10/2024 16:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DHW].[DimProductos](
	[DimProductosKey] [int] IDENTITY(1,1) NOT NULL,
	[CategoriaID] [int] NOT NULL,
	[Categoria] [nvarchar](20) NOT NULL,
	[ProductoID] [int] NOT NULL,
	[Producto] [nvarchar](50) NOT NULL,
	[Cantidad] [smallint] NULL,
	[Precio] [money] NULL,
 CONSTRAINT [PK_DimProductos] PRIMARY KEY CLUSTERED 
(
	[DimProductosKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Current]
) ON [Current]
GO
/****** Object:  Table [DHW].[FactClientesAtendidos]    Script Date: 28/10/2024 16:40:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [DHW].[FactClientesAtendidos](
	[FactClientesAtendidosKey] [int] NOT NULL,
	[EmpleadoID] [int] NULL,
	[ClientesTotales] [smallint] NULL,
 CONSTRAINT [PK_FactClientesAtendidos] PRIMARY KEY CLUSTERED 
(
	[FactClientesAtendidosKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [DHW].[FactOrdenes]    Script Date: 28/10/2024 16:40:06 ******/
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
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_cliente_compañia]    Script Date: 28/10/2024 16:40:06 ******/
CREATE NONCLUSTERED INDEX [idx_cliente_compañia] ON [DHW].[DimClientes]
(
	[Compañia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Current]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_cliente_contacto]    Script Date: 28/10/2024 16:40:06 ******/
CREATE NONCLUSTERED INDEX [idx_cliente_contacto] ON [DHW].[DimClientes]
(
	[Contacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Current]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_Empleado_Apellido]    Script Date: 28/10/2024 16:40:06 ******/
CREATE NONCLUSTERED INDEX [idx_Empleado_Apellido] ON [DHW].[DimEmpleados]
(
	[Apellido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Current]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_Empleado_Nombre]    Script Date: 28/10/2024 16:40:06 ******/
CREATE NONCLUSTERED INDEX [idx_Empleado_Nombre] ON [DHW].[DimEmpleados]
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Current]
GO
/****** Object:  Index [idx_fecha]    Script Date: 28/10/2024 16:40:06 ******/
CREATE NONCLUSTERED INDEX [idx_fecha] ON [DHW].[DimFecha]
(
	[DimFechaKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Current]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_Categoria]    Script Date: 28/10/2024 16:40:06 ******/
CREATE NONCLUSTERED INDEX [idx_Categoria] ON [DHW].[DimProductos]
(
	[Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Current]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_Producto]    Script Date: 28/10/2024 16:40:06 ******/
CREATE NONCLUSTERED INDEX [idx_Producto] ON [DHW].[DimProductos]
(
	[Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Current]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_ciudad]    Script Date: 28/10/2024 16:40:06 ******/
CREATE NONCLUSTERED INDEX [idx_ciudad] ON [DHW].[FactOrdenes]
(
	[Ciudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Current]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_pais]    Script Date: 28/10/2024 16:40:06 ******/
CREATE NONCLUSTERED INDEX [idx_pais] ON [DHW].[FactOrdenes]
(
	[Pais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Current]
GO
/****** Object:  Index [idx_precio]    Script Date: 28/10/2024 16:40:06 ******/
CREATE NONCLUSTERED INDEX [idx_precio] ON [DHW].[FactOrdenes]
(
	[Precio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Current]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [idx_region]    Script Date: 28/10/2024 16:40:06 ******/
CREATE NONCLUSTERED INDEX [idx_region] ON [DHW].[FactOrdenes]
(
	[Region] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Current]
GO
ALTER TABLE [DHW].[FactClientesAtendidos]  WITH CHECK ADD  CONSTRAINT [FK_FactClientesAtendidos_DimEmpleados] FOREIGN KEY([EmpleadoID])
REFERENCES [DHW].[DimEmpleados] ([DimEmpleadoKey])
GO
ALTER TABLE [DHW].[FactClientesAtendidos] CHECK CONSTRAINT [FK_FactClientesAtendidos_DimEmpleados]
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
ALTER TABLE [DHW].[FactOrdenes]  WITH CHECK ADD  CONSTRAINT [FK_FactOrdenes_DimFecha] FOREIGN KEY([FechaPedido])
REFERENCES [DHW].[DimFecha] ([DimFechaKey])
GO
ALTER TABLE [DHW].[FactOrdenes] CHECK CONSTRAINT [FK_FactOrdenes_DimFecha]
GO
ALTER TABLE [DHW].[FactOrdenes]  WITH CHECK ADD  CONSTRAINT [FK_FactOrdenes_DimProductos] FOREIGN KEY([ProductoID])
REFERENCES [DHW].[DimProductos] ([DimProductosKey])
GO
ALTER TABLE [DHW].[FactOrdenes] CHECK CONSTRAINT [FK_FactOrdenes_DimProductos]
GO
