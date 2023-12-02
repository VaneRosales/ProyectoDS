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
        <h1>Gestión de Clientes</h1>
        <h2>Listado de Clientes</h2>

        <h1>Conexion: ${mensaje_conexion}</h1>
        
         <!-- AÑADIR OPCION DE NUEVO REGISTRO -->
        <a href="/SistemaWebFarmaceutico?accion=AgregarCliente">Agregar Cliente</a><br><br>
  
        <table border="1" class="table">
            <thead class="table-dark">
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
                            <form method="POST" action="/SistemaWebFarmaceutico/Clientes/ModificarCliente.jsp">
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
                            <form method="POST" action="/SistemaWebFarmaceutico/Clientes/EliminarCliente.jsp">
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
