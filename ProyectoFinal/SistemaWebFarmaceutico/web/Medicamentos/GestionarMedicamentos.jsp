<%-- 
    Document   : GestionarMedicamentos
    Created on : 28 nov 2023, 16:37:46
    Author     : jvane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Gestionar Medicamentos</title>
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
        <h1>Gestión de Medicamentos</h1>
        <h2>Listado de Medicamentos</h2>

        <h1>Conexion: ${mensaje_conexion}</h1>
        
         <!-- AÑADIR OPCION DE NUEVO REGISTRO -->
        <a href="/SistemaWebFarmaceutico?accion=AgregarMedicamento">Agregar Medicamento</a><br><br>
        
        <table border="1" class="table">
            <thead class="table-dark">
                <tr>
                    <th>ID Medicamento</th>
                    <th>Nombre</th>
                    <th>Descripcion</th>
                    <th>Precio Unitario</th>
                    <th>Existencia</th>
                    <th>Vencimiento</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${listaMedicamentos}" var="item">
                    <tr>
                        <td><c:out value="${item.ID_Medicamento}" /></td>                      
                        <td><c:out value="${item.nombreMedicamento}" /></td>
                        <td><c:out value="${item.descripcionMedicamento}" /></td>
                        <td><c:out value="${item.precioUnitario}" /></td>
                        <td><c:out value="${item.existencia}" /></td>
                        <td><c:out value="${item.fechaVencimiento}" /></td>
                        
                        <td>
                            <!-- modificar -->
                            <form method="POST" action="/SistemaWebFarmaceutico/Medicamentos/ModificarMedicamento.jsp">
                                <input type="hidden" name="ID_Medicamento" value="${item.ID_Medicamento}" />
                                <input type="hidden" name="nombreMedicamento" value="${item.nombreMedicamento}" />
                                <input type="hidden" name="descripcionMedicamento" value="${item.descripcionMedicamento}" />
                                <input type="hidden" name="precioUnitario" value="${item.precioUnitario}" />
                                <input type="hidden" name="existencia" value="${item.existencia}" />
                                <input type="hidden" name="fechaVencimiento" value="${item.fechaVencimiento}" />
                                <input type="submit" value="Modificar" />
                            </form>
                                
                            <!-- eliminar -->
                            <form method="POST" action="/SistemaWebFarmaceutico/Medicamentos/EliminarMedicamento.jsp">
                                 <input type="hidden" name="ID_Medicamento" value="${item.ID_Medicamento}" />
                                <input type="hidden" name="nombreMedicamento" value="${item.nombreMedicamento}" />
                                <input type="hidden" name="descripcionMedicamento" value="${item.descripcionMedicamento}" />
                                <input type="hidden" name="precioUnitario" value="${item.precioUnitario}" />
                                <input type="hidden" name="existencia" value="${item.existencia}" />
                                <input type="hidden" name="fechaVencimiento" value="${item.fechaVencimiento}" />
                                <input type="submit" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>            
        </table>
    </body>
</html>
