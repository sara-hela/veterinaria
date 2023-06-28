package com.emergentes.controlador;

import com.emergentes.dao.RecepcionistaDAO;
import com.emergentes.dao.RecepcionistaDAOimpl;
import com.emergentes.dao.TurnoDAO;
import com.emergentes.dao.TurnoDAOimpl;
import com.emergentes.modelo.Recepcionista;
import com.emergentes.modelo.Turno;
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

@WebServlet(name = "RecepcionistaControlador", urlPatterns = {"/RecepcionistaControlador"})
public class RecepcionistaControlador extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            RecepcionistaDAO dao = new RecepcionistaDAOimpl();
            TurnoDAO daoTurno = new TurnoDAOimpl();
            int id;
            List<Turno> lista_turnos = null;
            Recepcionista res = new Recepcionista();
            
            String action = (request.getParameter("action") != null) ? request.getParameter("action") : "view";
            
            switch(action){
                case "add":
                    lista_turnos = daoTurno.getAll();
                    
                    request.setAttribute("action", action);
                    request.setAttribute("lista_turnos", lista_turnos);

                    request.setAttribute("recepcionista", res);
                    request.getRequestDispatcher("frmRecepcionistas.jsp").forward(request, response);
                    break;
                case "edit":
                    id = Integer.parseInt(request.getParameter("id"));
                    res = dao.getById(id);
                    
                    lista_turnos = daoTurno.getAll();

                    
                    request.setAttribute("action", action);
                    request.setAttribute("lista_turnos", lista_turnos);
                    
                    request.setAttribute("recepcionista", res);
                    request.getRequestDispatcher("frmRecepcionistas.jsp").forward(request, response);
                    break;
                case "delete":
                    id = Integer.parseInt(request.getParameter("id"));
                    dao.delete(id);
                    response.sendRedirect("RecepcionistaControlador");
                    break;
                case "view":
                    //  Obtener la lista de registro
                    List<Recepcionista> lista = dao.getAll();
                    request.setAttribute("recepcionistas", lista);
                    request.getRequestDispatcher("recepcionistas.jsp").forward(request, response);
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

        Recepcionista res = new Recepcionista();

        res.setId(id);
        res.setCi(ci);
        res.setNombre(nombre);
        res.setPaterno(paterno);
        res.setMaterno(materno);
        res.setFecha_nacimiento(ConvertirFecha(fecha_nacimiento));
        res.setSexo(sexo);
        res.setTelefono(telefono);
        res.setDireccion(direccion);
        res.setCiudad(ciudad);
        res.setCorreo(correo);
        res.setId_turno(id_turno);
        
        RecepcionistaDAO dao = new RecepcionistaDAOimpl();
        if(id == 0){
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
        response.sendRedirect("RecepcionistaControlador");
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
