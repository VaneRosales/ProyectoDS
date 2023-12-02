<%-- 
    Document   : AgregarEmpleado
    Created on : 4 nov 2023, 08:04:56
    Author     : jvane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Agregar Empleado</title>
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

            form {
                width: 100%;
                max-width: 400px;
                background-color: #ffffff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
                margin: 20px 0;
            }

            h1 {
                color: #009688;
                text-align: center;
                margin-bottom: 20px;
            }

            label {
                display: block;
                margin-bottom: 8px;
                color: #009688;
            }

            input {
                width: 100%;
                padding: 10px;
                margin-bottom: 16px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
            }

            input[type="date"] {
                padding: 10px;
            }

            input[type="submit"] {
                background-color: #009688;
                color: #fff;
                padding: 12px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-size: 16px;
            }

            input[type="submit"]:hover {
                background-color: #00796b;
            }

            a {
                text-decoration: none;
                color: #009688;
                font-weight: bold;
            }

            a:hover {
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <c:if test="${exito!=null}">
            <c:if test="${exito}">
                <p><strong style="color: darkgreen;">La información se guardó correctamente</strong></p>
            </c:if>
            <c:if test="${!exito}">
                <p><strong style="color: red;">No se guardó la información</strong></p>
            </c:if>
        </c:if>   
        <h1>Agregar nuevo empleado</h1>

        <form method="POST" action="/SistemaWebFarmaceutico/ServletPrincipal?accion=AgregarEmpleado">
            <div>
                <!-- El ID de los empleados es autoincrementable -->
                <label>Nombres:</label>
                <input type="text" name="nombresEmpleado" id="nombresEmpleado" required /><br>
                <label>Apellidos:</label>
                <input type="text" name="apellidosEmpleado" id="apellidosEmpleado" required /><br>
                <label>DUI:</label>
                <input type="text" name="DUI_Empleado" id="DUI_Empleado" required /><br>
                <label>Número de afiliado ISSS:</label>
                <input type="text" name="ISSS_Empleado" id="ISSS_Empleado" required /><br>
                <label>Fecha de nacimiento:</label>
                <input type="date" name="fechaNacEmpleado" id="fechaNacEmpleado" required /><br>
                <label>Teléfono:</label>
                <input type="text" name="telefonoEmpleado" id="telefonoEmpleado" required /><br>
                <label>Email:</label>
                <input type="email" name="email" id="email" required /><br>
                <label>ID Direccion:</label>
                <input type="text" name="ID_Direccion" id="ID_Direccion" required /><br>
                <label>ID Cargo:</label>
                <input type="text" name="ID_Cargo" id="ID_Cargo" required /><br><br>                            
                <input type="submit" value="Registrar" onclick="return confirm('¿Desea registrar el empleado?')" /><br><br>
            </div><br>
            <div>
                <a href="/SistemaWebFarmaceutico/?accion=GestionarEmpleados">Regresar</a>
            </div>            
        </form>
    </body>
</html>
