package com.emergentes.controlador;

import com.emergentes.utiles.ConexionDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginControlador", urlPatterns = {"/LoginControlador"})
public class LoginControlador extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        action = (request.getParameter("action") == null) ? "view" : request.getParameter("action");
        if(action.equals("logout")){
            HttpSession ses = request.getSession();
            ses.invalidate();
        }
        response.sendRedirect("login.jsp");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String usuario = request.getParameter("usuario");
            String password = request.getParameter("password");
            //String sql = "SELECT * FROM USUARIOS WHERE usuario=? AND contraseña=md5(?)";
            
            String sql = "SELECT U.*, R.rol AS rol, CONCAT_WS(' ', D.nombre, D.ap_paterno, D.ap_materno) AS nombre ";
            sql += "FROM USUARIOS U LEFT JOIN ROLES R ON U.id_rol = R.id LEFT JOIN DOCTORES D ON U.id = D.id ";
            sql += "WHERE nombre IS NOT NULL AND U.usuario=? AND U.contraseña=md5(?) ";
            sql += "UNION ";
            sql += "SELECT U.*, R.rol AS rol, CONCAT_WS(' ', RE.nombre, RE.ap_paterno, RE.ap_materno) AS nombre ";
            sql += "FROM USUARIOS U LEFT JOIN ROLES R ON U.id_rol = R.id LEFT JOIN RECEPCIONISTAS RE ON U.id = RE.id ";
            sql += "WHERE nombre IS NOT NULL AND U.usuario=? AND U.contraseña=md5(?) ";

            ResultSet rs;
            
            ConexionDB canal = new ConexionDB();
            Connection cn = canal.Conectar();
            
            PreparedStatement ps = cn.prepareStatement(sql);
            ps.setString(1, usuario);
            ps.setString(2, password);
            ps.setString(3, usuario);
            ps.setString(4, password);

            rs = ps.executeQuery();
            if(rs.next()){
                //  CREAR VARIABLES DE SESION
                HttpSession ses = request.getSession();
                ses.setAttribute("logueado", "OK");
                ses.setAttribute("id_usuario", rs.getInt("id"));
                ses.setAttribute("rol", rs.getString("rol"));
                ses.setAttribute("nombre", rs.getString("nombre"));
                
                response.sendRedirect("login.jsp");
            } else {
                response.sendRedirect("index.jsp");
            }
        } catch (SQLException ex) {
            System.out.println("ERROR AL CONECTAR A LA BASE DE DATOS:  "+ ex.getMessage());
        }
    }
}
