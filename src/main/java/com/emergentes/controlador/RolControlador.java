package com.emergentes.controlador;

import com.emergentes.dao.RolDAO;
import com.emergentes.dao.RolDAOimpl;
import com.emergentes.modelo.Rol;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RolControlador", urlPatterns = {"/RolControlador"})
public class RolControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Rol rol = new Rol();
            int id;
            RolDAO dao = new RolDAOimpl();
            //  Obtener la lista de registro
            List<Rol> lista = dao.getAll();
            request.setAttribute("roles", lista);
            request.getRequestDispatcher("roles.jsp").forward(request, response);
        } catch (Exception ex) {
            System.out.println("ERROR EN EL doGet:  " + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}
