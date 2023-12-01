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
        <title>JSP Page</title>
    </head>
    <body>
        <div><h1>Iniciar Sesion</h1></div>
        <div>
            <form method="POST" action="/SistemaWebFarmaceutico/ServletPrincipal?accion=Login"> 
                <div id="resultLogin"></div>
                <div><h1>Bienvenido al Sistema de Farmacia</h1></div><br>
                <%-- Crear objeto de la clase Date y formatear --%>
                <c:set var="fechaActual" value="<%= new java.util.Date() %>" />
                <c:set var="formatoFecha" value="dd/MM/YYYY" />
                
                <%-- Imprimir fecha --%>
                <div>
                    <label>
                        <strong>
                            <c:out value="Fecha Actual: "/>
                            <fmt:formatDate value='${fechaActual}' pattern='${formatoFecha}'/>
                        </strong>
                    </label>
                </div><br>
                <div><label>Usuario:</label></div>
                <div><input type="text" name="tfUsuario"></div>
                <div><label>Contraseña:</label></div>
                <div><input type="password" name="tfContrasenia"></div><br>
                <div><input type="submit" value="Iniciar Sesion"></div>
            </form>
        </div>
    </body>
</html>
