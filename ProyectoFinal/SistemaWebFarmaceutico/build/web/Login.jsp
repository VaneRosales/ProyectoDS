<%-- 
    Document   : Login
    Created on : 7 oct 2023, 09:41:59
    Author     : jvane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page import="java.util.Date"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesión</title>
        <style>
        body {
            background-color: #eff5f8;
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }

        h1 {
            color: #009688;
            text-align: center;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #009688;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-bottom: 16px;
            box-sizing: border-box;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #009688;
            color: #ffffff;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background-color: #00796b;
        }

        #resultLogin {
            text-align: center;
            color: #ff0000;
            margin-bottom: 16px;
        }

        .date-container {
            text-align: center;
            margin-bottom: 16px;
        }
    </style>
    </head>
    <body>
        
        <div>
            <form method="POST" action="/SistemaWebFarmaceutico/ServletPrincipal?accion=Login"> 
                <div id="resultLogin"></div>
                
                <h1>Iniciar Sesión</h1>
                <%-- Crear objeto de la clase Date y formatear --%>
                <c:set var="fechaActual" value="<%= new java.util.Date() %>" />
                <c:set var="formatoFecha" value="dd/MM/YYYY" />
                
                <%-- Imprimir fecha --%>
                <div class="date-container">
                    <label>
                        <strong>
                            <c:out value="Fecha: "/>
                            <fmt:formatDate value='${fechaActual}' pattern='${formatoFecha}'/>
                        </strong>
                    </label>
                </div><br>
                <label for="tfUsuario">Usuario:</label>
                <input type="text" id="tfUsuario" name="tfUsuario" required>

                <label for="tfContrasenia">Contraseña:</label>
                <input type="password" id="tfContrasenia" name="tfContrasenia" required>

                <input type="submit" value="Iniciar Sesión">
            </form>
        </div>
    </body>
</html>
