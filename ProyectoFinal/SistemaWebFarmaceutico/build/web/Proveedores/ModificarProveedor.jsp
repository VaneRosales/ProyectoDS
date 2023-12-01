<%-- 
    Document   : ModificarProveedor
    Created on : 28 nov 2023, 21:10:09
    Author     : jvane
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Proveedor</title>
    </head>
    <body>
        <h1>Modificar Proveedor</h1>
        <form method="POST" action="/SistemaWebFarmaceutico/ServletPrincipal?accion=ModificarProveedor">
            <div>
                <label>ID Proveedor:</label>
                <input type="text" name="ID_Proveedor" id="ID_Proveedor" value="${param.ID_Proveedor}" readonly /><br>
                <label>Nombre:</label>
                <input type="text" name="nombreProveedor" id="nombreProveedor" value="${param.nombreProveedor}" required /><br>
                <label>Teléfono:</label>
                <input type="text" name="telefonoEmpleado" id="telefonoEmpleado" value="${param.telefonoEmpleado}" required /><br>
                <label>Email:</label>
                <input type="email" name="email" id="email" value="${param.email}" required /><br>
                <label>ID Dirección:</label>
                <input type="text" name="ID_Direccion" id="ID_Direccion" value="${param.ID_Direccion}" required /><br><br>
                
                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el proveedor?')" /><br><br> 
            </div>
            <div>
                <a href="/SistemaWebFarmaceutico/?accion=GestionarProveedores">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
