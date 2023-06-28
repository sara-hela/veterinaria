package com.emergentes.controlador;

import com.emergentes.dao.DoctorDAO;
import com.emergentes.dao.DoctorDAOimpl;
import com.emergentes.dao.TurnoDAO;
import com.emergentes.dao.TurnoDAOimpl;
import com.emergentes.modelo.Doctor;
import com.emergentes.modelo.Turno;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "DoctorControlador", urlPatterns = {"/DoctorControlador"})
public class DoctorControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id;
            DoctorDAO dao = new DoctorDAOimpl();
            TurnoDAO daoTurno = new TurnoDAOimpl();
            
            List<Turno> lista_turnos = null;
     
            Doctor doc = new Doctor();

            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            switch (action) {
                case "add":
                    lista_turnos = daoTurno.getAll();

                    request.setAttribute("action", action);
                    request.setAttribute("lista_turnos", lista_turnos);

                    request.setAttribute("doctor", doc);
                    request.getRequestDispatcher("frmDoctores.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    doc = dao.getById(id);

                    lista_turnos = daoTurno.getAll();

                    request.setAttribute("action", action);
                    request.setAttribute("lista_turnos", lista_turnos);

                    request.setAttribute("doctor", doc);
                    request.getRequestDispatcher("frmDoctores.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("DoctorControlador");
                    break;
                case "view":
                    //  Obtener la lista de registro
                    List<Doctor> lista = dao.getAll();
                    request.setAttribute("doctores", lista);
                    request.getRequestDispatcher("doctores.jsp").forward(request, response);
                    break;
            }
        } catch (Exception ex) {
            System.out.println("ERROR EN EL doGet:  " + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {        
        int id = Integer.parseInt(request.getParameter("id"));
        int ci = Integer.parseInt(request.getParameter("ci"));
        String nombre = new String(request.getParameter("nombre").getBytes("ISO-8859-1"),"UTF-8");
        String paterno = new String(request.getParameter("paterno").getBytes("ISO-8859-1"),"UTF-8");
        String materno = new String(request.getParameter("materno").getBytes("ISO-8859-1"),"UTF-8");
        String fecha_nacimiento = request.getParameter("fecha_nacimiento");
        String sexo = request.getParameter("sexo");
        int telefono = Integer.parseInt(request.getParameter("telefono"));
        String direccion = new String(request.getParameter("direccion").getBytes("ISO-8859-1"),"UTF-8");
        String ciudad = new String(request.getParameter("ciudad").getBytes("ISO-8859-1"),"UTF-8");
        String correo = request.getParameter("correo");
        int id_turno = Integer.parseInt(request.getParameter("id_turno"));

        Doctor doc = new Doctor();

        doc.setId(id);
        doc.setCi(ci);
        doc.setNombre(nombre);
        doc.setPaterno(paterno);
        doc.setMaterno(materno);
        doc.setFecha_nacimiento(ConvertirFecha(fecha_nacimiento));
        doc.setSexo(sexo);
        doc.setTelefono(telefono);
        doc.setDireccion(direccion);
        doc.setCiudad(ciudad);
        doc.setCorreo(correo);
        doc.setId_turno(id_turno);
        
        DoctorDAO dao = new DoctorDAOimpl();
        if(id == 0){
            //  NUEVO
            try {
                dao.insert(doc);
            } catch (Exception ex) {
                System.out.println("ERROR AL INSERTAR REGISTRO  DE DOCTOR:  " + ex.getMessage());
            }
        } else {
            //  EDITAR
            try {
                dao.update(doc);
            } catch (Exception ex) {
                System.out.println("ERROR AL EDITAR REGISTRO DE DOCTOR:  " + ex.getMessage());
            }
        }
        response.sendRedirect("DoctorControlador");
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
