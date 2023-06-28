package com.emergentes.controlador;

import com.emergentes.dao.ConsultaDAO;
import com.emergentes.dao.ConsultaDAOimpl;
import com.emergentes.dao.DoctorDAO;
import com.emergentes.dao.DoctorDAOimpl;
import com.emergentes.dao.PacienteDAO;
import com.emergentes.dao.PacienteDAOimpl;
import com.emergentes.dao.RecetaDAO;
import com.emergentes.dao.RecetaDAOimpl;
import com.emergentes.modelo.Consulta;
import com.emergentes.modelo.Doctor;
import com.emergentes.modelo.Paciente;
import com.emergentes.modelo.Receta;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "RecetaDeterminadaControlador", urlPatterns = {"/RecetaDeterminadaControlador"})
public class RecetaDeterminadaControlador extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            RecetaDAO dao = new RecetaDAOimpl();
            DoctorDAO daoDoctor = new DoctorDAOimpl();
            PacienteDAO daoPaciente = new PacienteDAOimpl();
            ConsultaDAO daoConsulta = new ConsultaDAOimpl();

            int id;
            int id_consulta;
            String paciente;
            String sex_paciente;
            List<Doctor> lista_doctores = null;
            List<Paciente> lista_pacientes = null;
            List<Consulta> lista_consultas = null;
            Receta rec = new Receta();

            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";

            switch (action) {
                case "add":
                    id_consulta = Integer.parseInt(request.getParameter("id_consulta"));
                    paciente = request.getParameter("paciente");
                    sex_paciente = request.getParameter("sex_paciente");

                    lista_doctores = daoDoctor.getAll();
                    lista_pacientes = daoPaciente.getAll();
                    lista_consultas = daoConsulta.getAll();

                    request.setAttribute("id_consulta", id_consulta);
                    request.setAttribute("paciente", paciente);
                    request.setAttribute("sex_paciente", sex_paciente);
                    request.setAttribute("action", action);
                    request.setAttribute("lista_doctores", lista_doctores);
                    request.setAttribute("lista_pacientes", lista_pacientes);
                    request.setAttribute("lista_consultas", lista_consultas);

                    request.setAttribute("receta", rec);
                    request.getRequestDispatcher("frmRecetasDeterminadas.jsp").forward(request, response);
                    break;
                case "edit":
                    id_consulta = Integer.parseInt(request.getParameter("id_consulta"));
                    paciente = request.getParameter("paciente");
                    sex_paciente = request.getParameter("sex_paciente");

                    id = Integer.parseInt(request.getParameter("id"));
                    rec = dao.getById(id);

                    lista_doctores = daoDoctor.getAll();
                    lista_pacientes = daoPaciente.getAll();
                    lista_consultas = daoConsulta.getAll();

                    request.setAttribute("id_consulta", id_consulta);
                    request.setAttribute("paciente", paciente);
                    request.setAttribute("sex_paciente", sex_paciente);
                    request.setAttribute("action", action);
                    request.setAttribute("lista_doctores", lista_doctores);
                    request.setAttribute("lista_pacientes", lista_pacientes);
                    request.setAttribute("lista_consultas", lista_consultas);

                    request.setAttribute("receta", rec);
                    request.getRequestDispatcher("frmRecetasDeterminadas.jsp").forward(request, response);
                    break;
                case "delete":
                    id_consulta = Integer.parseInt(request.getParameter("id_consulta"));
                    paciente = request.getParameter("paciente");
                    sex_paciente = request.getParameter("sex_paciente");

                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("RecetaDeterminadaControlador?id_consulta=" + id_consulta + "&paciente=" + paciente +"&sex_paciente="+ sex_paciente);
                    break;
                case "view":
                    id_consulta = Integer.parseInt(request.getParameter("id_consulta"));
                    paciente = request.getParameter("paciente");
                    sex_paciente = request.getParameter("sex_paciente");

                    //  Obtener la lista de registro
                    List<Receta> lista = dao.getAll();

                    request.setAttribute("id_consulta", id_consulta);
                    request.setAttribute("paciente", paciente);
                    request.setAttribute("sex_paciente", sex_paciente);
                    request.setAttribute("action", action);
                    request.setAttribute("recetas", lista);
                    request.getRequestDispatcher("recetasDeterminadas.jsp").forward(request, response);
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
        int id_consulta = Integer.parseInt(request.getParameter("id_consulta"));
        String medicamento = new String(request.getParameter("medicamento").getBytes("ISO-8859-1"),"UTF-8");
        String dosis = new String(request.getParameter("dosis").getBytes("ISO-8859-1"),"UTF-8");
        String indicaciones = new String(request.getParameter("indicaciones").getBytes("ISO-8859-1"),"UTF-8");
        String paciente = new String(request.getParameter("paciente").getBytes("ISO-8859-1"),"UTF-8");
        String sex_paciente = request.getParameter("sex_paciente");

        Receta rec = new Receta();

        rec.setId(id);
        rec.setId_consulta(id_consulta);
        rec.setMedicamento(medicamento);
        rec.setDosis(dosis);
        rec.setIndicaciones(indicaciones);

        RecetaDAO dao = new RecetaDAOimpl();
        if (id == 0) {
            //  NUEVO
            try {
                dao.insert(rec);
            } catch (Exception ex) {
                System.out.println("ERROR AL INSERTAR REGISTRO:  " + ex.getMessage());
            }
        } else {
            //  EDITAR
            try {
                dao.update(rec);
            } catch (Exception ex) {
                System.out.println("ERROR AL EDITAR REGISTRO:  " + ex.getMessage());
            }
        }
        response.sendRedirect("RecetaDeterminadaControlador?id_consulta=" + id_consulta + "&paciente=" + paciente + "&sex_paciente="+ sex_paciente);
    }
}
