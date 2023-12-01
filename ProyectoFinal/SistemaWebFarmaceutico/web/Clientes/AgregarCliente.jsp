<%-- 
    Document   : AgregarCliente
    Created on : 28 nov 2023, 20:24:47
    Author     : jvane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Cliente</title>
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
        <h1>Agregar nuevo cliente</h1>

        <form method="POST" action="/SistemaWebFarmaceutico/ServletPrincipal?accion=AgregarCliente">
            <div>
                <!-- El ID de los empleados es autoincrementable -->
                <label>Nombres:</label>
                <input type="text" name="nombresCliente" id="nombresCliente" required /><br>
                <label>Apellidos:</label>
                <input type="text" name="apellidosCliente" id="apellidosCliente" required /><br>
                <label>DUI:</label>
                <input type="text" name="dUI" id="dUI" required /><br>
                <label>Teléfono:</label>
                <input type="text" name="telefonoCliente" id="telefonoCliente" required /><br>
                <label>Email:</label>
                <input type="email" name="email" id="email" required /><br>
                <label>ID Direccion:</label>
                <input type="text" name="ID_Direccion" id="ID_Direccion" required /><br><br>
                                            
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar el cliente?')" /><br><br>
            </div><br>
            <div>
                <a href="/SistemaWebFarmaceutico/?accion=GestionarClientes">Regresar</a>
            </div>            
        </form>
    </body>
</html>
