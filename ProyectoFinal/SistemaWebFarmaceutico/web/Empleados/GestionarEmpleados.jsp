<%-- 
    Document   : GestionarEmpleados
    Created on : 14 oct 2023, 10:16:14
    Author     : jvane
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestionar Empleados</title>
        
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
           /* Estilo para el contenedor del pop-up */
           .popup-container {
               display: none;
               position: fixed;
               top: 50%;
               left: 50%;
               transform: translate(-50%, -50%);
               padding: 20px;
               background-color: #f0f0f0;
               border: 1px solid #ccc;
               z-index: 1;
           }
           
           /* Estilo para el fondo oscuro*/
           .overlay{
               display: none;
               position: fixed;
               top: 0;
               left: 0;
               width: 100%;
               height: 100%;
               background-color: rgba(0, 0 ,0 , 0.5);
               z-index: 0;
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
        <h1>Gestión de Empleados</h1>
        <h2>Listado de Empleados</h2>

        <h1>Conexion: ${mensaje_conexion}</h1>
        
         <!-- AÑADIR OPCION DE NUEVO REGISTRO -->
        <a href="/SistemaWebFarmaceutico?accion=AgregarEmpleado">Agregar empleado</a><br><br>
        
        <table>
            <thead >
                <tr>
                    <th>Nombres</th>
                    <th>Apellidos</th>
                    <th>DUI</th>
                    <th>Cargo</th>
                    
                    <!-- AÑADIR COLUMNA DE ACCIONES-->
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaEmpleados}" var="item">
                    <tr>
                        <!--<td><c:out value="${item.ID_Empleado}" /></td>  -->                      
                        <td><c:out value="${item.nombresEmpleado}" /></td>
                        <td><c:out value="${item.apellidosEmpleado}" /></td>
                        <td><c:out value="${item.DUI_Empleado}" /></td>
                        <!-- <td><c:out value="${item.ISSS_Empleado}" /></td> -->
                        <!--<td><c:out value="${item.fechaNacEmpleado}" /></td> -->
                        <!--<td><c:out value="${item.telefonoEmpleado}" /></td> -->
                        <!--<td><c:out value="${item.email}" /></td> -->  
                        <!-- <td><c:out value="${item.ID_Cargo}" /></td> -->
                        <td><c:out value="${item.cargo}" /></td>
                        <!--<td><c:out value="${item.ID_Direccion}" /></td> -->
                        <!--<td><c:out value="${item.direccionCompleta}" /></td> -->
                        
                        
                        <!-- AÑADIR OPCIONES DE MODIFICACION Y ELIMINACION -->
                        <td>
                            <button class="open-popup-btn"
                                    onclick="mostrarDetallesEmpleado(
                                                    '${item.ID_Empleado}',
                                                    '${item.nombresEmpleado}',
                                                    '${item.apellidosEmpleado}',
                                                    '${item.DUI_Empleado}',
                                                    '${item.ISSS_Empleado}',
                                                    '${item.fechaNacEmpleado}',
                                                    '${item.telefonoEmpleado}',
                                                    '${item.email}',
                                                    '${item.cargo}',
                                                    '${item.direccionCompleta}'
                                                    )">Ver detalles
                                
                            </button>
                                                    
                            <!-- contenedor del pop up -->
                            <div class="overlay" id="overlay"></div>
                            <div class="popup-container" id="popup">
                                <label>ID Empleado: <span id="ID_Empleado"></span></label><br>
                                <label>Nombres: <span id="nombresEmpleado"></span></label><br>
                                <label>Apellidos: <span id="apellidosEmpleado"></span></label><br>
                                <label>DUI: <span id="DUI_Empleado"></span></label><br>
                                <label>ISSS: <span id="ISSS_Empleado"></span></label><br>
                                <label>Fecha de Nacimiento: <span id="fechaNacEmpleado"></span></label><br>
                                <label>Telefono: <span id="telefonoEmpleado"></span></label><br>
                                <label>Email: <span id="email"></span></label><br>
                                <label>Cargo: <span id="cargo"></span></label><br>
                                <label>Direccion: <span id="direccionCompleta"></span></label><br><br>
                                <button onclick="abrirPopup()">Cerrar</button>
                            </div>
                            
                            <!-- modificar -->
                            <form method="POST" action="/SistemaWebFarmaceutico/Empleados/ModificarEmpleado.jsp">
                                <input type="hidden" name="ID_Empleado" value="${item.ID_Empleado}" />
                                <input type="hidden" name="nombresEmpleado" value="${item.nombresEmpleado}" />
                                <input type="hidden" name="apellidosEmpleado" value="${item.apellidosEmpleado}" />
                                <input type="hidden" name="DUI_Empleado" value="${item.DUI_Empleado}" />
                                <input type="hidden" name="ISSS_Empleado" value="${item.ISSS_Empleado}" />
                                <input type="hidden" name="fechaNacEmpleado" value="${item.fechaNacEmpleado}" />
                                <input type="hidden" name="telefonoEmpleado" value="${item.telefonoEmpleado}" />
                                <input type="hidden" name="email" value="${item.email}" />
                                <input type="hidden" name="ID_Direccion" value="${item.ID_Direccion}" />
                                <input type="hidden" name="ID_Cargo" value="${item.ID_Cargo}" />
                                <input type="submit" value="Modificar" />
                            </form>
                                
                            <!-- eliminar -->
                            <form method="POST" action="/SistemaWebFarmaceutico/Empleados/EliminarEmpleado.jsp">
                                <input type="hidden" name="ID_Empleado" value="${item.ID_Empleado}" />
                                <input type="hidden" name="nombresEmpleado" value="${item.nombresEmpleado}" />
                                <input type="hidden" name="apellidosEmpleado" value="${item.apellidosEmpleado}" />
                                <input type="hidden" name="DUI_Empleado" value="${item.DUI_Empleado}" />
                                <input type="hidden" name="ISSS_Empleado" value="${item.ISSS_Empleado}" />
                                <input type="hidden" name="fechaNacEmpleado" value="${item.fechaNacEmpleado}" />
                                <input type="hidden" name="telefonoEmpleado" value="${item.telefonoEmpleado}" />
                                <input type="hidden" name="email" value="${item.email}" />
                                <input type="hidden" name="cargo" value="${item.cargo}" />
                                <input type="hidden" name="direccionCompleta" value="${item.direccionCompleta}" />
                                <input type="submit" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
        <button onclick="regresar()">Regresar</button>
    </body>
    <script>
        function regresar(){
            window.history.back();
        }
        
        function abrirPopup()
        {
            var popup = document.getElementById('popup');
            var overlay = document.getElementById('overlay');
            
            if(popup.style.display === 'block'){
                popup.style.display = 'none';
                overlay.style.display = 'none';
            } else {
                popup.style.display = 'block';
                overlay.style.display = 'block';
            }
        }
        
        
        function mostrarDetallesEmpleado(ID_Empleado, nombresEmpleado, apellidosEmpleado, DUI_Empleado, ISSS_Empleado, fechaNacEmpleado, telefonoEmpleado, email, cargo, direccionCompleta)
        {
            // actualiza los elementos del pop-up con los datos del empleado
            document.getElementById('ID_Empleado').textContent = ID_Empleado;
            document.getElementById('nombresEmpleado').textContent = nombresEmpleado;
            document.getElementById('apellidosEmpleado').textContent = apellidosEmpleado;
            document.getElementById('DUI_Empleado').textContent = DUI_Empleado;
            document.getElementById('ISSS_Empleado').textContent = ISSS_Empleado;
            document.getElementById('fechaNacEmpleado').textContent = fechaNacEmpleado;
            document.getElementById('telefonoEmpleado').textContent = telefonoEmpleado;
            document.getElementById('email').textContent = email;
            document.getElementById('cargo').textContent = cargo;
            document.getElementById('direccionCompleta').textContent = direccionCompleta;

            //muestra el pop-up
            abrirPopup();
        }
    </script>
</html>
