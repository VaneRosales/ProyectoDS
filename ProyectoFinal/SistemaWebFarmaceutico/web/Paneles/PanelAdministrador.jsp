<%-- 
    Document   : PanelAdministrador
    Created on : 7 oct 2023, 09:49:47
    Author     : jvane
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel Administrador</title>
    </head>
    <body>
        <div><h1>Sistema de Farmacia</h1></div>
        
        <%-- Bienveida --%>
        <c:set var="usuario" value="${param.tfUsuario}"/>
        
        <div><h2><strong>Bienvenido, <c:out value="${usuario}"/>!</strong></h2></div>
        
        <%-- Directiva include --%>
        <br>
        <div><h3>Men&uacute; de opciones</h3></div>
        <div>
            <%@include file="MenuAdministrador.jsp" %>
        </div>
        <div>
            <%@include file="Footer.html" %>
        </div>
    </body>
</html>
