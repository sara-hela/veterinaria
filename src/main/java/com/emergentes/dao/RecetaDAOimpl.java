package com.emergentes.dao;

import com.emergentes.modelo.Receta;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RecetaDAOimpl extends ConexionDB implements RecetaDAO {

    @Override
    public void insert(Receta receta) throws Exception {
        String sql = "INSERT INTO RECETAS (id_consulta, medicamento, dosis, indicaciones) VALUES (?, ?, ?, ?)";
        try {
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, receta.getId_consulta());
            ps.setString(2, receta.getMedicamento());
            ps.setString(3, receta.getDosis());
            ps.setString(4, receta.getIndicaciones());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }
    }

    @Override
    public void update(Receta receta) throws Exception {
        String sql = "UPDATE RECETAS SET id_consulta=?, medicamento=?, dosis=?, indicaciones=? WHERE id=?";
        try {
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, receta.getId_consulta());
            ps.setString(2, receta.getMedicamento());
            ps.setString(3, receta.getDosis());
            ps.setString(4, receta.getIndicaciones());
            ps.setInt(5, receta.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        String sql = "DELETE FROM RECETAS WHERE id=?";
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
    public Receta getById(int id) throws Exception {
        Receta rec = new Receta();
        try {
            String sql = "SELECT R.*, CONCAT_WS(' ', D.nombre, D.ap_paterno, D.ap_materno) AS doctor, ";
            sql += "CONCAT_WS(' ', P.nombre, P.ap_paterno, P.ap_materno) AS paciente, P.sexo AS sex_paciente ";
            sql += "FROM RECETAS R LEFT JOIN CONSULTAS C ON R.id_consulta=C.id LEFT JOIN DOCTORES D ON C.id_doctor=D.id ";
            sql += "LEFT JOIN PACIENTE P ON C.id_paciente=P.id WHERE R.id=?";
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                rec.setId(rs.getInt("id"));
                rec.setId_consulta(rs.getInt("id_consulta"));
                rec.setMedicamento(rs.getString("medicamento"));
                rec.setDosis(rs.getString("dosis"));
                rec.setIndicaciones(rs.getString("indicaciones"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }

        return rec;
    }

    @Override
    public List<Receta> getAll() throws Exception {
        List<Receta> lista = null;
        try {
            String sql = "SELECT R.*, CONCAT_WS(' ', D.nombre, D.ap_paterno, D.ap_materno) AS doctor, ";
            sql += "CONCAT_WS(' ', P.nombre, P.ap_paterno, P.ap_materno) AS paciente ";
            sql += "FROM RECETAS R LEFT JOIN CONSULTAS C ON R.id_consulta=C.id LEFT JOIN DOCTORES D ON C.id_doctor=D.id ";
            sql += "LEFT JOIN PACIENTE P ON C.id_paciente=P.id";
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Receta>();
            while (rs.next()) {
                Receta rec = new Receta();
                rec.setId(rs.getInt("id"));
                rec.setId_consulta(rs.getInt("id_consulta"));
                rec.setMedicamento(rs.getString("medicamento"));
                rec.setDosis(rs.getString("dosis"));
                rec.setIndicaciones(rs.getString("indicaciones"));
                
                lista.add(rec);
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
