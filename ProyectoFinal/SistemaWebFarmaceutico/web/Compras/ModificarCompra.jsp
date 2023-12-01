<%-- 
    Document   : ModificarCompra
    Created on : 29 nov 2023, 19:33:07
    Author     : jvane
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Compra</title>
    </head>
    <body>   
        <h1>Modificar empleado</h1>
        <form method="POST" action="/SistemaWebFarmaceutico/ServletPrincipal?accion=ModificarCompra">
            <div>
                <label>ID Compra:</label>
                <input type="text" name="ID_Compra" id="ID_Compra" value="${param.ID_Compra}" readonly /><br>
                <label>Fecha:</label>
                <input type="date" name="fechaCompra" id="fechaCompra" value="${param.fechaCompra}" required /><br>
                <label>Monto:</label>
                <input type="text" name="montoCompra" id="montoCompra" value="${param.montoCompra}" required /><br>
                <label>ID Proveedor:</label>
                <input type="text" name="ID_Proveedor" id="ID_Proveedor" value="${param.ID_Proveedor}" required /><br>
                <label>Cantidad:</label>
                <input type="text" name="cantidadProdCompra" id="cantidadProdCompra" value="${param.cantidadProdCompra}" required /><br>
                <label>ID Medicamento:</label>
                <input type="text" name="ID_Medicamento" id="ID_Medicamento" value="${param.ID_Medicamento}" required /><br><br>
                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar la compra?')" /><br><br> 
            </div>
            <div>
                <a href="/SistemaWebFarmaceutico/?accion=GestionarCompras">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
