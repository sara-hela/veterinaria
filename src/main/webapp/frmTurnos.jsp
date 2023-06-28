<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                    <h1 class="text-titles"><i class="zmdi zmdi-alarm zmdi-hc-fw"></i>TURNOS <small>Consultorio</small>
                </div>
                <c:if test="${requestScope.action == 'add'}" var="res" scope="request">
                    <p class="lead">Formulario para registrar nuevo turno.</p>
                </c:if>
                <c:if test="${requestScope.action == 'edit'}" var="res" scope="request">
                    <p class="lead">Formulario para editar datos de turno.</p>
                </c:if>
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

            <!-- panel datos de la empresa -->
            <div class="container-fluid">
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="zmdi zmdi-plus"></i> &nbsp; 
                            <c:if test="${requestScope.action == 'add'}" var="res" scope="request">
                                NUEVO
                            </c:if>
                            <c:if test="${requestScope.action == 'edit'}" var="res" scope="request">
                                EDITAR
                            </c:if>
                            REGISTRO DE TURNO
                        </h3>
                    </div>
                    <div class="panel-body">
                        <form action="TurnoControlador" method="POST" >
                            <fieldset>
                                <legend><i class="zmdi zmdi-assignment"></i> &nbsp; DATOS BASICOS</legend>
                                <div class="container-fluid">
                                    <div class="row">
                                        <input type="hidden" name="id" value="${turno.id}">
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE TURNO</label>
                                                <input class="form-control" type="text" name="turno" required="" value="${turno.turno}">
                                            </div>
                                            <div class="form-group" style="margin-top: 0px">
                                                <label class="control-label">INGRESE HORA DE INICIO</label>
                                                <input class="form-control" type="time" min="00:00" max="23:59" name="hora_inicio" required="" value="${turno.hora_inicio}">
                                            </div>
                                            <div class="form-group" style="margin-top: 0px">
                                                <label class="control-label">INGRESE HORA DE SALIDA</label>
                                                <input class="form-control" type="time" min="00:00" max="23:59" name="hora_final" required="" value="${turno.hora_final}">
                                            </div>
                                        </div>
                                    </div>
                            </fieldset>                            
                            <br>
                            <br>
                            <p class="text-center" style="margin-top: 20px;">
                                <button type="submit" class="btn btn-info btn-raised btn-lg"><i class="zmdi zmdi-floppy"></i> GUARDAR </button>
                            </p>
                        </form>
                    </div>
                </div>
            </div>

        </section>
        <jsp:include page="WEB-INF/Scripts.jsp"/>
    </body>
</html>

