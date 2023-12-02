<%-- 
    Document   : EliminarUsuario
    Created on : 1 dic 2023, 12:50:14
    Author     : jvane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>delete</title>
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
            color: #d9534f;
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            display: block;
            margin-bottom: 8px;
            color: #d9534f;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 16px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #d9534f;
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #c9302c;
        }

        a {
            text-decoration: none;
            color: #d9534f;
            font-weight: bold;
            margin-top: 20px;
        }

        a:hover {
            text-decoration: underline;
        }
        </style>
    </head>
    <body>
        <h1>Eliminar Usuario</h1>

        <form method="POST" action="/SistemaWebFarmaceutico/ServletPrincipal?accion=EliminarUsuario">
            <div>
                <label>ID Usuario: ${param.ID_Usuario}</label><br>
                <label>empleado: ${param.empleado}</label><br>
                <label>nombreRol: ${param.nombreRol}</label><br>
                <label>usuario: ${param.usuario}</label><br>
                <label>clave: ${param.clave}</label><br>
                
                  
                <input type="hidden" name="ID_Usuario" id="ID_Usuario" value="${param.ID_Usuario}" /><br><br>
                <input type="submit" value="Eliminar" onclick="return confirm('¿Desea eliminar el Usuario?')" /><br><br>
            </div>
            <div>
                <a href="/SistemaWebFarmaceutico/?accion=GestionarUsuarios">Regresar</a><br><br>
            </div>             
        </form>
    </body>
</html>
