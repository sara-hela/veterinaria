<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
<%
    if (session.getAttribute("logueado") != "OK") {
        response.sendRedirect("login.jsp");
    }
%>
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>VETERINARIA VIDA</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="./css/main.css">
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <!-- Menu -->
        <jsp:include page="WEB-INF/Menu.jsp"/>

        <!-- Content page-->
        <section class="full-box dashboard-contentPage">
            <!-- NavBar -->
            <nav class="full-box dashboard-Navbar">
                <ul class="full-box list-unstyled text-right">
                    <li class="pull-left">
                        <a href="#!" class="btn-menu-dashboard"><i class="zmdi zmdi-more-vert"></i></a>
                    </li>
                </ul>
            </nav>
            <!-- Panel -->
            <div class="container-fluid">
                <div class="page-header">
                    <h1 class="text-titles"><i class="zmdi zmdi-assignment-account zmdi-hc-fw"></i>RECEPCIONISTAS <small>Consultorio</small></h1>
                </div>
                <p class="lead">Lista de todos los recepcionistas que tiene el consultorio.</p>
            </div>
            <div class="container-fluid">
                <ul class="breadcrumb breadcrumb-tabs">
                    <li>
                        <a href="RecepcionistaControlador" class="btn btn-info">
                            <i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE RECEPCIONISTAS
                        </a>
                    </li>
                    <li>
                        <a href="RecepcionistaControlador?action=add" class="btn btn-success">
                            <i class="zmdi zmdi-plus"></i> &nbsp; NUEVO RECEPCIONISTA
                        </a>
                    </li>
                </ul>
            </div>
            <div class="container-fluid">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE RECEPCIONISTAS</h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-hover text-center">
                                <thead>
                                    <tr>
                                        <th class="text-center">ID</th>
                                        <th class="text-center">CI</th>
                                        <th class="text-center">NOMBRE</th>
                                        <th class="text-center">AP. PATERNO</th>
                                        <th class="text-center">AP. MATERNO</th>
                                        <th class="text-center">FECHA NACIMIENTO</th>
                                        <th class="text-center">SEXO</th>
                                        <th class="text-center">TELEFONO</th>
                                        <th class="text-center">DIRECCIÓN</th>
                                        <th class="text-center">CIUDAD</th>
                                        <th class="text-center">CORREO</th>
                                        <th class="text-center">TURNO</th>
                                        <th class="text-center">EDITAR</th>
                                        <th class="text-center">ELIMINAR</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${recepcionistas}">
                                        <tr>
                                            <td>${item.id}</td>
                                            <td>${item.ci}</td>
                                            <td>${item.nombre}</td>
                                            <td>${item.paterno}</td>
                                            <td>${item.materno}</td>
                                            <td>${item.fecha_nacimiento}</td>
                                            <td>${item.sexo}</td>
                                            <td>${item.telefono}</td>
                                            <td>${item.direccion}</td>
                                            <td>${item.ciudad}</td>
                                            <td>${item.correo}</td>
                                            <td>${item.id_turno}</td>
                                            <td>                                                                    
                                                <a href="RecepcionistaControlador?action=edit&id=${item.id}" class="btn btn-success btn-raised btn-xs">
                                                    <i class="zmdi zmdi-edit"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="RecepcionistaControlador?action=delete&id=${item.id}" class="btn btn-danger btn-raised btn-xs" onclick='return confirm("¿Estas seguro de eliminar al recepcionista \"${item.id}\"?")'>
                                                    <i class="zmdi zmdi-delete"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="WEB-INF/Scripts.jsp"/>
    </body>
</html>