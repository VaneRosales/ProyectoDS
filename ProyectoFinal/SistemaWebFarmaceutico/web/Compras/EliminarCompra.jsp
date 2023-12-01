<%-- 
    Document   : EliminarCompra
    Created on : 29 nov 2023, 19:33:22
    Author     : jvane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Compra</title>
    </head>
    <body>
        <h1>Eliminar Compra</h1>

        <form method="POST" action="/SistemaWebFarmaceutico/ServletPrincipal?accion=EliminarCompra">
            <div>
                <label>ID Compra: ${param.ID_Compra}</label><br>
                <label>Fecha: ${param.fechaCompra}</label><br>
                <label>Monto: ${param.fechaCompra}</label><br>
                <label>Proveedor: ${param.nombreProveedor}</label><br>
                <label>Cantidad: ${param.cantidadProdCompra}</label><br>
                <label>Medicamento: ${param.nombreMedicamento}</label><br>
                  
                <input type="hidden" name="ID_Compra" id="ID_Compra" value="${param.ID_Compra}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar la compra?')" /><br><br>
            </div>
            <div>
                <a href="/SistemaWebFarmaceutico/?accion=GestionarCompras">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
