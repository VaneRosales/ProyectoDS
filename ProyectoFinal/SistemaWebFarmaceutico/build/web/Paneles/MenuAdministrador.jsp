<%-- 
    Document   : MenuAdministrador
    Created on : 7 oct 2023, 10:26:49
    Author     : jvane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
        <style>
            body {
                background-color: #eff5f8;
                font-family: Arial, sans-serif;
                display: flex;
                align-items: center;
                justify-content: center;
                height: 100vh;
                margin: 0;
            }

            .menu {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
            }
            nav{
               text-decoration: none; 
            }
            
            li {
                list-style: none;
                text-decoration: none;
                padding: 0;
                margin: 0;
            }
           .link {
                text-decoration: none;
                color: #009688;
                font-weight: bold;
                display: block;
            }

            .link:hover {
                color: #00796b;
            }
       

           
        </style>
    </head>
    <body>
        <nav class="menu">
                <ul>
                    <li><a class="link" href="/SistemaWebFarmaceutico">Inicio Sistema de Farmacia</a></li>
                    <li><a class="link" href="/SistemaWebFarmaceutico?accion=Login">Login</a></li>
                    <li><a class="link" href="/SistemaWebFarmaceutico?accion=GestionarEmpleados">Gestion de Empleados</a></li>
                    <li><a class="link" href="/SistemaWebFarmaceutico?accion=GestionarMedicamentos">Gestion de Medicamentos</a></li>
                    <li><a class="link" href="/SistemaWebFarmaceutico?accion=GestionarClientes">Gestion de Clientes</a></li>
                    <li><a class="link" href="/SistemaWebFarmaceutico?accion=GestionarProveedores">Gestion de Proveedores</a></li>
                    <li><a class="link" href="/SistemaWebFarmaceutico?accion=GestionarFacturas">Gestion de Facturas</a></li>
                    <li><a class="link" href="/SistemaWebFarmaceutico?accion=GestionarUsuarios">Gestion de Usuarios</a></li>
                    
                    
                </ul>
            </nav>
    </body>
</html>
