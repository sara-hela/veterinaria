<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<%
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
                    <h1 class="text-titles"><i class="zmdi zmdi-assignment zmdi-hc-fw"></i>CONSULTAS <small>Consultorio</small></h1>
                </div>
                <c:if test="${requestScope.action == 'add'}" var="res" scope="request">
                    <p class="lead">Formulario para registrar nueva consulta.</p>
                </c:if>
                <c:if test="${requestScope.action == 'edit'}" var="res" scope="request">
                    <c:forEach var="item" items="${lista_pacientes}">
                        <c:if test="${item.id == consulta.id_paciente}" var="sel">
                            <c:if test="${item.sexo == 'Hombre'}" var="res" scope="request">
                                <p class="lead">Formulario para editar datos de la consulta del paciente <b>${item.nombre} ${item.paterno} ${item.materno}</b>.</p>
                            </c:if>
                            <c:if test="${item.sexo == 'Mujer'}" var="res" scope="request">
                                <p class="lead">Formulario para editar datos de la consulta de la paciente <b>${item.nombre} ${item.paterno} ${item.materno}</b>.</p>
                            </c:if>
                        </c:if> 
                    </c:forEach>
                </c:if>
            </div>
            <div class="container-fluid">
                <ul class="breadcrumb breadcrumb-tabs">
                    <li>
                        <a href="ConsultaControlador" class="btn btn-info">
                            <i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE CONSULTAS
                        </a>
                    </li>
                    <li>
                        <a href="ConsultaControlador?action=add" class="btn btn-success">
                            <i class="zmdi zmdi-plus"></i> &nbsp; NUEVA CONSULTA
                        </a>
                    </li>
                </ul>
            </div>
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
                            REGISTRO DE CONSULTA
                        </h3>
                    </div>
                    <div class="panel-body">
                        <form action="ConsultaControlador" method="POST">
                            <fieldset>
                                <legend><i class="zmdi zmdi-assignment"></i> &nbsp; DATOS BASICOS</legend>
                                <div class="container-fluid">
                                    <div class="row">
                                        <input type="hidden" name="id" value="${consulta.id}">
                                        <div class="col-xs-12">
                                            <div class="form-group" style="margin-top: 0px">
                                                <label class="control-label">SELECCIONE DOCTOR</label>
                                                <select name="id_doctor" class="form-control" requiered>
                                                    <option value="">---  SELECCIONE DOCTOR  ---</option>
                                                    <c:forEach var="item" items="${lista_doctores}">
                                                        <option value="${item.id}"
                                                                <c:if test="${item.id == consulta.id_doctor}" var="sel">
                                                                    selected
                                                                </c:if> >${item.nombre} ${item.paterno} ${item.materno}
                                                        </option> 
                                                    </c:forEach>
                                                </select>  
                                            </div>
                                            <div class="form-group" style="margin-top: 0px">
                                                <label class="control-label">SELECCIONE PACIENTE</label>
                                                <select name="id_paciente" class="form-control" requiered>
                                                    <option value="">---  SELECCIONE PACIENTE  ---</option>
                                                    <c:forEach var="item" items="${lista_pacientes}">
                                                        <option value="${item.id}"
                                                                <c:if test="${item.id == consulta.id_paciente}" var="sel">
                                                                    selected
                                                                </c:if> >${item.nombre} ${item.paterno} ${item.materno}
                                                        </option> 
                                                    </c:forEach>
                                                </select>  
                                            </div>
                                            <div class="form-group" style="margin-top: 0px">
                                                <label class="control-label">INGRESE FECHA</label>
                                                <input class="form-control" type="date" name="fecha" required="" value="${consulta.fecha}">
                                            </div>
                                            <div class="form-group"style="margin-top: 0px">
                                                <label class="control-label">INGRESE HORA</label>
                                                <input class="form-control" type="time" min="00:00" max="23:59" name="hora" required="" value="${consulta.hora}">
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE SINTOMAS</label>
                                                <input class="form-control" type="text" name="sintomas" required="" value="${consulta.sintomas}">
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE DIAGNOSTICO</label>
                                                <input class="form-control" type="text" name="diagnostico" required="" value="${consulta.diagnostico}">
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

