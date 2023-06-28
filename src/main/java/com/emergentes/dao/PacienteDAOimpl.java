package com.emergentes.dao;

import com.emergentes.modelo.Paciente;
import com.emergentes.utiles.ConexionDB;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class PacienteDAOimpl extends ConexionDB implements PacienteDAO{

    @Override
    public void insert(Paciente paciente) throws Exception {
        String sql = "INSERT INTO PACIENTES (nombre, raza, edad, color, rasgos, sexo, id_responsable, tipo_animal) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, paciente.getNombre());
            ps.setString(2, paciente.getRaza());
            ps.setInt(3, paciente.getEdad());
            ps.setString(4, paciente.getColor());
            ps.setString(5, paciente.getRasgos());
            ps.setString(6, paciente.getSexo());
            ps.setInt(7, paciente.getId_responsable());
            ps.setString(8, paciente.getTipo_animal());

            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }
    }

    @Override
    public void update(Paciente paciente) throws Exception {
        String sql = "UPDATE PACIENTES SET nombre=? , raza=?, edad=?, color=?, rasgos=?, sexo=?, id_responsable=?, tipo_animal=? WHERE id=?";
        try {
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, paciente.getNombre());
            ps.setString(2, paciente.getRaza());
            ps.setInt(3, paciente.getEdad());
            ps.setString(4, paciente.getColor());
            ps.setString(5, paciente.getRasgos());
            ps.setString(6, paciente.getSexo());
            ps.setInt(7, paciente.getId_responsable());
            ps.setString(8, paciente.getTipo_animal());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        String sql = "DELETE FROM PACIENTES WHERE id=?";
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
    public Paciente getById(int id) throws Exception {
        Paciente pac = new Paciente();
        try {
            String sql = "SELECT * FROM PACIENTES WHERE id=?";
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                pac.setId(rs.getInt("id"));
                pac.setNombre(rs.getString("nombre"));
                pac.setRaza(rs.getString("raza"));
                pac.setEdad(rs.getInt("edad"));
                pac.setColor(rs.getString("color"));
                pac.setRasgos(rs.getString("rasgos"));
                pac.setSexo(rs.getString("sexo"));
                pac.setId_responsable(rs.getInt("id_responsable"));
                pac.setTipo_animal(rs.getString("tipo_animal"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }

        return pac;
    }

    @Override
    public List<Paciente> getAll() throws Exception {
        List<Paciente> lista = null;
        try {
            String sql = "SELECT P.*, CONCAT_WS(' ', R.nombre, R.ap_paterno, R.ap_materno) AS recepcionista ";
            sql += "FROM PACIENTES P LEFT JOIN RECEPCIONISTAS R ON P.id_recepcionista = R.id";
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Paciente>();
            while (rs.next()) {
                Paciente pac = new Paciente();
                pac.setId(rs.getInt("id"));
                pac.setNombre(rs.getString("nombre"));
                pac.setRaza(rs.getString("raza"));
                pac.setEdad(rs.getInt("edad"));
                pac.setColor(rs.getString("color"));
                pac.setRasgos(rs.getString("rasgos"));
                pac.setSexo(rs.getString("sexo"));
                pac.setId_responsable(rs.getInt("id_responsable"));
                pac.setTipo_animal(rs.getString("tipo_animal"));
                lista.add(pac);
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
