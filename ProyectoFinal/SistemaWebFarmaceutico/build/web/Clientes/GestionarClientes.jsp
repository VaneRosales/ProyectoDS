<%-- 
    Document   : GestionarClientes
    Created on : 28 nov 2023, 20:24:30
    Author     : jvane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Clientes</title>
         
    </head>
    <body>
        <h1>Gestión de Clientes</h1>
        <h2>Listado de Clientes</h2>

        <h1>Conexion: ${mensaje_conexion}</h1>
        
         <!-- AÑADIR OPCION DE NUEVO REGISTRO -->
        <a href="/SistemaWebFarmaceutico?accion=AgregarCliente">Agregar Cliente</a><br><br>
        
        <table border="1">
            <thead>
                <tr>
                    <th>ID Cliente</th>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>DUI</th>
                    <th>Telefono</th>
                    <th>Email</th>
                    <th>Direccion</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaClientes}" var="item">
                    <tr>
                        <td><c:out value="${item.ID_Cliente}" /></td>                     
                        <td><c:out value="${item.nombresCliente}" /></td>
                        <td><c:out value="${item.apellidosCliente}" /></td>
                        <td><c:out value="${item.dUI}" /></td>
                        <td><c:out value="${item.telefonoCliente}" /></td>
                        <td><c:out value="${item.email}" /></td>
                        <!--<td><c:out value="${item.ID_Direccion}" /></td> -->
                        <td><c:out value="${item.direccionCompleta}" /></td>
                        
                        <td>
                            <!-- modificar -->
                            <form method="POST" action="/SistemaWebFarmaceutico/ModificarCliente.jsp">
                                <input type="hidden" name="ID_Cliente" value="${item.ID_Cliente}" />
                                <input type="hidden" name="nombresCliente" value="${item.nombresCliente}" />
                                <input type="hidden" name="apellidosCliente" value="${item.apellidosCliente}" />
                                <input type="hidden" name="dUI" value="${item.dUI}" />
                                <input type="hidden" name="telefonoCliente" value="${item.telefonoCliente}" />
                                <input type="hidden" name="email" value="${item.email}" />
                                <input type="hidden" name="ID_Direccion" value="${item.ID_Direccion}" />
                                <input type="submit" value="Modificar" />
                            </form>
                                
                            <!-- eliminar -->
                            <form method="POST" action="/SistemaWebFarmaceutico/EliminarCliente.jsp">
                                <input type="hidden" name="ID_Cliente" value="${item.ID_Cliente}" />
                                <input type="hidden" name="nombresCliente" value="${item.nombresCliente}" />
                                <input type="hidden" name="apellidosCliente" value="${item.apellidosCliente}" />
                                <input type="hidden" name="dUI" value="${item.dUI}" />
                                <input type="hidden" name="telefonoCliente" value="${item.telefonoCliente}" />
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
