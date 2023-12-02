<%-- 
    Document   : PanelRRHH
    Created on : 2 dic 2023, 04:16:09
    Author     : jvane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                flex-direction: column;
                align-items: center;
                height: 100vh;
                margin: 0;
            }

            h1 {
                color: #009688;
                text-align: center;
                margin-bottom: 0;
            }

            h2 {
                color: #009688;
                text-align: center;
                margin-top: 5px;
            }

            h3 {
                color: #009688;
                text-align: center;
                margin-bottom: 20px;
            }

            .menu-container {
                background-color: #ffffff;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
                margin-bottom: 20px;
                flex-grow: 1;
            }

            .footerpanel {
                background-color: #ffffff;
                padding: 10px;
                border-radius: 10px;
                box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
                width: 100%; /* Ocupa el ancho completo */
                margin-top: auto; /* Se desplaza hasta el final del contenedor principal */
                flex-shrink: 0;
            }
            a {
                text-decoration: none;
                color: #009688;
                font-weight: bold;
                display: block;
            }
        </style>
    </head>
    <body>
        <div><h1>Sistema de Farmacia</h1></div>
        
        <%-- Bienvenida --%>
        <c:set var="usuario" value="${param.tfUsuario}"/>
        
        <div><h2><strong>Bienvenido, <c:out value="${usuario}"/>!</strong></h2></div>
        
        <%-- Directiva include --%>
        <br>
        <div><h3>Men&uacute; de opciones</h3></div>
        <div>
            <%@include file="MenuRRHH.jsp" %>
        </div>
        <div class="footerpanel">
            <%@include file="Footer.html" %>
        </div>
    </body>
</html>
