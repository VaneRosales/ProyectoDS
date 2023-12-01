<%-- 
    Document   : GestionarCompras
    Created on : 29 nov 2023, 19:32:34
    Author     : jvane
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion de Compras</title>
        
    </head>
    <body>
        <h1>Gestión de Compras</h1>
        <h2>Listado de Compras</h2>

        <h1>Conexion: ${mensaje_conexion}</h1>
        
         <!-- AÑADIR OPCION DE NUEVO REGISTRO -->
        <a href="/SistemaWebFarmaceutico?accion=AgregarCompra">Agregar Compra</a><br><br>
        
        <table border="1">
            <thead>
                <tr>
                    <th>IDCompra</th>
                    <th>Fecha</th>
                    <th>Monto</th>
                    <th>Proveedor</th>
                    <th>Cantidad</th>
                    <th>Medicamento</th>
                    
                    <!-- AÑADIR COLUMNA DE ACCIONES-->
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaCompras}" var="item">
                    <tr>
                        <td><c:out value="${item.ID_Compra}" /></td>                     
                        <td><c:out value="${item.fechaCompra}" /></td>                     
                        <td><c:out value="${item.montoCompra}" /></td>                     
                        <!--<td><c:out value="${item.ID_Proveedor}" /></td>-->                   
                        <td><c:out value="${item.nombreProveedor}" /></td>                     
                        <td><c:out value="${item.cantidadProdCompra}" /></td>                     
                        <!--<td><c:out value="${item.ID_Medicamento}" /></td>-->                     
                        <td><c:out value="${item.nombreMedicamento}" /></td> 
                        
                        <td>
                            <!-- modificar -->
                            <form method="POST" action="/SistemaWebFarmaceutico/ModificarCompra.jsp">
                                <input type="hidden" name="ID_Compra" value="${item.ID_Compra}" />
                                <input type="hidden" name="fechaCompra" value="${item.fechaCompra}" />
                                <input type="hidden" name="montoCompra" value="${item.montoCompra}" />
                                <input type="hidden" name="ID_Proveedor" value="${item.ID_Proveedor}" />
                                <input type="hidden" name="cantidadProdCompra" value="${item.cantidadProdCompra}" />
                                <input type="hidden" name="ID_Medicamento" value="${item.ID_Medicamento}" />
                                <input type="submit" value="Modificar" />
                            </form>
                                
                            <!-- eliminar -->
                            <form method="POST" action="/SistemaWebFarmaceutico/Eliminar.jsp">
                                <input type="hidden" name="ID_Compra" value="${item.ID_Compra}" />
                                <input type="hidden" name="fechaCompra" value="${item.fechaCompra}" />
                                <input type="hidden" name="montoCompra" value="${item.montoCompra}" />
                                <input type="hidden" name="nombreProveedor" value="${item.nombreProveedor}" />
                                <input type="hidden" name="cantidadProdCompra" value="${item.cantidadProdCompra}" />
                                <input type="hidden" name="nombreMedicamento" value="${item.nombreMedicamento}" />
                                <input type="submit" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
       
    </body>
   
</html>
