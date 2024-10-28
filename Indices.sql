

create index idx_fecha on DHW.DimFecha(DimFechaKey);

create index idx_region on DHW.FactOrdenes(Region);

create index idx_ciudad on DHW.FactOrdenes(Ciudad);

create index idx_precio on DHW.FactOrdenes(Precio);

create index idx_pais on DHW.FactOrdenes(Pais);

create index idx_Empleado_Nombre on DHW.DimEmpleados(Nombre);

create index idx_Empleado_Apellido on DHW.DimEmpleados(Apellido);

create index idx_Producto on DHW.DimProductos(Producto);

create index idx_Categoria on DHW.DimProductos(Categoria);

create index idx_cliente_compañia on DHW.DimClientes(Compañia);

create index idx_cliente_contacto on DHW.DimClientes(Contacto);

Execute sp_helpindex 'DHW.DimFecha'

Execute sp_helpindex 'DHW.FactOrdenes'

Execute sp_helpindex 'DHW.DimClientes'

Execute sp_helpindex 'DHW.DimEmpleados'

Execute sp_helpindex 'DHW.DimProductos'

