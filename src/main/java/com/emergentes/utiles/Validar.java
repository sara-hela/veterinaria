package com.emergentes.utiles;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Validar extends ConexionDB{
    Connection con = this.Conectar();
    PreparedStatement pr;
    
    public boolean CheckUser(String email, String password){
        boolean resultado = false;
        try {            
            String sql = "SELECT * FROM USUARIOS WHERE usuario=? and contraseña=sha1(?)";
            pr = con.prepareStatement(sql);
            pr.setString(1, email);
            pr.setString(2, password);
            ResultSet rs = pr.executeQuery();
            resultado = rs.next();            
        } catch (SQLException ex) {
            System.out.println("ERROR AL AUTENTIFICAR.");
        }
        return resultado;
    }
}
