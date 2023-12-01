<%-- 
    Document   : EliminarCliente
    Created on : 28 nov 2023, 20:25:15
    Author     : jvane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Cliente</title>
    </head>
    <body>
        <h1>Eliminar Cliente</h1>

        <form method="POST" action="/SistemaWebFarmaceutico/ServletPrincipal?accion=EliminarCliente">
            <div>
                <label>ID Cliente: ${param.ID_Cliente}</label><br>
                <label>Nombres: ${param.nombresCliente}</label><br>
                <label>Apellidos: ${param.apellidosCliente}</label><br>
                <label>DUI: ${param.dUI}</label><br>
                <label>Teléfono: ${param.telefonoEmpleado}</label><br>
                <label>Email: ${param.email}</label><br>
                <label>Dirección: ${param.direccionCompleta}</label><br>
                
                  
                <input type="hidden" name="ID_Cliente" id="ID_Cliente" value="${param.ID_Cliente}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el cliente?')" /><br><br>
            </div>
            <div>
                <a href="/SistemaWebFarmaceutico/?accion=GestionarClientes">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
