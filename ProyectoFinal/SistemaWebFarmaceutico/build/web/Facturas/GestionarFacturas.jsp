<%-- 
    Document   : GestionarFacturas
    Created on : 29 nov 2023, 19:35:40
    Author     : jvane
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Gestionar Facturas</title>
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
        <h1>Gestión de Facturas</h1>
        <h2>Listado de Facturas</h2>

        <h1>Conexion: ${mensaje_conexion}</h1>
        
         <!-- AÑADIR OPCION DE NUEVO REGISTRO -->
        <a href="/SistemaWebFarmaceutico?accion=AgregarFactura">Agregar Factura</a><br><br>
        
        <table border="1" >
            <thead >
                <tr>
                    <th>Numero Factura</th>
                    <th>Fecha</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaFacturas}" var="item">
                    <tr>
                       <!--<td><c:out value="${item.ID_Factura}" /></td>  -->                   
                        <td><c:out value="${item.numFact}" /></td>                     
                        <!--<td><c:out value="${item.creditoFiscal}" /></td> -->                    
                        <!--<td><c:out value="${item.iVA}" /></td>-->                  
                        <!--<td><c:out value="${item.montoTotal}" /></td> -->
                        <!--<td><c:out value="${item.ID_Venta}" /></td>-->                  
                        <td><c:out value="${item.fechaVenta}" /></td>
                        <!--<td><c:out value="${item.cliente}" /></td> -->                   
                        <!--<td><c:out value="${item.empleado}" /></td> -->                   
                        <!--<td><c:out value="${item.nombreMedicamento}" /></td>-->
                        <!--<td><c:out value="${item.cantidadProdVenta}" /></td>-->
                        <!--<td><c:out value="${item.precioUnitario}" /></td> -->
                        
                        
                        
                        
                        <td>
                            <button class="open-popup-btn"
                                    onclick="mostrarDetallesFactura(
                                                    '${item.ID_Factura}',
                                                    '${item.numFact}',
                                                    '${item.creditoFiscal}',
                                                    '${item.iVA}',
                                                    '${item.montoTotal}',
                                                    '${item.ID_Venta}',
                                                    '${item.fechaVenta}',
                                                    '${item.cliente}',
                                                    '${item.empleado}',
                                                    '${item.nombreMedicamento}',
                                                    '${item.cantidadProdVenta}',
                                                    '${item.precioUnitario}'
                                                    )">Ver Factura
                                
                            </button>
                                                    
                            <!-- contenedor del pop up -->
                            <div class="overlay" id="overlay"></div>
                            <div class="popup-container" id="popup">
                                <label>ID Factura: <span id="ID_Factura"></span></label><br>
                                <label>Numero Factura: <span id="numFact"></span></label><br>
                                <label>Credito Fiscal: <span id="creditoFiscal"></span></label><br>
                                <label>IVA: <span id="iVA"></span></label><br>
                                <label>Monto Total: <span id="montoTotal"></span></label><br>
                                <label>ID Venta: <span id="ID_Venta"></span></label><br>
                                <label>Fecha: <span id="fechaVenta"></span></label><br>
                                <label>Cliente: <span id="cliente"></span></label><br>
                                <label>Empleado: <span id="empleado"></span></label><br>
                                <label>Medicamento: <span id="nombreMedicamento"></span></label><br>
                                <label>Cantidad: <span id="cantidadProdVenta"></span></label><br>
                                <label>PrecioUnitario: <span id="precioUnitario"></span></label><br><br>
                                <button onclick="abrirPopup()">Cerrar</button>
                            </div>
                            
                            <!-- modificar -->
                            <form method="POST" action="/SistemaWebFarmaceutico/Facturas/ModificarFactura.jsp">
                                <input type="hidden" name="ID_Factura" value="${item.ID_Factura}" />
                                <input type="hidden" name="numFact" value="${item.numFact}" />
                                <input type="hidden" name="creditoFiscal" value="${item.creditoFiscal}" />
                                <input type="hidden" name="iVA" value="${item.iVA}" />
                                <input type="hidden" name="montoTotal" value="${item.montoTotal}" />
                                <input type="hidden" name="ID_Venta" value="${item.ID_Venta}" />
                                
                                <input type="submit" value="Modificar" />
                            </form>
                                
                            <!-- eliminar -->
                            <form method="POST" action="/SistemaWebFarmaceutico/Facturas/EliminarFactura.jsp">
                                <input type="hidden" name="ID_Factura" value="${item.ID_Factura}" />
                                <input type="hidden" name="numFact" value="${item.numFact}" />
                                <input type="hidden" name="creditoFiscal" value="${item.creditoFiscal}" />
                                <input type="hidden" name="iVA" value="${item.iVA}" />
                                <input type="hidden" name="montoTotal" value="${item.montoTotal}" />
                                <input type="hidden" name="fechaVenta" value="${item.fechaVenta}" />
                                <input type="hidden" name="cliente" value="${item.cliente}" />
                                <input type="hidden" name="empleado" value="${item.empleado}" />
                                <input type="hidden" name="nombreMedicamento" value="${item.nombreMedicamento}" />
                                <input type="hidden" name="cantidadProdVenta" value="${item.cantidadProdVenta}" />
                                <input type="submit" value="Eliminar" />
                            </form>
                            
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
        
        
        function mostrarDetallesFactura(ID_Factura, numFact, creditoFiscal, iVA, montoTotal, ID_Venta, fechaVenta, cliente, empleado, nombreMedicamento, cantidadProdVenta, precioUnitario)
        {
            // actualiza los elementos del pop-up con los datos
            document.getElementById('ID_Factura').textContent = ID_Factura;
            document.getElementById('numFact').textContent = numFact;
            document.getElementById('creditoFiscal').textContent = creditoFiscal;
            document.getElementById('iVA').textContent = iVA;
            document.getElementById('montoTotal').textContent = montoTotal;
            document.getElementById('ID_Venta').textContent = ID_Venta;
            document.getElementById('fechaVenta').textContent = fechaVenta;
            document.getElementById('cliente').textContent = cliente;
            document.getElementById('empleado').textContent = empleado;
            document.getElementById('nombreMedicamento').textContent = nombreMedicamento;
            document.getElementById('cantidadProdVenta').textContent = cantidadProdVenta;
            document.getElementById('precioUnitario').textContent = precioUnitario;

            //muestra el pop-up
            abrirPopup();
        }
    </script>
</html>
