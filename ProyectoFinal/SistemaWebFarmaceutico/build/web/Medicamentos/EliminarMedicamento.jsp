<%-- 
    Document   : EliminarMedicamento
    Created on : 28 nov 2023, 16:38:38
    Author     : jvane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminar Medicamento</title>
    </head>
    <body>
        <h1>Eliminar Medicamento</h1>

        <form method="POST" action="/SistemaWebFarmaceutico/ServletPrincipal?accion=EliminarMedicamento">
            <div>
                <label>ID Medicamento: ${param.ID_Medicamento}</label><br>
                <label>Nombre: ${param.nombreMedicamento}</label><br>
                <label>Descripcion: ${param.descripcionMedicamento}</label><br>
                <label>Precio Unitario: ${param.precioUnitario}</label><br>
                <label>Existencia: ${param.existencia}</label><br>
                <label>Fecha de vencimiento: ${param.fechaVencimiento}</label><br>
    
                <input type="hidden" name="ID_Medicamento" id="ID_Medicamento" value="${param.ID_Medicamento}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el medicamento?')" /><br><br>
            </div>
            <div>
                <a href="/SistemaWebFarmaceutico/?accion=GestionarMedicamentos">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
