<%-- 
    Document   : GestionarProveedores
    Created on : 28 nov 2023, 21:08:26
    Author     : jvane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Proveedores</title>
    </head>
    <body>
        <h1>Gestión de Proveedores</h1>
        <h2>Listado de Proveedores</h2>

        <h1>Conexion: ${mensaje_conexion}</h1>
        
         <!-- AÑADIR OPCION DE NUEVO REGISTRO -->
        <a href="/SistemaWebFarmaceutico?accion=AgregarProveedor">Agregar Proveedores</a><br><br>
        
        <table border="1">
            <thead>
                <tr>
                    <th>ID Proveedor</th>
                    <th>Nombre</th>
                    <th>Telefono</th>
                    <th>Email</th>
                    <th>ID Direccion</th>
                    <th>Direccion</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaProveedores}" var="item">
                    <tr>
                        <td><c:out value="${item.ID_Proveedor}" /></td>                     
                        <td><c:out value="${item.nombreProveedor}" /></td>
                        <td><c:out value="${item.telefonoProveedor}" /></td>
                        <td><c:out value="${item.email}" /></td>
                        <td><c:out value="${item.ID_Direccion}" /></td> 
                        <td><c:out value="${item.direccionCompleta}" /></td> 
                        <td>
                            <!-- modificar -->
                            <form method="POST" action="/SistemaWebFarmaceutico/ModificarProveedor.jsp">
                                <input type="hidden" name="ID_Proveedor" value="${item.ID_Proveedor}" />
                                <input type="hidden" name="nombreProveedor" value="${item.nombreProveedor}" />
                                <input type="hidden" name="telefonoProveedor" value="${item.telefonoProveedor}" />
                                <input type="hidden" name="email" value="${item.email}" />
                                <input type="hidden" name="ID_Direccion" value="${item.ID_Direccion}" />
                                <input type="submit" value="Modificar" />
                            </form>
                                
                            <!-- eliminar -->
                            <form method="POST" action="/SistemaWebFarmaceutico/EliminarProveedor.jsp">
                                <input type="hidden" name="ID_Proveedor" value="${item.ID_Proveedor}" />
                                <input type="hidden" name="nombreProveedor" value="${item.nombreProveedor}" />
                                <input type="hidden" name="telefonoProveedor" value="${item.telefonoProveedor}" />
                                <input type="hidden" name="email" value="${item.email}" />
                                <input type="hidden" name="direccionCompleta" value="${item.direccionCompleta}" />
                                <input type="submit" value="Eliminar" />
                            </form>
                        </td>

                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
</html>
