<%-- 
    Document   : AgregarUsuario
    Created on : 1 dic 2023, 12:40:15
    Author     : jvane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>add user</title>
    </head>
    <body>
        <c:if test="${exito!=null}">
            <c:if test="${exito}">
                <p><strong style="color: darkgreen;">La información se guardó correctamente</strong></p>
            </c:if>
            <c:if test="${!exito}">
                <p><strong style="color: red;">No se guardó la información</strong></p>
            </c:if>
        </c:if>   
        <h1>Agregar nuevo usuario</h1>

        <form method="POST" action="/SistemaWebFarmaceutico/ServletPrincipal?accion=AgregarUsuario">
            <div>
                <!-- El ID de los empleados es autoincrementable -->
                <label>ID Empleado:</label>
                <input type="text" name="ID_Empleado" id="ID_Empleado" required /><br>
                <label>ID rol:</label>
                <input type="text" name="ID_Rol" id="ID_Rol" required /><br>
                <label>usuario:</label>
                <input type="text" name="usuario" id="usuario" required /><br>
                <label>clave:</label>
                <input type="text" name="clave" id="clave" required /><br><br>
                                            
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar el usuario?')" /><br><br>
            </div><br>
            <div>
                <a href="/SistemaWebFarmaceutico/?accion=GestionarUsuarios">Regresar</a>
            </div>            
        </form>
    </body>
</html>
