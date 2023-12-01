<%-- 
    Document   : EliminarUsuario
    Created on : 1 dic 2023, 12:50:14
    Author     : jvane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>delete</title>
    </head>
    <body>
        <h1>Eliminar Usuario</h1>

        <form method="POST" action="/SistemaWebFarmaceutico/ServletPrincipal?accion=EliminarUsuario">
            <div>
                <label>ID Usuario: ${param.ID_Usuario}</label><br>
                <label>empleado: ${param.empleado}</label><br>
                <label>nombreRol: ${param.nombreRol}</label><br>
                <label>usuario: ${param.usuario}</label><br>
                <label>clave: ${param.clave}</label><br>
                <label>Email: ${param.email}</label><br>
                  
                <input type="hidden" name="ID_Usuario" id="ID_Usuario" value="${param.ID_Usuario}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el Usuario?')" /><br><br>
            </div>
            <div>
                <a href="/SistemaWebFarmaceutico/?accion=GestionarUsuarios">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
