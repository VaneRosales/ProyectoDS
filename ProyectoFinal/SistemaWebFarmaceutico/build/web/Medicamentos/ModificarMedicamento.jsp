<%-- 
    Document   : ModificarMedicamento
    Created on : 28 nov 2023, 16:38:50
    Author     : jvane
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Medicamentos</title>
    </head>
    <body>
        <h1>Modificar Medicamento</h1>
        <form method="POST" action="/SistemaWebFarmaceutico/ServletPrincipal?accion=ModificarMedicamento">
            <div>
                <label>ID Medicamento:</label>
                <input type="text" name="ID_Medicamento" id="ID_Medicamento" value="${param.ID_Medicamento}" readonly /><br>
                <label>Nombre:</label>
                <input type="text" name="nombreMedicamento" id="nombreMedicamento" value="${param.nombreMedicamento}" required /><br>
                <label>Descripcion:</label>
                <input type="text" name="descripcionMedicamento" id="descripcionMedicamento" value="${param.descripcionMedicamento}" required /><br>
                <label>Precio Unitario:</label>
                <input type="text" name="precioUnitario" id="precioUnitario" value="${param.precioUnitario}" required /><br>
                <label>Existencia:</label>
                <input type="text" name="existencia" id="existencia" value="${param.existencia}" required /><br>
                <label>Fecha de vencimiento:</label>
                <input type="date" name="fechaVencimiento" id="fechaVencimiento" value="${param.fechaVencimiento}" required /><br><br>       
                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el empleado?')" /><br><br> 
            </div>
            <div>
                <a href="/SistemaWebFarmaceutico/?accion=GestionarMedicamentos">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
