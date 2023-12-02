<%-- 
    Document   : GestionarUsuarios
    Created on : 30 nov 2023, 14:04:39
    Author     : jvane
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Gestion de Usuarios</title>
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
        <h1>Gestión de Usuarios</h1>
        <h2>Listado de Usuarios</h2>

        <h1>Conexion: ${mensaje_conexion}</h1>
        
         <!-- AÑADIR OPCION DE NUEVO REGISTRO -->
        <a href="/SistemaWebFarmaceutico?accion=AgregarUsuario">Agregar Usuario</a><br><br>
        
        <table border="1" class="table">
            <thead class="table-dark">
                <tr>
                    <th>IDUsuario</th>
                    <th>IDEmpleado</th>
                    <th>Empleado</th>
                    <th>IDRol</th>
                    <th>Rol</th>
                    <th>Usuario</th>
                    <th>Clave</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaUsuarios}" var="item">
                    <tr>
                        <td><c:out value="${item.ID_Usuario}" /></td>                     
                        <td><c:out value="${item.ID_Empleado}" /></td>                     
                        <td><c:out value="${item.empleado}" /></td>                     
                        <td><c:out value="${item.ID_Rol}" /></td>                  
                        <td><c:out value="${item.nombreRol}" /></td>                     
                        <td><c:out value="${item.usuario}" /></td>                                         
                        <td><c:out value="${item.clave}" /></td>
                        
                        <td>
                            <!-- modificar -->
                            <form method="POST" action="/SistemaWebFarmaceutico/Usuarios/ModificarUsuario.jsp">
                                <input type="hidden" name="ID_Usuario" value="${item.ID_Usuario}" />
                                <input type="hidden" name="ID_Empleado" value="${item.ID_Empleado}" />
                                <input type="hidden" name="ID_Rol" value="${item.ID_Rol}" />
                                <input type="hidden" name="usuario" value="${item.usuario}" />
                                <input type="hidden" name="clave" value="${item.clave}" />
                                <input type="submit" value="Modificar" />
                            </form>
                                
                            <!-- eliminar -->
                            <form method="POST" action="/SistemaWebFarmaceutico/Usuarios/EliminarUsuario.jsp">
                                <input type="hidden" name="ID_Usuario" value="${item.ID_Usuario}" />
                                <input type="hidden" name="empleado" value="${item.empleado}" />
                                <input type="hidden" name="nombreRol" value="${item.nombreRol}" />
                                <input type="hidden" name="usuario" value="${item.usuario}" />
                                <input type="hidden" name="clave" value="${item.clave}" />
                                <input type="submit" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
       
    </body>
</html>
