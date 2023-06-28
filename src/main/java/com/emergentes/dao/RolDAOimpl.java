package com.emergentes.dao;

import com.emergentes.modelo.Rol;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RolDAOimpl extends ConexionDB implements RolDAO{

    @Override
    public void insert(Rol rol) throws Exception {
        String sql = "INSERT INTO ROLES (rol, descripcion) VALUES (?, ?)";
        try {
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, rol.getRol());
            ps.setString(2, rol.getDescripcion());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }
    }

    @Override
    public void update(Rol rol) throws Exception {
        String sql = "UPDATE ROLES SET rol=?, descripcion=? WHERE id=?";
        try {
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setString(1, rol.getRol());
            ps.setString(2, rol.getDescripcion());
            ps.setInt(3, rol.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        String sql = "DELETE FROM ROLES WHERE id=?";
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
    public Rol getById(int id) throws Exception {
        Rol rol = new Rol();
        try {
            String sql = "SELECT * FROM ROLES WHERE id=?";
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                rol.setId(rs.getInt("id"));
                rol.setRol(rs.getString("rol"));
                rol.setDescripcion(rs.getString("descripcion"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }

        return rol;
    }

    @Override
    public List<Rol> getAll() throws Exception {
        List<Rol> lista = null;
        try {
            String sql = "SELECT * FROM ROLES";
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Rol>();
            while (rs.next()) {
                Rol rol = new Rol();
                rol.setId(rs.getInt("id"));
                rol.setRol(rs.getString("rol"));
                rol.setDescripcion(rs.getString("descripcion"));
                
                lista.add(rol);
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
