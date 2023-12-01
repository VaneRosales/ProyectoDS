<%-- 
    Document   : AgregarCompra
    Created on : 29 nov 2023, 19:32:53
    Author     : jvane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Compra</title>
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
        <h1>Agregar nueva compra</h1>

        <form method="POST" action="/SistemaWebFarmaceutico/ServletPrincipal?accion=AgregarCompra">
            <div>
                <!-- El ID es autoincrementable -->
                
                <label>Fecha de compra:</label>
                <input type="date" name="fechaCompra" id="fechaCompra" required /><br>
                <label>Monto:</label>
                <input type="text" name="montoCompra" id="montoCompra" required /><br>
                <label>ID Proveedor:</label>
                <input type="text" name="ID_Proveedor" id="ID_Proveedor" required /><br>
                <label>cantidadProdCompra:</label>
                <input type="text" name="cantidadProdCompra" id="cantidadProdCompra" required /><br>
                <label>ID Medicamento:</label>
                <input type="text" name="ID_Medicamento" id="ID_Medicamento" required /><br><br>
                                      
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar la compra?')" /><br><br>
            </div><br>
            <div>
                <a href="/SistemaWebFarmaceutico/?accion=GestionarCompras">Regresar</a>
            </div>            
        </form>
    </body>
</html>
