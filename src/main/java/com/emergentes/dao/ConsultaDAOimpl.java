package com.emergentes.dao;

import com.emergentes.modelo.Consulta;
import com.emergentes.utiles.ConexionDB;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ConsultaDAOimpl extends ConexionDB implements ConsultaDAO {

    @Override
    public void insert(Consulta consulta) throws Exception {
        String sql = "INSERT INTO CONSULTAS (id_doctor, id_paciente, fecha, hora, sintomas, diagnostico) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, consulta.getId_doctor());
            ps.setInt(2, consulta.getId_paciente());
            ps.setDate(3, (Date) consulta.getFecha());
            ps.setTime(4, consulta.getHora());
            ps.setString(5, consulta.getSintomas());
            ps.setString(6, consulta.getDiagnostico());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }
    }

    @Override
    public void update(Consulta consulta) throws Exception {
        String sql = "UPDATE CONSULTAS SET id_doctor=?, id_paciente=?, fecha=?, hora=?, sintomas=?, diagnostico=? WHERE id=?";
        try {
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, consulta.getId_doctor());
            ps.setInt(2, consulta.getId_paciente());
            ps.setDate(3, (Date) consulta.getFecha());
            ps.setTime(4, consulta.getHora());
            ps.setString(5, consulta.getSintomas());
            ps.setString(6, consulta.getDiagnostico());
            ps.setInt(7, consulta.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        String sql = "DELETE FROM CONSULTAS WHERE id=?";
        try {
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }
    }

    @Override
    public Consulta getById(int id) throws Exception {
        Consulta con = new Consulta();
        try {
            String sql = "SELECT * FROM CONSULTAS WHERE id=?";
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                con.setId(rs.getInt("id"));
                con.setId_doctor(rs.getInt("id_doctor"));
                con.setId_paciente(rs.getInt("id_paciente"));
                con.setFecha(rs.getDate("fecha"));
                con.setHora(rs.getTime("hora"));
                con.setSintomas(rs.getString("sintomas"));
                con.setDiagnostico(rs.getString("diagnostico"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }

        return con;
    }

    @Override
    public List<Consulta> getAll() throws Exception {
        List<Consulta> lista = null;
        try {
            String sql = "SELECT C.*, CONCAT_WS(' ', D.nombre, D.ap_paterno, D.ap_materno) AS doctor, ";
            sql += "CONCAT_WS(' ', P.nombre, P.ap_paterno, P.ap_materno) AS paciente, P.sexo AS sex_paciente ";
            sql += "FROM CONSULTAS C LEFT JOIN DOCTORES D ON C.id_doctor = D.id LEFT JOIN PACIENTE P ON C.id_paciente = P.id";
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Consulta>();
            while (rs.next()) {
                Consulta con = new Consulta();
                con.setId(rs.getInt("id"));
                con.setId_doctor(rs.getInt("id_doctor"));
                con.setId_paciente(rs.getInt("id_paciente"));
                con.setFecha(rs.getDate("fecha"));
                con.setHora(rs.getTime("hora"));
                con.setSintomas(rs.getString("sintomas"));
                con.setDiagnostico(rs.getString("diagnostico"));
                
                lista.add(con);
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }

        return lista;
    }
    
}
