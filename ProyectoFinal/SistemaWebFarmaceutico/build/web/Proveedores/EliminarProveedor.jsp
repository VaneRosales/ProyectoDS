<%-- 
    Document   : EliminarProveedor
    Created on : 28 nov 2023, 21:10:25
    Author     : jvane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Proveedor</title>
    </head>
    <body>
        <h1>Eliminar Proveedor</h1>

        <form method="POST" action="/SistemaWebFarmaceutico/ServletPrincipal?accion=EliminarProveedor">
            <div>
                <label>ID Proveedor: ${param.ID_Proveedor}</label><br>
                <label>Nombre: ${param.nombreProveedor}</label><br>
                <label>Teléfono: ${param.telefonoProveedor}</label><br>
                <label>Email: ${param.email}</label><br>
                <label>Dirección: ${param.direccionCompleta}</label><br>
                
                  
                <input type="hidden" name="ID_Proveedor" id="ID_Proveedor" value="${param.ID_Proveedor}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el proveedor?')" /><br><br>
            </div>
            <div>
                <a href="/SistemaWebFarmaceutico/?accion=GestionarProveedores">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
