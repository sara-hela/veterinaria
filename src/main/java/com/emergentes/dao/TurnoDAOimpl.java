package com.emergentes.dao;

import com.emergentes.modelo.Turno;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class TurnoDAOimpl extends ConexionDB implements TurnoDAO{

    @Override
    public void insert(Turno turno) throws Exception {
        String sql = "INSERT INTO TURNOS (turno, hora_inicio, hora_final) VALUES (?, ?, ?)";
        try {
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, turno.getTurno());
            ps.setTime(2, turno.getHora_inicio());
            ps.setTime(3, turno.getHora_final());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }
    }

    @Override
    public void update(Turno turno) throws Exception {
        String sql = "UPDATE TURNOS SET turno=?, hora_inicio=?, hora_final=? WHERE id=?";
        try {
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, turno.getTurno());
            ps.setTime(2, turno.getHora_inicio());
            ps.setTime(3, turno.getHora_final());
            ps.setInt(4, turno.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        String sql = "DELETE FROM TURNOS WHERE id=?";
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
    public Turno getById(int id) throws Exception {
        Turno tur = new Turno();
        try {
            String sql = "SELECT * FROM TURNOS WHERE id=?";
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                tur.setId(rs.getInt("id"));
                tur.setTurno(rs.getString("turno"));
                tur.setHora_inicio(rs.getTime("hora_inicio"));
                tur.setHora_final(rs.getTime("hora_final"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }

        return tur;
    }

    @Override
    public List<Turno> getAll() throws Exception {
        List<Turno> lista = null;
        try {
            String sql = "SELECT * FROM turnos";
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Turno>();
            while (rs.next()) {
                Turno tur = new Turno();
                tur.setId(rs.getInt("id"));
                tur.setTurno(rs.getString("turno"));
                tur.setHora_inicio(rs.getTime("hora_inicio"));
                tur.setHora_final(rs.getTime("hora_final"));
                
                lista.add(tur);
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
