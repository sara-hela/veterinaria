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
                    <h1 class="text-titles"><i class="zmdi zmdi-assignment-alert zmdi-hc-fw"></i>RECETAS <small>Consultorio</small></h1>
                </div>
                <p class="lead">Lista de las recetas que se le dieron 
                    <c:if test="${requestScope.sex_paciente == 'Hombre'}" var="res" scope="request">
                        al paciente <b>${requestScope.paciente}</b>.
                    </c:if>
                    <c:if test="${requestScope.sex_paciente == 'Mujer'}" var="res" scope="request">
                        a la paciente <b>${requestScope.paciente}</b>.
                    </c:if>
                </p>
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

            <!-- panel lista de empresas -->
            <div class="container-fluid">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE RECETAS</h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-hover text-center">
                                <thead>
                                    <tr>
                                        <th class="text-center">ID</th>
                                        <th class="text-center">ID_CONSULTA</th>
                                        <th class="text-center">DOCTOR</th>
                                        <th class="text-center">PACIENTE</th>
                                        <th class="text-center">MEDICAMENTO</th>
                                        <th class="text-center">DOSIS</th>
                                        <th class="text-center">INDICACIONES</th>
                                            <c:if test="${id_rol==1}">
                                            <th class="text-center">EDITAR</th>

                                            <th class="text-center">ELIMINAR</th>
                                            </c:if>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${recetas}">
                                        <tr>
                                            <c:if test="${requestScope.id_consulta == item.id_consulta}" var="res" scope="request">
                                                <td>${item.id}</td>
                                                <td>${item.id_consulta}</td>
                                                <td>${item.doctor}</td>
                                                <td>${item.paciente}</td>
                                                <td>${item.medicamento}</td>
                                                <td>${item.dosis}</td>
                                                <td>${item.indicaciones}</td>
                                                <c:if test="${id_rol==1}">
                                                    <td>                                                                    
                                                        <a href="RecetaDeterminadaControlador?action=edit&id=${item.id}&id_consulta=${requestScope.id_consulta}&paciente=${paciente}&sex_paciente=${requestScope.sex_paciente}" class="btn btn-success btn-raised btn-xs">
                                                            <i class="zmdi zmdi-edit"></i>
                                                        </a>
                                                    </td>
                                                    <td>
                                                        <a href="RecetaDeterminadaControlador?action=delete&id=${item.id}&id_consulta=${requestScope.id_consulta}&paciente=${paciente}&sex_paciente=${requestScope.sex_paciente}" class="btn btn-danger btn-raised btn-xs" onclick='return confirm("¿Estas seguro de eliminar la receta \"${item.id}\"?")'>
                                                            <i class="zmdi zmdi-delete"></i>
                                                        </a>
                                                    </td>
                                                </c:if>
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