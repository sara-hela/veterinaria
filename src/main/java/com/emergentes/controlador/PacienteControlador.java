package com.emergentes.controlador;

import com.emergentes.dao.PacienteDAO;
import com.emergentes.dao.PacienteDAOimpl;
import com.emergentes.dao.RecepcionistaDAO;
import com.emergentes.dao.RecepcionistaDAOimpl;
import com.emergentes.modelo.Paciente;
import com.emergentes.modelo.Recepcionista;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "PacienteControlador", urlPatterns = {"/PacienteControlador"})
public class PacienteControlador extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id;
            
            PacienteDAO dao = new PacienteDAOimpl();
            RecepcionistaDAO daoRecepcionista = new RecepcionistaDAOimpl();
            
            
            List<Recepcionista> lista_recepcionistas = null;
            Paciente pac = new Paciente();
            
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            
            switch(action){
                case "add":
                    lista_recepcionistas = daoRecepcionista.getAll();
                    
                    request.setAttribute("action", action);
                    request.setAttribute("lista_recepcionistas", lista_recepcionistas);
                    request.setAttribute("paciente", pac);
                    
                    request.getRequestDispatcher("frmPacientes.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    pac = dao.getById(id);
                    
                    lista_recepcionistas = daoRecepcionista.getAll();
                    
                    request.setAttribute("action", action);
                    request.setAttribute("lista_recepcionistas", lista_recepcionistas);
                    request.setAttribute("paciente", pac);
                    
                    request.getRequestDispatcher("frmPacientes.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("PacienteControlador");
                    break;
                case "view":
                    //  Obtener la lista de registro
                    List<Paciente> lista = dao.getAll();
                    request.setAttribute("pacientes", lista);
                    request.getRequestDispatcher("pacientes.jsp").forward(request, response);
                    break;
            }
        } catch (Exception ex) {
            System.out.println("ERROR EN doGET:  "+ex.getMessage());
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = new String(request.getParameter("nombre").getBytes("ISO-8859-1"),"UTF-8");
        String raza = new String(request.getParameter("raza").getBytes("ISO-8859-1"),"UTF-8");
        int edad = Integer.parseInt(request.getParameter("edad"));
        String color = new String(request.getParameter("color").getBytes("ISO-8859-1"),"UTF-8");
        String rasgos = new String(request.getParameter("rasgos").getBytes("ISO-8859-1"),"UTF-8");
        String sexo = new String(request.getParameter("sexo").getBytes("ISO-8859-1"),"UTF-8");
        int id_responsable = Integer.parseInt(request.getParameter("id_responsable"));
        String tipo_animal = new String(request.getParameter("tipo_animal").getBytes("ISO-8859-1"),"UTF-8");

        Paciente pac = new Paciente();

        pac.setId(id);
        pac.setNombre(nombre);
        pac.setRaza(raza);
        pac.setEdad(edad);
        pac.setColor(color);
        pac.setRasgos(rasgos);
        pac.setSexo(sexo);
        pac.setId_responsable(id_responsable);
        pac.setTipo_animal(tipo_animal);
        
        PacienteDAO dao = new PacienteDAOimpl();
        if (id == 0) {
            //  NUEVO
            try {
                dao.insert(pac);
            } catch (Exception ex) {
                System.out.println("ERROR AL INSERTAR REGISTRO:  " + ex.getMessage());
            }
        } else {
            //  EDITAR
            try {
                dao.update(pac);
            } catch (Exception ex) {
                System.out.println("ERROR AL EDITAR REGISTRO:  " + ex.getMessage());
            }
        }
        response.sendRedirect("PacienteControlador");
    }
    
    public Date ConvertirFecha(String fecha) {
        Date fechaBD = null;
        SimpleDateFormat formato = new SimpleDateFormat("yyyy-MM-dd");

        java.util.Date fechaTMP;
        try {
            fechaTMP = formato.parse(fecha);
            fechaBD = new Date(fechaTMP.getTime());
        } catch (ParseException ex) {
            System.out.println("ERROR AL CONVERTIR FECHA:  " + ex.getMessage());
        }

        return fechaBD;
    }
}
