package com.emergentes.dao;

import com.emergentes.modelo.Reserva;
import com.emergentes.utiles.ConexionDB;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReservaDAOimpl extends ConexionDB implements ReservaDAO{

    @Override
    public void insert(Reserva reserva) throws Exception {
        String sql = "INSERT INTO RESERVAS (id_paciente, id_doctor, fecha, hora, observacion) VALUES (?, ?, ?, ?, ?)";
        try {
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, reserva.getId_paciente());
            ps.setInt(2, reserva.getId_doctor());
            ps.setDate(3, (Date) reserva.getFecha());
            ps.setTime(4, reserva.getHora());
            ps.setString(5, reserva.getObservacion());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }
    }

    @Override
    public void update(Reserva reserva) throws Exception {
        String sql = "UPDATE RESERVAS SET id_paciente=?, id_doctor=?, fecha=?, hora=?, observacion=? WHERE id=?";
        try {
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, reserva.getId_paciente());
            ps.setInt(2, reserva.getId_doctor());
            ps.setDate(3, (Date) reserva.getFecha());
            ps.setTime(4, reserva.getHora());
            ps.setString(5, reserva.getObservacion());
            ps.setInt(6, reserva.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        String sql = "DELETE FROM RESERVAS WHERE id=?";
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
    public Reserva getById(int id) throws Exception {
        Reserva res = new Reserva();
        try {
            String sql = "SELECT * FROM RESERVAS WHERE id=?";
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                res.setId(rs.getInt("id"));
                res.setId_paciente(rs.getInt("id_paciente"));
                res.setId_doctor(rs.getInt("id_doctor"));
                res.setFecha(rs.getDate("fecha"));
                res.setHora(rs.getTime("hora"));
                res.setObservacion(rs.getString("observacion"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }

        return res;
    }

    @Override
    public List<Reserva> getAll() throws Exception {
        List<Reserva> lista = null;
        try {
            String sql = "SELECT R.*, CONCAT_WS(' ', P.nombre, P.ap_paterno, P.ap_materno) AS paciente, ";
            sql += "CONCAT_WS(' ', D.nombre, D.ap_paterno, D.ap_materno) AS doctor FROM RESERVAS R ";
            sql += "LEFT JOIN PACIENTE P ON R.id_paciente=P.id LEFT JOIN DOCTORES D ON R.id_doctor=D.id";
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Reserva>();
            while (rs.next()) {
                Reserva res = new Reserva();
                res.setId(rs.getInt("id"));
                res.setId_paciente(rs.getInt("id_paciente"));
                res.setId_doctor(rs.getInt("id_doctor"));
                res.setFecha(rs.getDate("fecha"));
                res.setHora(rs.getTime("hora"));
                res.setObservacion(rs.getString("observacion"));
   
                
                lista.add(res);
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
