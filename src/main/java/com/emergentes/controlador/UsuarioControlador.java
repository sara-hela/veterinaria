package com.emergentes.controlador;

import com.emergentes.dao.DoctorDAO;
import com.emergentes.dao.DoctorDAOimpl;
import com.emergentes.dao.RecepcionistaDAO;
import com.emergentes.dao.RecepcionistaDAOimpl;
import com.emergentes.dao.RolDAO;
import com.emergentes.dao.RolDAOimpl;
import com.emergentes.dao.UsuarioDAO;
import com.emergentes.dao.UsuarioDAOimpl;
import com.emergentes.modelo.Doctor;
import com.emergentes.modelo.Recepcionista;
import com.emergentes.modelo.Rol;
import com.emergentes.modelo.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "UsuarioControlador", urlPatterns = {"/UsuarioControlador"})
public class UsuarioControlador extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id;
            Usuario usu = new Usuario();
            
            UsuarioDAO dao = new UsuarioDAOimpl();
            RolDAO daoRol = new RolDAOimpl();
            DoctorDAO daoDoctor = new DoctorDAOimpl();
            RecepcionistaDAO daoRecepcionista = new RecepcionistaDAOimpl();
            
            
            List<Rol> lista_roles = null;
            List<Doctor> lista_doctores = null;
            List<Recepcionista> lista_recepcionistas = null;
           
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch(action){
                case "add":
                    lista_roles = daoRol.getAll();
                    
                    request.setAttribute("action", action);
                    request.setAttribute("lista_roles", lista_roles);
                    request.setAttribute("lista_doctores", lista_doctores);
                    request.setAttribute("lista_recepcionistas", lista_recepcionistas);
                    request.setAttribute("usuario", usu);
                    
                    request.getRequestDispatcher("frmUsuarios.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    usu = dao.getById(id);
                    
                    lista_roles = daoRol.getAll();
                    
                    request.setAttribute("action", action);
                    request.setAttribute("lista_roles", lista_roles);
                    request.setAttribute("lista_doctores", lista_doctores);
                    request.setAttribute("lista_recepcionistas", lista_recepcionistas);
                    request.setAttribute("usuario", usu);
                    
                    request.getRequestDispatcher("frmUsuarios.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("UsuarioControlador");
                    break;
                case "view":
                    //  Obtener la lista de registro
                    List<Usuario> lista = dao.getAll();
                    
                    request.setAttribute("action", action);
                    request.setAttribute("usuarios", lista);
                    
                    request.getRequestDispatcher("usuarios.jsp").forward(request, response);
                    break;
            }
        } catch (Exception ex) {
            System.out.println("ERROR EN EL doGet:  "+ex.getMessage());
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        int id = Integer.parseInt(request.getParameter("id"));
        String usuario = request.getParameter("usuario");
        String password = request.getParameter("password");
        int id_rol = Integer.parseInt(request.getParameter("id_rol"));
        
        Usuario usu = new Usuario();
        usu.setId(id);
        usu.setUsuario(usuario);
        usu.setPassword(password);
        usu.setId_rol(id_rol);
        
        UsuarioDAO dao = new UsuarioDAOimpl();
        if (action.equals("add")) {
            try {
                //  NUEVO REGISTRO
                dao.insert(usu);
            } catch (Exception ex) {
                System.out.println("ERROR AL INSERTAR REGISTRO:  "+ex.getMessage());
            }
        } else {
            try {
                //  EDICION DE REGISTRO
                dao.update(usu);
            } catch (Exception ex) {
                System.out.println("ERROR AL EDITAR REGISTRO:  "+ex.getMessage());
            }
        }
        response.sendRedirect("UsuarioControlador");
    }
}
