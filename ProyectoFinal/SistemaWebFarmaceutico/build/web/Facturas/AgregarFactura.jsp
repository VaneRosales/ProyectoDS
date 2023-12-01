<%-- 
    Document   : AgregarFactura
    Created on : 29 nov 2023, 19:36:03
    Author     : jvane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Factura</title>
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
        <h1>Agregar nuevo Medicamento</h1>

        <form method="POST" action="/SistemaWebFarmaceutico/ServletPrincipal?accion=AgregarMedicamento">
            <div>
                <!-- El ID es autoincrementable -->
                <label>Nombre:</label>
                <input type="text" name="nombreMedicamento" id="nombresEmpleado" required /><br>
                <label>Descripcion:</label>
                <input type="text" name="descripcionMedicamento" id="descripcionMedicamento" required /><br>
                <label>Precio Unitario:</label>
                <input type="text" name="precioUnitario" id="precioUnitario" required /><br>
                <label>Existencia:</label>
                <input type="text" name="existencia" id="existencia" required /><br>
                <label>Fecha de Vencimiento:</label>
                <input type="date" name="fechaVencimiento" id="fechaVencimiento" required /><br><br>
                                      
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar el medicamento?')" /><br><br>
            </div><br>
            <div>
                <a href="/SistemaWebFarmaceutico/?accion=GestionarMedicamentos">Regresar</a>
            </div>            
        </form>
    </body>
</html>
