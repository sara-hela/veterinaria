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
            <!-- Panel -->
            <div class="container-fluid">
                <div class="page-header">
                    <h1 class="text-titles"><i class="zmdi zmdi-assignment-account zmdi-hc-fw"></i>RECEPCIONISTAS <small>Consultorio</small>
                </div>
                <c:if test="${requestScope.action == 'add'}" var="res" scope="request">
                    <p class="lead">Formulario para registrar datos del nuevo recepcionista.</p>
                </c:if>
                <c:if test="${requestScope.action == 'edit'}" var="res" scope="request">
                    <p class="lead">Formulario para editar datos 
                        <c:if test="${recepcionista.sexo == 'Hombre'}" var="res" scope="request">
                            del recepcionista <b>${recepcionista.nombre} ${recepcionista.paterno} ${recepcionista.materno}</b>.</p>
                        </c:if>
                        <c:if test="${recepcionista.sexo == 'Mujer'}" var="res" scope="request">
                        de la recepcionista <b>${recepcionista.nombre} ${recepcionista.paterno} ${recepcionista.materno}</b>.</p>
                    </c:if>
                </c:if>
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
                <div class="panel panel-success">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="zmdi zmdi-plus"></i> &nbsp; 
                            <c:if test="${requestScope.action == 'add'}" var="res" scope="request">
                                NUEVO
                            </c:if>
                            <c:if test="${requestScope.action == 'edit'}" var="res" scope="request">
                                EDITAR
                            </c:if>
                            REGISTRO DE RECEPCIONISTA
                        </h3>
                    </div>
                    <div class="panel-body">
                        <form action="RecepcionistaControlador" method="POST" >
                            <fieldset>
                                <legend><i class="zmdi zmdi-assignment"></i> &nbsp; DATOS BASICOS</legend>
                                <div class="container-fluid">
                                    <div class="row">
                                        <input type="hidden" name="action" value="${requestScope.action}">
                                        <input type="hidden" name="id" value="${recepcionista.id}">
                                        <div class="col-xs-12">
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE CI</label>
                                                <input class="form-control" type="text" name="ci" required="" value="${recepcionista.ci}">
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE NOMBRE</label>
                                                <input class="form-control" type="text" name="nombre" required="" value="${recepcionista.nombre}">
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE APELLIDO PATERNO</label>
                                                <input class="form-control" type="text" name="paterno" required="" value="${recepcionista.paterno}">
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE APELLIDO MATERNO</label>
                                                <input class="form-control" type="text" name="materno" required="" value="${recepcionista.materno}">
                                            </div>
                                            <div class="form-group" style="margin-top: 0px">
                                                <label class="control-label">INGRESE FECHA DE NACIMIENTO</label>
                                                <input class="form-control" type="date" name="fecha_nacimiento" required="" value="${recepcionista.fecha_nacimiento}">
                                            </div>
                                            <div class="form-group" style="margin-top: 0px">
                                                <label class="control-label">SELECCIONE SEXO</label>
                                                <select name="sexo" class="form-control" requiered>
                                                    <option value="">---  SELECCIONE SEXO  ---</option>
                                                    <option value="Hombre"
                                                            <c:if test="${recepcionista.sexo == 'Hombre'}" var="sel">
                                                                selected
                                                            </c:if> >Hombre
                                                    </option>
                                                    <option value="Mujer"
                                                            <c:if test="${recepcionista.sexo == 'Mujer'}" var="sel">
                                                                selected
                                                            </c:if> >Mujer
                                                    </option>
                                                </select>  
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE TELEFONO</label>
                                                <input class="form-control" type="text" name="telefono" required="" value="${recepcionista.telefono}">
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE DIRECCIÓN DE DOMICILIO</label>
                                                <input class="form-control" type="text" name="direccion" required="" value="${recepcionista.direccion}">
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE CIUDAD</label>
                                                <input class="form-control" type="text" name="ciudad" required="" value="${recepcionista.ciudad}">
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE CORREO ELECTRONICO</label>
                                                <input class="form-control" type="email" name="correo" required="" value="${recepcionista.correo}">
                                            </div>
                                            <div class="form-group " style="margin-top: 0px">
                                                <label class="control-label">SELECCIONE TURNO</label>
                                                <select name="id_turno" class="form-control" requiered>
                                                    <option value="">---  SELECCIONE TURNO  ---</option>
                                                    <c:forEach var="item" items="${lista_turnos}">
                                                        <option value="${item.id}"
                                                                <c:if test="${item.id == recepcionista.id_turno}" var="sel">
                                                                    selected
                                                                </c:if> >${item.turno}
                                                        </option> 
                                                    </c:forEach>
                                                </select>  
                                            </div>
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

