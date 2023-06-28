package com.emergentes.dao;

import com.emergentes.modelo.Doctor;
import com.emergentes.utiles.ConexionDB;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class DoctorDAOimpl extends ConexionDB implements DoctorDAO {

    @Override
    public void insert(Doctor doctor) throws Exception {
        String sql = "INSERT INTO DOCTORES (id, ci, nombre, ap_paterno, ap_materno, fecha_nacimiento, sexo, telefono, direccion, ciudad, correo, id_turno) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, doctor.getId());
            ps.setInt(2, doctor.getCi());
            ps.setString(3, doctor.getNombre());
            ps.setString(4, doctor.getPaterno());
            ps.setString(5, doctor.getMaterno());
            ps.setDate(6, (Date) doctor.getFecha_nacimiento());
            ps.setString(7, doctor.getSexo());
            ps.setInt(8, doctor.getTelefono());
            ps.setString(9, doctor.getDireccion());
            ps.setString(10, doctor.getCiudad());
            ps.setString(11, doctor.getCorreo());
            ps.setInt(12, doctor.getId_turno());

            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }
    }

    @Override
    public void update(Doctor doctor) throws Exception {
        String sql = "UPDATE DOCTORES SET id=?, ci=?, nombre=?, ap_paterno=?, ap_materno=?, fecha_nacimiento=?, sexo=?, telefono=?, direccion=?, ciudad=?, correo=?, id_turno=? WHERE id=?";
        try {
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, doctor.getId());
            ps.setInt(2, doctor.getCi());
            ps.setString(3, doctor.getNombre());
            ps.setString(4, doctor.getPaterno());
            ps.setString(5, doctor.getMaterno());
            ps.setDate(6, (Date) doctor.getFecha_nacimiento());
            ps.setString(7, doctor.getSexo());
            ps.setInt(8, doctor.getTelefono());
            ps.setString(9, doctor.getDireccion());
            ps.setString(10, doctor.getCiudad());
            ps.setString(11, doctor.getCorreo());
            ps.setInt(12, doctor.getId_turno());

            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        String sql = "DELETE FROM DOCTORES WHERE id=?";
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
    public Doctor getById(int id) throws Exception {
        Doctor doc = new Doctor();
        try {
            String sql = "SELECT * FROM DOCTORES WHERE id=?";
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                doc.setId(rs.getInt("id"));
                doc.setCi(rs.getInt("ci"));
                doc.setNombre(rs.getString("nombre"));
                doc.setPaterno(rs.getString("ap_paterno"));
                doc.setMaterno(rs.getString("ap_materno"));
                doc.setFecha_nacimiento(rs.getDate("fecha_nacimiento"));
                doc.setSexo(rs.getString("sexo"));
                doc.setTelefono(rs.getInt("telefono"));
                doc.setDireccion(rs.getString("direccion"));
                doc.setCiudad(rs.getString("ciudad"));
                doc.setCorreo(rs.getString("correo"));
                doc.setId_turno(rs.getInt("id_turno"));

            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }

        return doc;
    }

    @Override
    public List<Doctor> getAll() throws Exception {
        List<Doctor> lista = null;
        try {
            String sql = "SELECT D.*, T.turno AS turno, E.estado AS estado FROM DOCTORES D ";
            sql += "LEFT JOIN TURNOS T ON D.id_turno = T.id ";
            sql += "LEFT JOIN ESTADOS E ON D.id_estado = E.id";
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Doctor>();
            while (rs.next()) {
                Doctor doc = new Doctor();
                doc.setId(rs.getInt("id"));
                doc.setCi(rs.getInt("ci"));
                doc.setNombre(rs.getString("nombre"));
                doc.setPaterno(rs.getString("ap_paterno"));
                doc.setMaterno(rs.getString("ap_materno"));
                doc.setFecha_nacimiento(rs.getDate("fecha_nacimiento"));
                doc.setSexo(rs.getString("sexo"));
                doc.setTelefono(rs.getInt("telefono"));
                doc.setDireccion(rs.getString("direccion"));
                doc.setCiudad(rs.getString("ciudad"));
                doc.setCorreo(rs.getString("correo"));
                doc.setId_turno(rs.getInt("id_turno"));

                lista.add(doc);
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
