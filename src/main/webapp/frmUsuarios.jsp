<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--
<%
    String id = session.getAttribute("id_usuario") + "";
    int id_usuario = Integer.parseInt(id);
    String id_rol = session.getAttribute("id_rol") + "";
    int id_role = Integer.parseInt(id_rol);

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
                    <h1 class="text-titles"><i class="zmdi zmdi-account zmdi-hc-fw"></i>USUARIOS <small>Consultorio</small></h1>
                </div>
                <c:if test="${requestScope.action == 'add'}" var="res" scope="request">
                    <p class="lead">Formulario para registrar nuevo usuario. Para ello el futuro usuario ya debe estar registrado en la lista doctores, recepcionistas o pacientes.</p>
                </c:if>
                <c:if test="${requestScope.action == 'edit'}" var="res" scope="request">
                    <p class="lead">Formulario con los datos a editar del usuario seleccionado.</p>
                </c:if>             
            </div>
            <div class="container-fluid">
                <ul class="breadcrumb breadcrumb-tabs">
                    <li>
                        <a href="UsuarioControlador" class="btn btn-info">
                            <i class="zmdi zmdi-format-list-bulleted"></i> &nbsp; LISTA DE USUARIOS
                        </a>
                    </li>
                    <c:if test="${id_role==1}">  
                        <li>
                            <a href="UsuarioControlador?action=add" class="btn btn-success">
                                <i class="zmdi zmdi-plus"></i> &nbsp; NUEVO USUARIO
                            </a>
                        </li>
                    </c:if> 
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
                            REGISTRO DE USUARIO
                        </h3>
                    </div>
                    <div class="panel-body">
                        <form action="UsuarioControlador" method="POST" >
                            <fieldset>
                                <legend><i class="zmdi zmdi-assignment"></i> &nbsp; DATOS BASICOS</legend>
                                <div class="container-fluid">
                                    <div class="row">
                                        <input type="hidden" name="action" value="${requestScope.action}">
                                        <div class="col-xs-12">
                                            
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE USUARIO</label>
                                                <input class="form-control" type="text" name="usuario" required="" value="${usuario.usuario}">
                                            </div>
                                            <div class="form-group label-floating">
                                                <label class="control-label">INGRESE CONTRASEÑA</label>
                                                <input class="form-control" type="password" name="password" required="" value="${usuario.password}">
                                            </div>
                                            <div class="form-group" style="margin-top: 0px; 
                                                 <c:if test="${id_role!=1}">
                                                     display: none
                                                 </c:if>
                                                 ">
                                                <label class="control-label">SELECCIONE ROL</label>
                                                <select name="id_rol" class="form-control" requiered>
                                                    <option value="">---  Seleccione rol  ---</option>
                                                    <c:forEach var="item" items="${lista_roles}">
                                                        <option value="${item.id}"
                                                                <c:if test="${item.id == usuario.id_rol}" var="sel">
                                                                    selected
                                                                </c:if> >${item.rol}
                                                        </option> 
                                                    </c:forEach>
                                                </select>  
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

