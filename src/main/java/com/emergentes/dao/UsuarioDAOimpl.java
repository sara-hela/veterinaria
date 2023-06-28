package com.emergentes.dao;

import com.emergentes.modelo.Usuario;
import com.emergentes.utiles.ConexionDB;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAOimpl extends ConexionDB implements UsuarioDAO {

    @Override
    public void insert(Usuario usuario) throws Exception {
        String sql = "INSERT INTO USUARIOS (id, usuario, contraseña, id_rol) VALUES (?, ?, MD5(?), ?)";
        try {
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, usuario.getId());
            ps.setString(2, usuario.getUsuario());
            ps.setString(3, usuario.getPassword());
            ps.setInt(4, usuario.getId_rol());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }
    }

    @Override
    public void update(Usuario usuario) throws Exception {
        String sql = "UPDATE USUARIOS SET id=?, usuario=?, contraseña=MD5(?), id_rol=? WHERE id=?";
        try {
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, usuario.getId());
            ps.setString(2, usuario.getUsuario());
            ps.setString(3, usuario.getPassword());
            ps.setInt(4, usuario.getId_rol());
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }
    }

    @Override
    public void delete(int id) throws Exception {
        String sql = "DELETE FROM USUARIOS WHERE id=?";
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
    public Usuario getById(int id) throws Exception {
        Usuario usu = new Usuario();
        try {
            String sql = "SELECT * FROM USUARIOS WHERE id=?";
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                usu.setId(rs.getInt("id"));
                usu.setUsuario(rs.getString("usuario"));
                //usu.setPassword(rs.getString("contraseña"));
                usu.setId_rol(rs.getInt("id_rol"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            this.Desconectar();
        }

        return usu;
    }

    @Override
    public List<Usuario> getAll() throws Exception {
        List<Usuario> lista = null;
        try {
            //String sql = "SELECT U.*, R.rol AS rol FROM USUARIOS U LEFT JOIN ROLES R ON U.id_rol = R.id";
            String sql = "SELECT U.*, R.rol AS rol, CONCAT_WS(' ', D.nombre, D.ap_paterno, D.ap_materno) AS nombre ";
            sql += "FROM USUARIOS U LEFT JOIN ROLES R ON U.id_rol = R.id LEFT JOIN DOCTORES D ON U.id = D.id WHERE nombre IS NOT NULL ";
            sql += "UNION ";
            sql += "SELECT U.*, R.rol AS rol, CONCAT_WS(' ', RE.nombre, RE.ap_paterno, RE.ap_materno) AS nombre ";
            sql += "FROM USUARIOS U LEFT JOIN ROLES R ON U.id_rol = R.id LEFT JOIN RECEPCIONISTAS RE ON U.id = RE.id WHERE nombre IS NOT NULL ";
            sql += "ORDER BY id ASC";
            this.Conectar();
            PreparedStatement ps = this.conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            lista = new ArrayList<Usuario>();
            while (rs.next()) {
                Usuario usu = new Usuario();
                usu.setId(rs.getInt("id"));
                usu.setUsuario(rs.getString("usuario"));
                //usu.setPassword(rs.getString("contraseña"));
                usu.setId_rol(rs.getInt("id_rol"));
                lista.add(usu);
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
