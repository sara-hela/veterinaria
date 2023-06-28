<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    if (session.getAttribute("logueado") != "OK") {
        response.sendRedirect("login.jsp");
    } 
    String rol = session.getAttribute("id_rol") + "";
    String nombre = session.getAttribute("nombre") + "";
%>
<!-- SideBar -->
<section class="full-box cover dashboard-sideBar">
    <div class="full-box dashboard-sideBar-bg btn-menu-dashboard"></div>
    <div class="full-box dashboard-sideBar-ct">
        <!--SideBar Title -->
        <div class="full-box text-uppercase text-center text-titles dashboard-sideBar-title">
            <a href="index.jsp"><span style="text-decoration: none;color: #fff;list-style: none;">VETERINARIA VIDA</span></a><i class="zmdi zmdi-close btn-menu-dashboard visible-xs"></i>
        </div>
        <!-- SideBar User info -->
        <div class="full-box dashboard-sideBar-UserInfo">
            <figure class="full-box">
                <img src="./assets/avatars/vetisana.png" alt="UserIcon">
                <br>
                <figcaption class="text-center text-titles">BIENVENIDO</figcaption>
                <figcaption class="text-center text-titles" style="text-transform: uppercase"><b><%= rol %></b></figcaption>
                <figcaption class="text-center text-titles" style="text-transform: uppercase"><b><%= nombre %></b></figcaption>
            </figure>
            <ul class="full-box list-unstyled text-center">
                <li>
                    <a href="LoginControlador?action=logout" >
                        <i class="zmdi zmdi-power"></i>
                    </a>
                </li>

            </ul>
        </div>
        <!-- SideBar Menu -->
        <ul class="list-unstyled full-box dashboard-sideBar-Menu">
            <c:if test="${rol=='1' || rol=='2' || rol=='3' }"> 
                <li>
                    <a href="UsuarioControlador"><i class="zmdi zmdi-account-circle zmdi zmdi-hc-fw"></i> USUARIOS </a>
                </li>
            </c:if>
            <c:if test="${rol=='1'}">    
                <li>
                    <a href="DoctorControlador"><i class="zmdi zmdi-hospital zmdi-hc-fw"></i> DOCTORES </a>
                </li>
            </c:if>
            <c:if test="${rol=='1'}">   
                <li>
                    <a href="RecepcionistaControlador"><i class="zmdi zmdi-assignment-account zmdi-hc-fw"></i> RECEPCIONISTAS </a>
                </li>
            </c:if>
            <c:if test="${rol=='1' || rol=='2' || rol=='3'}">   
                <li>
                    <a href="PacienteControlador"><i class="zmdi zmdi-male-female zmdi zmdi-hc-fw"></i> PACIENTES </a>
                </li>
            </c:if>
            <c:if test="${rol=='1' || rol=='2'}">   
                <li>
                    <a href="ConsultaControlador"><i class="zmdi zmdi-assignment zmdi zmdi-hc-fw"></i> CONSULTAS </a>
                </li>
            </c:if>
            <c:if test="${rol=='1' || rol=='2'}"> 
                <li>
                    <a href="RecetaControlador"><i class="zmdi zmdi-assignment-alert zmdi zmdi-hc-fw"></i> RECETAS </a>
                </li>
            </c:if>
            <c:if test="${rol=='1' || rol=='3'}">   
                <li>
                    <a href="ReservaControlador"><i class="zmdi zmdi-eyedropper zmdi zmdi-hc-fw"></i> RESERVAS </a>
                </li>
            </c:if>
            <c:if test="${rol=='1'}"> 
                <li>
                    <a href="#!" class="btn-sideBar-SubMenu">
                        <i class="zmdi zmdi-layers zmdi-hc-fw"></i> OTROS <i class="zmdi zmdi-caret-down pull-right"></i>
                    </a>
                    <ul class="list-unstyled full-box">
                        <li>
                            <a href="TurnoControlador"><i class="zmdi zmdi-card zmdi zmdi-hc-fw"></i> TURNOS </a>
                        </li>
                        <li>
                            <a href="RolControlador"><i class="zmdi zmdi-card zmdi zmdi-hc-fw"></i> ROLES </a>
                        </li>
                    </ul>
                </li>
            </c:if>
        </ul>
    </div>
</section>

