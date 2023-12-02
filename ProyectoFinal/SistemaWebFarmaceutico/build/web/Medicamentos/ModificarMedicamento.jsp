<%-- 
    Document   : ModificarMedicamento
    Created on : 28 nov 2023, 16:38:50
    Author     : jvane
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Modificar Medicamentos</title>
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
            margin-top: 20px;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
    </head>
    <body>
        <h1>Modificar Medicamento</h1>
        <form method="POST" action="/SistemaWebFarmaceutico/ServletPrincipal?accion=ModificarMedicamento">
            <div>
                <label>ID Medicamento:</label>
                <input type="text" name="ID_Medicamento" id="ID_Medicamento" value="${param.ID_Medicamento}" readonly /><br>
                <label>Nombre:</label>
                <input type="text" name="nombreMedicamento" id="nombreMedicamento" value="${param.nombreMedicamento}" required /><br>
                <label>Descripcion:</label>
                <input type="text" name="descripcionMedicamento" id="descripcionMedicamento" value="${param.descripcionMedicamento}" required /><br>
                <label>Precio Unitario:</label>
                <input type="text" name="precioUnitario" id="precioUnitario" value="${param.precioUnitario}" required /><br>
                <label>Existencia:</label>
                <input type="text" name="existencia" id="existencia" value="${param.existencia}" required /><br>
                <label>Fecha de vencimiento:</label>
                <input type="date" name="fechaVencimiento" id="fechaVencimiento" value="${param.fechaVencimiento}" required /><br><br>       
                <input type="submit" value="Modificar" onclick="return confirm('¿Desea modificar el empleado?')" /><br><br> 
            </div>
            <div>
                <a href="/SistemaWebFarmaceutico/?accion=GestionarMedicamentos">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
