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
            <!-- Content page -->
            <div class="container-fluid">
                <div class="page-header">
                    <h1 class="text-titles"><i class="zmdi zmdi-alarm zmdi-hc-fw"></i>TURNOS <small>Consultorio</small></h1>
                </div>
                <p class="lead">Lista de todos los turnos que tiene el consultorio.</p>
            </div>

            <div class="container-fluid">
                <ul class="breadcrumb breadcrumb-tabs">
                    <li>
                        <a href="TurnoControlador" class="btn btn-info">
                            <i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE TURNOS
                        </a>
                    </li>
                    <li>
                        <a href="TurnoControlador?action=add" class="btn btn-success">
                            <i class="zmdi zmdi-plus"></i> &nbsp; NUEVO TURNO
                        </a>
                    </li>
                </ul>
            </div>

            <!-- panel lista de empresas -->
            <div class="container-fluid">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE TURNOS</h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-hover text-center">
                                <thead>
                                    <tr>
                                        <th class="text-center">ID</th>
                                        <th class="text-center">TURNO</th>
                                        <th class="text-center">HORA-INICIO</th>
                                        <th class="text-center">HORA-FINAL</th>
                                        <th class="text-center">EDITAR</th>
                                        <th class="text-center">ELIMINAR</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${turnos}">
                                        <tr>
                                            <td>${item.id}</td>
                                            <td>${item.turno}</td>
                                            <td>${item.hora_inicio}</td>
                                            <td>${item.hora_final}</td>
                                            <td>                                                                    
                                                <a href="TurnoControlador?action=edit&id=${item.id}" class="btn btn-success btn-raised btn-xs">
                                                    <i class="zmdi zmdi-edit"></i>
                                                </a>
                                            </td>
                                            <td>
                                                <a href="TurnoControlador?action=delete&id=${item.id}" class="btn btn-danger btn-raised btn-xs" onclick='return confirm("¿Estas seguro de eliminar el turno \"${item.id}\"?")'>
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