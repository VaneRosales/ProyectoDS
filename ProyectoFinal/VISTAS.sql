use Farmacia;

-- VISTA DIRECCIONES COMPLETAS
create view VistaDireccionCompleta as
select
	DIR.ID_Direccion,
	DIR.Linea1,
	DIR.Linea2,
	DIS.Distrito,
	MUN.Municipio,
	DEP.Departamento,
	DEP.Pais,
	DIR.CodigoPostal

from Direcciones DIR
inner join Distritos DIS on DIR.ID_Distrito=DIS.ID_Distrito
inner join Municipios MUN on DIS.ID_Municipio=MUN.ID_Municipio
inner join Departamentos DEP on MUN.ID_Departamento=DEP.ID_Departamento;

select * from VistaDireccionCompleta;

-- VISTA EMPLEADOS-DIRECCIONES-CARGOS
create view VistaEmpleados as
select
	EMP.ID_Empleado,
	EMP.NombresEmpleado,
	EMP.ApellidosEmpleado,
	EMP.DUI_Empleado,
	EMP.ISSS_Empleado,
	EMP.FechaNacEmpleado,
	EMP.TelefonoEmpleado,
	EMP.Email,
	EMP.ID_Cargo,
	CAR.Cargo,
	EMP.ID_Direccion,
	concat(DIR.Linea1 ,', '+DIR.Linea2,', ',
	DIR.Distrito,', ',DIR.Municipio,', ',
	DIR.Departamento,', ',DIR.Pais,', ',
	cast(DIR.CodigoPostal as char(5))) as DireccionCompleta
	
from Empleados EMP
inner join Cargos CAR on EMP.ID_Cargo=CAR.ID_Cargo
inner join VistaDireccionCompleta DIR on EMP.ID_Direccion=DIR.ID_Direccion;

select * from VistaEmpleados;
drop view VistaEmpleados; -- <--PARA BORRAR VISTA


-- VISTA PARA CLIENTE-DIRECCIONES
create view VistaClientes as
select
	CLI.ID_Cliente,
	CLI.NombresCliente,
	CLI.ApellidosCliente,
	CLI.DUI,
	CLI.TelefonoCliente,
	CLI.Email,
	CLI.ID_Direccion,
	concat(DIR.Linea1 ,', '+DIR.Linea2,', ',
	DIR.Distrito,', ',DIR.Municipio,', ',
	DIR.Departamento,', ',DIR.Pais,', ',
	cast(DIR.CodigoPostal as char(5))) as DireccionCompleta
	
from Clientes CLI
inner join VistaDireccionCompleta DIR on CLI.ID_Direccion=DIR.ID_Direccion;

select * from VistaClientes;

-- VISTA PARA PROVEEDORES-DIRECCIONES
create view VistaProveedores as
select
	PRO.ID_Proveedor,
	PRO.NombreProveedor,
	PRO.TelefonoProveedor,
	PRO.email,
	PRO.ID_Direccion,
	concat(DIR.Linea1 ,', '+DIR.Linea2,', ',
	DIR.Distrito,', ',DIR.Municipio,', ',
	DIR.Departamento,', ',DIR.Pais,', ',
	cast(DIR.CodigoPostal as char(5))) as DireccionCompleta
	
from Proveedores PRO
inner join VistaDireccionCompleta DIR on PRO.ID_Direccion=DIR.ID_Direccion;

select * from VistaProveedores;

-- VISTA PARA DETALLESCOMPRAS-MEDICAMENTOS
create view VistaDetalleCompras as
select
	DET.ID_DetalleCompra,
	DET.CantidadProdCompra,
	DET.ID_Medicamento,
	MED.NombreMedicamento,
	DET.ID_Compra
	
from Detalle_Compras DET
inner join Medicamentos MED on DET.ID_Medicamento=MED.ID_Medicamento;

select * from VistaDetalleCompras;

-- VISTA PARA COMPRAS-DETALLESCOMPRAS-PROVEEDORES
create view VistaCompras as
select
	COM.ID_Compra,
	COM.FechaCompra,
	COM.MontoCompra,
	PRO.ID_Proveedor,
	PRO.NombreProveedor,
	DET.CantidadProdCompra,
	DET.ID_Medicamento,
	DET.NombreMedicamento

from Compras COM
inner join Proveedores PRO on COM.ID_Proveedor=PRO.ID_Proveedor
inner join VistaDetalleCompras DET on COM.ID_Compra=DET.ID_Compra

select * from VistaCompras;

-- VISTA PARA DETALLESCOMPRAS-MEDICAMENTOS
create view VistaDetalleVentas as
select
	DET.ID_DetalleVenta,
	DET.CantidadProdVenta,
	DET.ID_Medicamento,
	MED.NombreMedicamento,
	MED.PrecioUnitario,
	DET.ID_Venta

from Detalle_Ventas DET
inner join Medicamentos MED on DET.ID_Medicamento=MED.ID_Medicamento;

select * from VistaDetalleVentas;
drop view VistaDetalleVentas;

-- VISTA PARA VENTA-CLIENTES-EMPLEADOS-DETALLESVENTA
create view VistaVentas as
select
	VEN.ID_Venta,
	VEN.FechaVenta,
	VEN.MontoVenta,
	VEN.ID_Cliente,
	concat(CLI.NombresCliente,' ',CLI.ApellidosCliente) as Cliente,
	VEN.ID_Empleado,
	concat(EMP.NombresEmpleado, ' - ',EMP.Cargo) as Empleado,
	DET.ID_Medicamento,
	DET.NombreMedicamento,
	DET.CantidadProdVenta,
	DET.PrecioUnitario

from Ventas VEN
inner join Clientes CLI on VEN.ID_Cliente=CLI.ID_Cliente
inner join VistaEmpleados EMP on VEN.ID_Empleado=EMP.ID_Empleado
inner join VistaDetalleVentas DET on DET.ID_Venta=VEN.ID_Venta;

select * from VistaVentas;
drop view VistaVentas;

create view VistaFactura as
select
	FAC.ID_Factura,
	FAC.NumFact,
	FAC.CreditoFiscal,
	FAC.IVA,
	FAC.MontoTotal,
	FAC.ID_Venta,
	VEN.FechaVenta,
	VEN.Cliente,
	VEN.Empleado,
	VEN.NombreMedicamento,
	VEN.CantidadProdVenta,
	VEN.PrecioUnitario
from Facturas FAC
inner join VistaVentas VEN on FAC.ID_Venta=VEN.ID_Venta;

select * from VistaFactura;

-- VISTA USUARIO-ROL-EMPLEADO
use Farmacia;
SELECT * FROM Usuarios;

create view VistaUsuarios as
select
	USU.ID_Usuario,
	USU.ID_Empleado,
	concat(EMP.NombresEmpleado,' ',EMP.ApellidosEmpleado) as Empleado,
	USU.ID_Rol,
	ROL.NombreRol,
	USU.Usuario,
	USU.Clave
from Usuarios USU
inner join Empleados EMP on USU.ID_Empleado=EMP.ID_Empleado
inner join Roles ROL on USU.ID_Rol=ROL.ID_Rol;

select * from VistaUsuarios;