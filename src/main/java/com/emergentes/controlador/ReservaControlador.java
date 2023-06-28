package com.emergentes.controlador;

import com.emergentes.dao.DoctorDAO;
import com.emergentes.dao.DoctorDAOimpl;
import com.emergentes.dao.PacienteDAO;
import com.emergentes.dao.PacienteDAOimpl;
import com.emergentes.dao.ReservaDAO;
import com.emergentes.dao.ReservaDAOimpl;
import com.emergentes.modelo.Doctor;
import com.emergentes.modelo.Paciente;
import com.emergentes.modelo.Reserva;
import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "ReservaControlador", urlPatterns = {"/ReservaControlador"})
public class ReservaControlador extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ReservaDAO dao = new ReservaDAOimpl();
            DoctorDAO daoDoctor = new DoctorDAOimpl();
            PacienteDAO daoPaciente = new PacienteDAOimpl();

            int id;
            List<Doctor> lista_doctores = null;
            List<Paciente> lista_pacientes = null;
            Reserva res = new Reserva();

            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            switch (action) {
                case "add":
                    lista_doctores = daoDoctor.getAll();
                    lista_pacientes = daoPaciente.getAll();

                    request.setAttribute("action", action);
                    request.setAttribute("lista_doctores", lista_doctores);
                    request.setAttribute("lista_pacientes", lista_pacientes);

                    request.setAttribute("reserva", res);
                    request.getRequestDispatcher("frmReservas.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    res = dao.getById(id);

                    lista_doctores = daoDoctor.getAll();
                    lista_pacientes = daoPaciente.getAll();

                    request.setAttribute("action", action);
                    request.setAttribute("lista_doctores", lista_doctores);
                    request.setAttribute("lista_pacientes", lista_pacientes);

                    request.setAttribute("reserva", res);
                    request.getRequestDispatcher("frmReservas.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("ReservaControlador");
                    break;
                case "view":
                    //  Obtener la lista de registro
                    List<Reserva> lista = dao.getAll();
                    request.setAttribute("action", action);
                    request.setAttribute("reservas", lista);
                    request.getRequestDispatcher("reservas.jsp").forward(request, response);
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
        int id_paciente = Integer.parseInt(request.getParameter("id_paciente"));
        int id_doctor = Integer.parseInt(request.getParameter("id_doctor"));
        String fecha = request.getParameter("fecha");
        String hora = request.getParameter("hora");
        String observacion = new String(request.getParameter("observacion").getBytes("ISO-8859-1"),"UTF-8");

        Reserva res = new Reserva();

        res.setId(id);
        res.setId_paciente(id_paciente);
        res.setId_doctor(id_doctor);
        res.setFecha(ConvertirFecha(fecha));
        res.setHora(ConvertirHora(hora));
        res.setObservacion(observacion);

        ReservaDAO dao = new ReservaDAOimpl();
        if (id == 0) {
            //  NUEVO
            try {
                dao.insert(res);
            } catch (Exception ex) {
                System.out.println("ERROR AL INSERTAR REGISTRO:  " + ex.getMessage());
            }
        } else {
            //  EDITAR
            try {
                dao.update(res);
            } catch (Exception ex) {
                System.out.println("ERROR AL EDITAR REGISTRO:  " + ex.getMessage());
            }
        }
        response.sendRedirect("ReservaControlador");
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

    public Time ConvertirHora(String fecha) {
        Time horaBD = null;
        SimpleDateFormat formato = new SimpleDateFormat("HH:mm");

        java.util.Date horaTMP;
        try {
            horaTMP = formato.parse(fecha);
            horaBD = new Time(horaTMP.getTime());
        } catch (ParseException ex) {
            System.out.println("ERROR AL CONVERTIR HORA:  " + ex.getMessage());
        }

        return horaBD;
    }
}
