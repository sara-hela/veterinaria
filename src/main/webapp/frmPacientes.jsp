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
                    <h1 class="text-titles"><i class="zmdi zmdi-male-female zmdi-hc-fw"></i>PACIENTES <small>Consultorio</small>
                </div>
                <c:if test="${requestScope.action == 'add'}" var="res" scope="request">
                    <p class="lead">Formulario para registrar datos del nuevo paciente.</p>
                </c:if>
                <c:if test="${requestScope.action == 'edit'}" var="res" scope="request">
                    <p class="lead">Formulario para editar datos 
                        <c:if test="${paciente.sexo == 'Macho'}" var="res" scope="request">
                            del paciente <b>${paciente.nombre} </b>.</p>
                        </c:if>
                        <c:if test="${paciente.sexo == 'Hembra'}" var="res" scope="request">
                        de la paciente <b>${paciente.nombre}</b>.</p>
                    </c:if>
                </c:if>
            </div>
            <div class="container-fluid">
                <ul class="breadcrumb breadcrumb-tabs">
                    <li>
                        <a href="PacienteControlador" class="btn btn-info">
                            <i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE PACIENTES
                        </a>
                    </li>
                    <li>
                        <a href="PacienteControlador?action=add" class="btn btn-success">
                            <i class="zmdi zmdi-plus"></i> &nbsp; NUEVO PACIENTE
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
                            REGISTRO DE PACIENTE
                        </h3>
                    </div>
                    <div class="panel-body">
                        <form action="PacienteControlador" method="POST" >
                            <fieldset>
                                <legend><i class="zmdi zmdi-assignment"></i> &nbsp; DATOS BASICOS</legend>
                                <div class="container-fluid">
                                    <div class="row">
                                        <input type="hidden" name="id" value="${paciente.id}">
                                        <div class="col-xs-12">
                                            
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE NOMBRE</label>
                                                <input class="form-control" type="text" name="nombre" required="" value="${paciente.nombre}">
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE RAZA</label>
                                                <input class="form-control" type="text" name="raza" required="" value="${paciente.raza}">
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE EDAD</label>
                                                <input class="form-control" type="text" name="edad" required="" value="${paciente.edad}">
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE COLOR</label>
                                                <input class="form-control" type="text" name="color" required="" value="${paciente.color}">
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE RASGOS</label>
                                                <input class="form-control" type="text" name="rasgos" required="" value="${paciente.rasgos}">
                                            </div>
                                            <div class="form-group" style="margin-top: 0px">
                                                <label class="control-label">SELECCIONE SEXO</label>
                                                <select name="sexo" class="form-control" requiered>
                                                    <option value="">---  SELECCIONE SEXO  ---</option>
                                                    <option value="Hombre"
                                                            <c:if test="${paciente.sexo == 'Macho'}" var="sel">
                                                                selected
                                                            </c:if> >Macho
                                                    </option>
                                                    <option value="Hembra"
                                                            <c:if test="${paciente.sexo == 'Hembra'}" var="sel">
                                                                selected
                                                            </c:if> >Hembra
                                                    </option>
                                                </select>  
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE ID_RESPONSABLE</label>
                                                <input class="form-control" type="text" name="id_responsable" required="" value="${paciente.id_responsable}">
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE TIPO_ANIMAL</label>
                                                <input class="form-control" type="text" name="tipo_animal" required="" value="${paciente.tipo_animal}">
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

