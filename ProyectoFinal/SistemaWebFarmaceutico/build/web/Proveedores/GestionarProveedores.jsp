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
        <style>
            
            body {
            background-color: #eff5f8;
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            padding: 20px;
            margin: 0;
            }

            h1, h2, h3 {
                color: #009688;
                text-align: center;
                margin-bottom: 20px;
            }

            a {
                text-decoration: none;
                display: inline-block;
                padding: 8px 16px;
                background-color: #4CAF50; /* Verde */
                color: #fff;
                text-decoration: none;
                border-radius: 4px;
                transition: background-color 0.3s ease;
            }
            a:hover{
                background-color: #45a049;
            }
  

            table {
                width: 100%;
                border-collapse: collapse;
                margin-bottom: 20px;
            }

            th, td {
                border: 1px solid #009688;
                padding: 8px;
                text-align: center;
            }

            th {
                background-color: #009688;
                color: #fff;
            }
           
           button,
            input {
                background-color: #009688;
                color: #fff;
                padding: 8px 16px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-right: 10px;
                margin: 5px
            }

            button:hover,
            input:hover {
                background-color: #00796b;
            }
           
        </style>
    </head>
    <body>
        <h1>Gestión de Proveedores</h1>
        <h2>Listado de Proveedores</h2>

        <h1>Conexion: ${mensaje_conexion}</h1>
        
         <!-- AÑADIR OPCION DE NUEVO REGISTRO -->
        <a href="/SistemaWebFarmaceutico?accion=AgregarProveedor">Agregar Proveedores</a><br><br>
        
        <table border="1" >
            <thead >
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
                            <form method="POST" action="/SistemaWebFarmaceutico/Proveedores/ModificarProveedor.jsp">
                                <input type="hidden" name="ID_Proveedor" value="${item.ID_Proveedor}" />
                                <input type="hidden" name="nombreProveedor" value="${item.nombreProveedor}" />
                                <input type="hidden" name="telefonoProveedor" value="${item.telefonoProveedor}" />
                                <input type="hidden" name="email" value="${item.email}" />
                                <input type="hidden" name="ID_Direccion" value="${item.ID_Direccion}" />
                                <input type="submit" value="Modificar" />
                            </form>
                                
                            <!-- eliminar -->
                            <form method="POST" action="/SistemaWebFarmaceutico/Proveedores/EliminarProveedor.jsp">
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
