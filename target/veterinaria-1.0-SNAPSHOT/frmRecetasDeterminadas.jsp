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
                    <p class="lead">Formulario para registrar nueva receta para 
                        <c:if test="${requestScope.sex_paciente == 'Hombre'}" var="res" scope="request">
                            el paciente <b>${requestScope.paciente}</b>.
                        </c:if>
                        <c:if test="${requestScope.sex_paciente == 'Mujer'}" var="res" scope="request">
                            la paciente <b>${requestScope.paciente}</b>.
                        </c:if>
                    </p>
                </c:if>
                <c:if test="${requestScope.action == 'edit'}" var="res" scope="request">
                    <c:if test="${requestScope.sex_paciente == 'Hombre'}" var="res" scope="request">
                        <p class="lead">Formulario para editar datos de receta del paciente <b>${requestScope.paciente}</b>.</p>
                    </c:if>
                    <c:if test="${requestScope.sex_paciente == 'Mujer'}" var="res" scope="request">
                        <p class="lead">Formulario para editar datos de receta de la paciente <b>${requestScope.paciente}</b>.</p>
                    </c:if>
                </c:if>
                
                
            </div>


            <div class="container-fluid">
                <ul class="breadcrumb breadcrumb-tabs">
                    <li>
                        <a href="RecetaDeterminadaControlador?id_consulta=${requestScope.id_consulta}&paciente=${paciente}&sex_paciente=${requestScope.sex_paciente}" class="btn btn-info">
                            <i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE RECETAS
                        </a>
                    </li>
                    <li>
                        <a href="RecetaDeterminadaControlador?action=add&id_consulta=${requestScope.id_consulta}&paciente=${paciente}&sex_paciente=${requestScope.sex_paciente}" class="btn btn-success">
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
                        <form action="RecetaDeterminadaControlador" method="POST">
                            <fieldset>
                                <legend><i class="zmdi zmdi-assignment"></i> &nbsp; Datos basicos</legend>
                                <div class="container-fluid">
                                    <div class="row">
                                        <input type="hidden" name="id" value="${receta.id}">
                                        <input type="hidden" name="id_consulta" value="${requestScope.id_consulta}">
                                        <input type="hidden" name="paciente" value="${requestScope.paciente}">
                                        <input type="hidden" name="sex_paciente" value="${requestScope.sex_paciente}">
                                        <div class="col-xs-12">
                                            <div class="form-group ">
                                                <label class="control-label">Seleccione id de consulta</label>
                                                <select name="id_consulta" class="form-control" requiered>
                                                    <option value="">-- Seleccione --</option>
                                                    <c:forEach var="item" items="${lista_consultas}">
                                                        <option value="${item.id}"
                                                                <c:if test="${item.id == requestScope.id_consulta}" var="sel">
                                                                    selected
                                                                </c:if> >${item.id}
                                                        </option> 
                                                    </c:forEach>
                                                </select>  
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">Ingrese medicamento</label>
                                                <input class="form-control" type="text" name="medicamento" required="" value="${receta.medicamento}">
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">Ingrese dosis</label>
                                                <input class="form-control" type="text" name="dosis" required="" value="${receta.dosis}">
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">Ingrese indicaciones</label>
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

