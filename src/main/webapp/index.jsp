<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.emergentes.utiles.ConexionDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%--
<%
    if (session.getAttribute("logueado") != "OK") {
        response.sendRedirect("login.jsp");
    }
%>
--%>
<%
    ConexionDB canal = new ConexionDB();
    Connection conn = canal.Conectar();
    String sql;
    PreparedStatement ps;
    ResultSet rs;
    String usuarios = "";
    String doctores = "";
    String recepcionistas = "";
    String pacientes = "";
    String consultas = "";
    String reservas = "";

    sql = "SELECT COUNT(*) AS usuarios FROM USUARIOS";
    ps = conn.prepareStatement(sql);
    rs = ps.executeQuery();
    if (rs.next()) {
        usuarios = Integer.toString(rs.getInt("usuarios"));
    }

    sql = "SELECT COUNT(*) AS doctores FROM DOCTORES";
    ps = conn.prepareStatement(sql);
    rs = ps.executeQuery();
    if (rs.next()) {
        doctores = Integer.toString(rs.getInt("doctores"));
    }

    sql = "SELECT COUNT(*) AS recepcionistas FROM RECEPCIONISTAS";
    ps = conn.prepareStatement(sql);
    rs = ps.executeQuery();
    if (rs.next()) {
        recepcionistas = Integer.toString(rs.getInt("recepcionistas"));
    }

    sql = "SELECT COUNT(*) AS paciente FROM PACIENTE";
    ps = conn.prepareStatement(sql);
    rs = ps.executeQuery();
    if (rs.next()) {
        pacientes = Integer.toString(rs.getInt("paciente"));
    }

    sql = "SELECT COUNT(*) AS consultas FROM CONSULTAS";
    ps = conn.prepareStatement(sql);
    rs = ps.executeQuery();
    if (rs.next()) {
        consultas = Integer.toString(rs.getInt("consultas"));
    }

    sql = "SELECT COUNT(*) AS reservas FROM RESERVAS";
    ps = conn.prepareStatement(sql);
    rs = ps.executeQuery();
    if (rs.next()) {
        reservas = Integer.toString(rs.getInt("reservas"));
    }
%>

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
        <!-- menu -->
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
                    <h1 class="text-titles">VETERINARIA VIDA<small> Administracion</small></h1>
                </div>
            </div>

            <div class="full-box text-center" style="padding: 30px 10px;">
                <!-- 1 -->
                <article class="full-box tile">
                    <div class="full-box tile-title text-center text-titles text-uppercase">
                           <a href="usuarios.jsp">USUARIOS</a>
                    </div>
                    <div class="full-box tile-icon text-center">
                        <i class="zmdi zmdi-account"></i>
                    </div>
                    <div class="full-box tile-number text-titles">
                        <p class="full-box"><%= usuarios%></p>
                        <small>Registro</small>
                    </div>
                </article>

                <!-- 2 -->
                <article class="full-box tile">
                    <div class="full-box tile-title text-center text-titles text-uppercase">
                     <a href="doctores.jsp">DOCTORES</a>
                    </div>
                    <div class="full-box tile-icon text-center">
                        <i class="zmdi zmdi-hospital"></i>
                    </div>
                    <div class="full-box tile-number text-titles">
                        <p class="full-box"><%= doctores%></p>
                        <small>Registros</small>
                    </div>
                </article>

                <!-- 3 -->
                <article class="full-box tile">
                    <div class="full-box tile-title text-center text-titles text-uppercase">
                       <a href="recepcionistas.jsp">RECEPCIONISTAS</a>
                    </div>
                    <div class="full-box tile-icon text-center">
                        <i class="zmdi zmdi-assignment-account"></i>
                    </div>
                    <div class="full-box tile-number text-titles">
                        <p class="full-box"><%= recepcionistas%></p>
                        <small>Registros</small>
                    </div>
                </article>

                <!-- 4 -->
                <article class="full-box tile">
                    <div class="full-box tile-title text-center text-titles text-uppercase">
                           <a href="pacientes.jsp">PACIENTES</a>
                    </div>
                    <div class="full-box tile-icon text-center">
                        <i class="zmdi zmdi-adb"></i> 
                        <%--<i class="zmdi zmdi-male-female"></i> 
                        <i  > <img src="./assets/img/huellita.png" alt="Paciente">
                        --%>
                    </div>
                    <div class="full-box tile-number text-titles">
                        <p class="full-box"><%= pacientes%></p>
                        <small>Registro</small>
                    </div>
                </article>

                <!-- 5 -->
                <article class="full-box tile">
                    <div class="full-box tile-title text-center text-titles text-uppercase">
                           <a href="consultas.jsp">CONSULTAS</a>
                    </div>
                    <div class="full-box tile-icon text-center">
                        <i class="zmdi zmdi-assignment"></i>
                    </div>
                    <div class="full-box tile-number text-titles">
                        <p class="full-box"><%= consultas%></p>
                        <small>Registro</small>
                    </div>
                </article>

                <!-- 6 -->
                <article class="full-box tile">
                    <div class="full-box tile-title text-center text-titles text-uppercase">
                           <a href="reservas.jsp">RESERVAS</a>
                    </div>
                    <div class="full-box tile-icon text-center">
                        <i class="zmdi zmdi-eyedropper"></i>
                    </div>
                    <div class="full-box tile-number text-titles">
                        <p class="full-box"><%= reservas%></p>
                        <small>Registro</small>
                    </div>
                </article>
            </div>
        </section>
        <jsp:include page="WEB-INF/Scripts.jsp"/>
    </body>
</html>

