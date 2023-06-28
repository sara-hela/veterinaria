package com.emergentes.controlador;

import com.emergentes.dao.ConsultaDAO;
import com.emergentes.dao.ConsultaDAOimpl;
import com.emergentes.dao.DoctorDAO;
import com.emergentes.dao.DoctorDAOimpl;
import com.emergentes.dao.PacienteDAO;
import com.emergentes.dao.PacienteDAOimpl;
import com.emergentes.modelo.Consulta;
import com.emergentes.modelo.Doctor;
import com.emergentes.modelo.Paciente;
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

@WebServlet(name = "ConsultaDeterminadaControlador", urlPatterns = {"/ConsultaDeterminadaControlador"})
public class ConsultaDeterminadaControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            ConsultaDAO dao = new ConsultaDAOimpl();
            DoctorDAO daoDoctor = new DoctorDAOimpl();
            PacienteDAO daoPaciente = new PacienteDAOimpl();

            int id;
            int id_paciente;
            String nom_paciente;
            String sex_paciente;
            List<Doctor> lista_doctores = null;
            List<Paciente> lista_pacientes = null;
            Consulta con = new Consulta();

            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            switch (action) {
                case "add":
                    id_paciente = Integer.parseInt(request.getParameter("id_paciente"));
                    sex_paciente = request.getParameter("sex_paciente");
                    nom_paciente = request.getParameter("nom_paciente");

                    lista_doctores = daoDoctor.getAll();
                    lista_pacientes = daoPaciente.getAll();

                    request.setAttribute("id_paciente", id_paciente);
                    request.setAttribute("sex_paciente", sex_paciente);
                    request.setAttribute("nom_paciente", nom_paciente);
                    request.setAttribute("action", action);
                    request.setAttribute("lista_doctores", lista_doctores);
                    request.setAttribute("lista_pacientes", lista_pacientes);

                    request.setAttribute("consulta", con);
                    request.getRequestDispatcher("frmConsultasDeterminadas.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    id_paciente = Integer.parseInt(request.getParameter("id_paciente"));
                    sex_paciente = request.getParameter("sex_paciente");
                    nom_paciente = request.getParameter("nom_paciente");
                    
                    con = dao.getById(id);

                    lista_doctores = daoDoctor.getAll();
                    lista_pacientes = daoPaciente.getAll();

                    request.setAttribute("id_paciente", id_paciente);
                    request.setAttribute("sex_paciente", sex_paciente);
                    request.setAttribute("nom_paciente", nom_paciente);
                    request.setAttribute("action", action);
                    request.setAttribute("lista_doctores", lista_doctores);
                    request.setAttribute("lista_pacientes", lista_pacientes);

                    request.setAttribute("consulta", con);
                    request.getRequestDispatcher("frmConsultasDeterminadas.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    id_paciente = Integer.parseInt(request.getParameter("id_paciente"));
                    sex_paciente = request.getParameter("sex_paciente");
                    nom_paciente = request.getParameter("nom_paciente");
                    
                    dao.delete(id);
                    
                    response.sendRedirect("ConsultaDeterminadaControlador?id_paciente=" + id_paciente + "&sex_paciente=" + sex_paciente + "&nom_paciente=" + nom_paciente);
                    break;
                case "view":
                    id_paciente = Integer.parseInt(request.getParameter("id_paciente"));
                    sex_paciente = request.getParameter("sex_paciente");
                    nom_paciente = request.getParameter("nom_paciente");

                    List<Consulta> lista = dao.getAll();

                    request.setAttribute("id_paciente", id_paciente);
                    request.setAttribute("sex_paciente", sex_paciente);
                    request.setAttribute("nom_paciente", nom_paciente);
                    request.setAttribute("action", action);
                    request.setAttribute("consultas", lista);
                    request.getRequestDispatcher("consultasDeterminadas.jsp").forward(request, response);
                    break;
            }
        } catch (Exception ex) {
            System.out.println("ERROR EN EL doGet:  " + ex.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
        String sex_paciente = request.getParameter("sex_paciente");
        String nom_paciente = request.getParameter("nom_paciente");

        int id = Integer.parseInt(request.getParameter("id"));
        int id_doctor = Integer.parseInt(request.getParameter("id_doctor"));
        int id_paciente = Integer.parseInt(request.getParameter("id_paciente"));
        String fecha = request.getParameter("fecha");
        String hora = request.getParameter("hora");        
        String sintomas = new String(request.getParameter("sintomas").getBytes("ISO-8859-1"),"UTF-8");
        String diagnostico = new String(request.getParameter("diagnostico").getBytes("ISO-8859-1"),"UTF-8");

        Consulta con = new Consulta();

        con.setId(id);
        con.setId_doctor(id_doctor);
        con.setId_paciente(id_paciente);
        con.setFecha(ConvertirFecha(fecha));
        con.setHora(ConvertirHora(hora));
        con.setSintomas(sintomas);
        con.setDiagnostico(diagnostico);

        ConsultaDAO dao = new ConsultaDAOimpl();
        if (id == 0) {
            //  NUEVO
            try {
                dao.insert(con);
            } catch (Exception ex) {
                System.out.println("ERROR AL INSERTAR REGISTRO:  " + ex.getMessage());
            }
        } else {
            //  EDITAR
            try {
                dao.update(con);
            } catch (Exception ex) {
                System.out.println("ERROR AL EDITAR REGISTRO:  " + ex.getMessage());
            }
        }
        response.sendRedirect("ConsultaDeterminadaControlador?id_paciente=" + id_paciente + "&sex_paciente=" + sex_paciente + "&nom_paciente=" + nom_paciente);
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
