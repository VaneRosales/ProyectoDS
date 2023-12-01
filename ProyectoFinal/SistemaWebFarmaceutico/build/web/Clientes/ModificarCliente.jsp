<%-- 
    Document   : ModificarCliente
    Created on : 28 nov 2023, 20:24:58
    Author     : jvane
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Cliente</title>
    </head>
    <body>
        <h1>Modificar Cliente</h1>
        <form method="POST" action="/SistemaWebFarmaceutico/ServletPrincipal?accion=ModificarCliente">
            <div>
                <label>ID Cliente:</label>
                <input type="text" name="ID_Cliente" id="ID_Cliente" value="${param.ID_Cliente}" readonly /><br>
                <label>Nombres:</label>
                <input type="text" name="nombresCliente" id="nombresCliente" value="${param.nombresCliente}" required /><br>
                <label>Apellidos:</label>
                <input type="text" name="apellidosCliente" id="apellidosCliente" value="${param.apellidosCliente}" required /><br>
                <label>DUI:</label>
                <input type="text" name="dUI" id="dUI" value="${param.dUI}" required /><br>
                <label>Teléfono:</label>
                <input type="text" name="telefonoCliente" id="telefonoCliente" value="${param.telefonoCliente}" required /><br>
                <label>Email:</label>
                <input type="email" name="email" id="email" value="${param.email}" required /><br>
                <label>ID Dirección:</label>
                <input type="text" name="ID_Direccion" id="ID_Direccion" value="${param.ID_Direccion}" required /><br><br>
                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el cliente?')" /><br><br> 
            </div>
            <div>
                <a href="/SistemaWebFarmaceutico/?accion=GestionarClientes">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
