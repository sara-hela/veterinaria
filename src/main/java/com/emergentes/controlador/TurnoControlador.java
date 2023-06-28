package com.emergentes.controlador;

import com.emergentes.dao.TurnoDAO;
import com.emergentes.dao.TurnoDAOimpl;
import com.emergentes.modelo.Turno;
import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "TurnoControlador", urlPatterns = {"/TurnoControlador"})
public class TurnoControlador extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Turno tur = new Turno();
            int id;
            TurnoDAO dao = new TurnoDAOimpl();
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            switch(action){
                case "add":
                    request.setAttribute("action", action);
                    request.setAttribute("turno", tur);
                    
                    request.getRequestDispatcher("frmTurnos.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    tur = dao.getById(id);
                    
                    request.setAttribute("action", action);
                    request.setAttribute("turno", tur);
                    
                    request.getRequestDispatcher("frmTurnos.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("TurnoControlador");
                    break;
                case "view":
                    //  Obtener la lista de registro
                    List<Turno> lista = dao.getAll();
                    request.setAttribute("turnos", lista);
                    request.getRequestDispatcher("turnos.jsp").forward(request, response);
                    break;
            }
        } catch (Exception ex) {
            System.out.println("ERROR EN EL doGet:  "+ex.getMessage());
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String turno = new String(request.getParameter("turno").getBytes("ISO-8859-1"),"UTF-8");
        String hora_inicio = request.getParameter("hora_inicio");
        String hora_final = request.getParameter("hora_final");
        
        Turno tur = new Turno();
        
        tur.setId(id);
        tur.setTurno(turno);
        tur.setHora_inicio(ConvertirHora(hora_inicio));
        tur.setHora_final(ConvertirHora(hora_final));
        
        TurnoDAO dao = new TurnoDAOimpl();
        if(id == 0){
            //  NUEVO
            try {
                dao.insert(tur);
            } catch (Exception ex) {
                System.out.println("ERROR AL INSERTAR REGISTRO:  " + ex.getMessage());
            }
        } else {
            //  EDITAR
            try {
                dao.update(tur);
            } catch (Exception ex) {
                System.out.println("ERROR AL EDITAR REGISTRO:  " + ex.getMessage());
            }
        }
        response.sendRedirect("TurnoControlador");
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
