<%-- 
    Document   : ModificarUsuario
    Created on : 1 dic 2023, 12:43:46
    Author     : jvane
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP update</title>
    </head>
    <body>
        <h1>Modificar Usuario</h1>
        <form method="POST" action="/SistemaWebFarmaceutico/ServletPrincipal?accion=ModificarUsuario">
            <div>
                <label>ID Usuario:</label>
                <input type="text" name="ID_Usuario" id="ID_Usuario" value="${param.ID_Usuario}" readonly /><br>
                <label>ID Empleado:</label>
                <input type="text" name="ID_Empleado" id="ID_Empleado" value="${param.ID_Empleado}" required /><br>
                <label>ID Rol:</label>
                <input type="text" name="ID_Rol" id="ID_Rol" value="${param.ID_Rol}" required /><br>
                <label>usuario:</label>
                <input type="text" name="usuario" id="usuario" value="${param.usuario}" required /><br>
                <label>clave:</label>
                <input type="text" name="clave" id="clave" value="${param.clave}" required /><br><br>
                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el usuario?')" /><br><br> 
            </div>
            <div>
                <a href="/SistemaWebFarmaceutico/?accion=GestionarUsuarios">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
