<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
<%
    
    String id = session.getAttribute("id_usuario") + "";
    int id_usuario = Integer.parseInt(id);
    
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

            <!-- PANEL -->
            <div class="container-fluid">
                <div class="page-header">
                    <h1 class="text-titles"><i class="zmdi zmdi-account zmdi-hc-fw"></i>USUARIOS <small>Consultorio</small></h1>
                </div>
                <c:if test="${id_rol==1}"> 
                    <p class="lead">Lista de todos los usuarios que tienen acceso a alguna función del sitio web.</p>
                </c:if>
            </div>
            <div class="container-fluid">
                <ul class="breadcrumb breadcrumb-tabs">
                    <li>
                        <a href="UsuarioControlador" class="btn btn-info">
                            <i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE USUARIOS
                        </a>
                    </li>
                    <c:if test="${id_rol==1}">  
                        <li>
                            <a href="UsuarioControlador?action=add" class="btn btn-success">
                                <i class="zmdi zmdi-plus"></i> &nbsp; NUEVO USUARIO
                            </a>
                        </li>
                    </c:if>
                </ul>
            </div>
            <div class="container-fluid">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title"><i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE USUARIOS</h3>
                    </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <table class="table table-hover text-center">
                                <thead>
                                    <tr>
                                        <th class="text-center">ID</th>
                                        <th class="text-center">USUARIO</th>
                                        <th class="text-center">ID_ROL</th>
                                        <th class="text-center">EDITAR</th>
                                            <c:if test="${id_rol==1}"> 
                                            <th class="text-center">ELIMINAR</th>
                                            </c:if>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="item" items="${usuarios}">
                                        <tr>
                                            <c:if test="${id_rol==1}"> 
                                                <td>${item.id}</td>
                                                <td>${item.usuario}</td>
                                                <td>${item.id_rol}</td>
                                                <td>                                                                    
                                                    <a href="UsuarioControlador?action=edit&id=${item.id}" class="btn btn-success btn-raised btn-xs">
                                                        <i class="zmdi zmdi-edit"></i>
                                                    </a>
                                                </td>
                                                <td>
                                                    <a href="UsuarioControlador?action=delete&id=${item.id}" class="btn btn-danger btn-raised btn-xs" onclick='return confirm("¿Estas seguro de eliminar el usuario \"${item.id}\"?")'>
                                                        <i class="zmdi zmdi-delete"></i>
                                                    </a>
                                                </td>
                                            </c:if>

                                            <c:if test="${id_rol==2 || id_rol==3 }">       
                                                <c:if test="${id_usuario == item.id}"> 
                                                    <td>${item.id}</td>
                                                    <td>${item.usuario}</td>
                                                    <td>${item.id_rol}</td>
                                                    <td>                                                                    
                                                        <a href="UsuarioControlador?action=edit&id=${item.id}" class="btn btn-success btn-raised btn-xs">
                                                            <i class="zmdi zmdi-edit"></i>
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