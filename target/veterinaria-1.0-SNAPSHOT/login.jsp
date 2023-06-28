<%-- 
    Document   : login
    Created on : 26 jun. de 2023, 22:42:42
    Author     : Hela_Sara
--%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>VETERINARIA VIDA</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous"/>

    </head>
    <body class="bg-dark d-flex justify-content-center align-items-center vh-100">
        <form action="LoginControlador" method="POST" autocomplete="on" class="logInForm">
            <div class="bg-white p-5 rounded-5 text-secondary shadow" style="width: 25rem">
                <div class="d-flex justify-content-center">
                    <img src="assets/icons/login-icon.svg" alt="login-icon" style="height: 7rem"/>
                </div>
                <div class="text-center fs-1 fw-bold">LOGIN</div>
                <div class="input-group mt-4">
                    <div class="input-group-text bg-success">
                        <img src="assets/icons/username-icon.svg" alt="username-icon" style="height: 1rem"/>
                    </div>
                    <input class="form-control bg-light" name="usuario" type="text" placeholder="Username"/>
                </div>
                <div class="input-group mt-1">
                    <div class="input-group-text bg-success">
                        <img src="assets/icons/password-icon.svg" alt="password-icon" style="height: 1rem"/>
                    </div>
                    <input class="form-control bg-light" name="password" type="password" placeholder="Password"/>
                </div>
                <input type="submit" value="Iniciar sesion" class="btn btn-success text-white w-100 mt-4 fw-semibold shadow-sm">
            </div>
        </form>
    </body>
</html>

