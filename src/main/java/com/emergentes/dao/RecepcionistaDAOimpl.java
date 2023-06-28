package com.emergentes.dao;

import com.emergentes.modelo.Recepcionista;
import com.emergentes.utiles.ConexionDB;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RecepcionistaDAOimpl extends ConexionDB implements RecepcionistaDAO{

    @Override
    public void insert(Recepcionista recepcionista) throws Exception {
        String sql = "INSERT INTO RECEPCIONISTAS (id, ci, nombre, ap_paterno, ap_materno, fecha_nacimiento, sexo, telefono, direccion, ciudad, correo, id_turno) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, recepcionista.getId());
            ps.setInt(2, recepcionista.getCi());
            ps.setString(3, recepcionista.getNombre());
            ps.setString(4, recepcionista.getPaterno());
            ps.setString(5, recepcionista.getMaterno());
            ps.setDate(6, (Date) recepcionista.getFecha_nacimiento());
            ps.setString(7, recepcionista.getSexo());
            ps.setInt(8, recepcionista.getTelefono());
            ps.setString(9, recepcionista.getDireccion());
            ps.setString(10, recepcionista.getCiudad());
            ps.setString(11, recepcionista.getCorreo());
            ps.setInt(12, recepcionista.getId_turno());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }
    }

    @Override
    public void update(Recepcionista recepcionista) throws Exception {
        String sql = "UPDATE RECEPCIONISTAS SET id=?, ci=?, nombre=?, ap_paterno=?, ap_materno=?, fecha_nacimiento=?, sexo=?, telefono=?, direccion=?, ciudad=?, correo=?, id_turno=? WHERE id=?";
        try {
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, recepcionista.getId());
            ps.setInt(2, recepcionista.getCi());
            ps.setString(3, recepcionista.getNombre());
            ps.setString(4, recepcionista.getPaterno());
            ps.setString(5, recepcionista.getMaterno());
            ps.setDate(6, (Date) recepcionista.getFecha_nacimiento());
            ps.setString(7, recepcionista.getSexo());
            ps.setInt(8, recepcionista.getTelefono());
            ps.setString(9, recepcionista.getDireccion());
            ps.setString(10, recepcionista.getCiudad());
            ps.setString(11, recepcionista.getCorreo());
            ps.setInt(12, recepcionista.getId_turno());

            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        String sql = "DELETE FROM RECEPCIONISTAS WHERE id=?";
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
    public Recepcionista getById(int id) throws Exception {
        Recepcionista res = new Recepcionista();
        try {
            String sql = "SELECT * FROM RECEPCIONISTAS WHERE id=?";
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                res.setId(rs.getInt("id"));
                res.setCi(rs.getInt("ci"));
                res.setNombre(rs.getString("nombre"));
                res.setPaterno(rs.getString("ap_paterno"));
                res.setMaterno(rs.getString("ap_materno"));
                res.setFecha_nacimiento(rs.getDate("fecha_nacimiento"));
                res.setSexo(rs.getString("sexo"));
                res.setTelefono(rs.getInt("telefono"));
                res.setDireccion(rs.getString("direccion"));
                res.setCiudad(rs.getString("ciudad"));
                res.setCorreo(rs.getString("correo"));
                res.setId_turno(rs.getInt("id_turno"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }

        return res;
    }

    @Override
    public List<Recepcionista> getAll() throws Exception {
        List<Recepcionista> lista = null;
        try {
            String sql = "SELECT R.*, T.turno AS turno, E.estado AS estado FROM RECEPCIONISTAS R ";
            sql += "LEFT JOIN TURNOS T ON R.id_turno = T.id ";
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Recepcionista>();
            while (rs.next()) {
                Recepcionista res = new Recepcionista();
                res.setId(rs.getInt("id"));
                res.setCi(rs.getInt("ci"));
                res.setNombre(rs.getString("nombre"));
                res.setPaterno(rs.getString("ap_paterno"));
                res.setMaterno(rs.getString("ap_materno"));
                res.setFecha_nacimiento(rs.getDate("fecha_nacimiento"));
                res.setSexo(rs.getString("sexo"));
                res.setTelefono(rs.getInt("telefono"));
                res.setDireccion(rs.getString("direccion"));
                res.setCiudad(rs.getString("ciudad"));
                res.setCorreo(rs.getString("correo"));
                res.setId_turno(rs.getInt("id_turno"));

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
