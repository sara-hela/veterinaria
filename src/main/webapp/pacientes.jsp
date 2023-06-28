<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
<%
    String rol = session.getAttribute("rol") + "";
    String id = session.getAttribute("id_usuario") + "";
    int id_usuario = Integer.parseInt(id);
    String nombre = session.getAttribute("nombre") + "";

    if (session.getAttribute("logueado") != "OK") {
        response.sendRedirect("login.jsp");
    }
%>
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <title>VETERINARIA VIDA</title>
        <meta charset="UTF-8">
        <meta name="viewport"
              content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
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
                    <h1 class="text-titles"><i class="zmdi zmdi-male-female zmdi-hc-fw"></i>PACIENTES
                        <small>Consultorio</small></h1>
                </div>
                <p class="lead">Lista de todos los pacientes del consultorio.</p>
            </div>
            <div class="container-fluid">
                <ul class="breadcrumb breadcrumb-tabs">
                    <li>
                        <a href="PacienteControlador" class="btn btn-info"><i
                                class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE PACIENTES</a>
                    </li>
                    <c:if test="${rol=='Administrador' || rol=='Recepcionista'}"> 
                        <li>
                            <a href="PacienteControlador?action=add" class="btn btn-success"><i
                                    class="zmdi zmdi-plus"></i> &nbsp; NUEVO PACIENTE</a>
                        </li>
                    </c:if>
                </ul>
            </div>
            <!-- panel lista de empresas -->
            <div class="container-fluid">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE
                            PACIENTES</h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-hover text-center">
                                <thead>
                                    <tr>
                                        <th class="text-center">ID</th>
                                        <th class="text-center">NOMBRE</th>
                                        <th class="text-center">RAZA</th>
                                        <th class="text-center">EDAD</th>
                                        <th class="text-center">COLOR</th>
                                        <th class="text-center">RASGOS</th>
                                        <th class="text-center">SEXO</th>
                                        <th class="text-center">ID_RESPONSABLE</th>
                                        <th class="text-center">TIPO_ANIMAL</th>
                                            <c:if test="${rol=='Administrador' || rol=='Recepcionista'}">
                                            <th class="text-center">EDITAR</th>
                                            </c:if>
                                            <c:if test="${rol=='Administrador'}">
                                            <th class="text-center">ELIMINAR</th>
                                            </c:if>
                                            <c:if test="${rol=='Administrador' || rol=='Doctor'}">
                                            <th class="text-center">HISTORIAL</th>
                                            </c:if>

                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${pacientes}">
                                        <tr>
                                            <td>${item.id}</td>
                                            <td>${item.nombre}</td>
                                            <td>${item.raza}</td>
                                            <td>${item.edad}</td>
                                            <td>${item.color}</td>
                                            <td>${item.rasgos}</td>
                                            <td>${item.sexo}</td>
                                            <td>${item.id_responsable}</td>
                                            <td>${item.tipo_animal}</td>
                                            <c:if test="${rol=='Administrador' || rol=='Recepcionista'}"> 
                                                <td>
                                                    <a href="PacienteControlador?action=edit&id=${item.id}" class="btn btn-success btn-raised btn-xs">
                                                        <i class="zmdi zmdi-edit"></i>
                                                    </a>
                                                </td>
                                            </c:if>
                                            <c:if test="${rol=='Administrador'}">
                                                <td>
                                                    <a href="PacienteControlador?action=delete&id=${item.id}" class="btn btn-danger btn-raised btn-xs" onclick='return confirm("¿Estas seguro de eliminar al paciente \"${item.id}\"?")'>
                                                        <i class="zmdi zmdi-delete"></i>
                                                    </a>
                                                </td>
                                            </c:if>
                                            <c:if test="${rol=='Administrador' || rol=='Doctor'}">
                                                <td>
                                                    <a href="ConsultaDeterminadaControlador?id_paciente=${item.id}&sex_paciente=${item.sexo}&nom_paciente=${item.nombre} ${item.paterno} ${item.materno}" class="btn btn-primary btn-raised btn-xs">
                                                        <i class="zmdi zmdi-assignment"></i>
                                                    </a>
                                                </td>
                                            </c:if>

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