<%-- 
    Document   : GestionarVentas
    Created on : 29 nov 2023, 19:33:45
    Author     : jvane
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Gestion de Ventas</title>
        
        <style>
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
           
        </style>
        
    </head>
    <body>
        <h1>Gestión de Ventas</h1>
        <h2>Listado de Ventas</h2>

        <h1>Conexion: ${mensaje_conexion}</h1>
        
         <!-- AÑADIR OPCION DE NUEVO REGISTRO -->
        <a href="/SistemaWebFarmaceutico?accion=AgregarVenta">Agregar Venta</a><br><br>
        
        <table border="1">
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Monto</th>
                    <th>Cliente</th>
                    <th>Medicamento</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaVentas}" var="item">
                    <tr>
                       <!-- <td><c:out value="${item.ID_Venta}" /></td>  -->                   
                        <td><c:out value="${item.fechaVenta}" /></td>                     
                        <td><c:out value="${item.montoVenta}" /></td>                     
                        <!--<td><c:out value="${item.ID_Cliente}" /></td>-->                  
                        <td><c:out value="${item.cliente}" /></td>
                        <!--<td><c:out value="${item.ID_Empleado}" /></td>-->                  
                        <!--<td><c:out value="${item.empleado}" /></td>-->
                        <!--<td><c:out value="${item.ID_Medicamento}" /></td> -->                   
                        <td><c:out value="${item.nombreMedicamento}" /></td>
                        <!--<td><c:out value="${item.cantidadProdVenta}" /></td>-->
                        <!--<td><c:out value="${item.precioUnitario}" /></td> -->
                        
                        
                        
                        
                        <td>
                            <button class="open-popup-btn"
                                    onclick="mostrarDetallesVenta(
                                                    '${item.ID_Venta}',
                                                    '${item.fechaVenta}',
                                                    '${item.montoVenta}',
                                                    '${item.ID_Cliente}',
                                                    '${item.cliente}',
                                                    '${item.ID_Empleado}',
                                                    '${item.empleado}',
                                                    '${item.ID_Medicamento}',
                                                    '${item.nombreMedicamento}',
                                                    '${item.cantidadProdVenta}',
                                                    '${item.precioUnitario}'
                                                    )">Ver detalles
                                
                            </button>
                                                    
                            <!-- contenedor del pop up -->
                            <div class="overlay" id="overlay"></div>
                            <div class="popup-container" id="popup">
                                <label>ID Venta: <span id="ID_Venta"></span></label><br>
                                <label>Fecha: <span id="fechaVenta"></span></label><br>
                                <label>Monto: <span id="montoVenta"></span></label><br>
                                <label>ID Cliente: <span id="ID_Cliente"></span></label><br>
                                <label>Cliente: <span id="cliente"></span></label><br>
                                <label>ID Empleado: <span id="ID_Empleado"></span></label><br>
                                <label>Empleado: <span id="empleado"></span></label><br>
                                <label>ID Medicamento: <span id="ID_Medicamento"></span></label><br>
                                <label>Medicamento: <span id="nombreMedicamento"></span></label><br>
                                <label>Cantidad: <span id="cantidadProdVenta"></span></label><br>
                                <label>PrecioUnitario: <span id="precioUnitario"></span></label><br><br>
                                <button onclick="abrirPopup()">Cerrar</button>
                            </div>
                            
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
       
    </body>
    <script>
        
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
        
        
        function mostrarDetallesVenta(ID_Venta, fechaVenta, montoVenta, ID_Cliente, cliente, ID_Empleado, empleado, ID_Medicamento, nombreMedicamento, cantidadProdVenta, precioUnitario)
        {
            // actualiza los elementos del pop-up con los datos
            document.getElementById('ID_Venta').textContent = ID_Venta;
            document.getElementById('fechaVenta').textContent = fechaVenta;
            document.getElementById('montoVenta').textContent = montoVenta;
            document.getElementById('ID_Cliente').textContent = ID_Cliente;
            document.getElementById('cliente').textContent = cliente;
            document.getElementById('ID_Empleado').textContent = ID_Empleado;
            document.getElementById('empleado').textContent = empleado;
            document.getElementById('ID_Medicamento').textContent = ID_Medicamento;
            document.getElementById('nombreMedicamento').textContent = nombreMedicamento;
            document.getElementById('cantidadProdVenta').textContent = cantidadProdVenta;
            document.getElementById('precioUnitario').textContent = precioUnitario;

            //muestra el pop-up
            abrirPopup();
        }
    </script>
</html>
