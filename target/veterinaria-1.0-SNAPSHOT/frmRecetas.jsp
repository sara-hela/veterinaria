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
                    <h1 class="text-titles"><i class="zmdi zmdi-assignment-alert zmdi-hc-fw"></i>RECETAS <small>Consultorio</small></h1>
                </div>
                <c:if test="${requestScope.action == 'add'}" var="res" scope="request">
                    <p class="lead">Formulario para registrar nueva receta.</p>
                </c:if>
                <c:if test="${requestScope.action == 'edit'}" var="res" scope="request">
                    <c:forEach var="item" items="${lista_pacientes}">
                        <c:set var="paciente" value="${item.nombre} ${item.paterno} ${item.materno}"/>
                        <c:if test="${paciente == receta.paciente}" var="sel">
                            <c:if test="${item.sexo == 'Hombre'}" var="res" scope="request">
                                <p class="lead">Formulario para editar los datos de la receta de la consulta <b>${receta.id_consulta}</b> del paciente <b>${item.nombre} ${item.paterno} ${item.materno}</b>.</p>
                            </c:if>
                            <c:if test="${item.sexo == 'Mujer'}" var="res" scope="request">
                                <p class="lead">Formulario para editar los datos de la receta de la consulta <b>${receta.id_consulta}</b> de la paciente <b>${item.nombre} ${item.paterno} ${item.materno}</b>.</p>
                            </c:if>
                        </c:if> 
                    </c:forEach>
                </c:if>
            </div>
            <div class="container-fluid">
                <ul class="breadcrumb breadcrumb-tabs">
                    <li>
                        <a href="RecetaControlador" class="btn btn-info">
                            <i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE RECETAS
                        </a>
                    </li>
                    <li>
                        <a href="RecetaControlador?action=add" class="btn btn-success">
                            <i class="zmdi zmdi-plus"></i> &nbsp; NUEVA RECETA
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
                            REGISTRO DE RECETA
                        </h3>
                    </div>
                    <div class="panel-body">
                        <form action="RecetaControlador" method="POST">
                            <fieldset>
                                <legend><i class="zmdi zmdi-assignment"></i> &nbsp; DATOS BASICOS</legend>
                                <div class="container-fluid">
                                    <div class="row">
                                        <input type="hidden" name="id" value="${receta.id}">
                                        <div class="col-xs-12">
                                            <div class="form-group" style="margin-top: 0px">
                                                <label class="control-label">SELECCIONE ID DE CONSULTA</label>
                                                <select name="id_consulta" class="form-control" requiered>
                                                    <option value="">---  SELECCIONE ID  ---</option>
                                                    <c:forEach var="item" items="${lista_consultas}">
                                                        <option value="${item.id}"
                                                                <c:if test="${item.id == receta.id_consulta}" var="sel">
                                                                    selected
                                                                </c:if> >${item.id}
                                                        </option> 
                                                    </c:forEach>
                                                </select>  
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE MEDICAMENTO</label>
                                                <input class="form-control" type="text" name="medicamento" required="" value="${receta.medicamento}">
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE DOSIS</label>
                                                <input class="form-control" type="text" name="dosis" required="" value="${receta.dosis}">
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE INDICACIONES</label>
                                                <input class="form-control" type="text" name="indicaciones" required="" value="${receta.indicaciones}">
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

