/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import Util.DbUtil;
import VO.Admin;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Nicolas
 */
public class UserDao {
private Connection connection;

	public UserDao() {
		connection = DbUtil.getConnection();
	}
    public Admin validar(Admin admin) {
        System.out.println("hola");
        try {
	 	PreparedStatement preparedStatement = null;
                String consulta = "SELECT * FROM ADMINISTRADOR WHERE Usuario=? AND clave=?";
                preparedStatement = connection.prepareStatement(consulta);
                preparedStatement.setString(1, admin.getUsuario());
                preparedStatement.setString(2, admin.getClave());
                ResultSet rs = preparedStatement.executeQuery();
                if(rs.next()){
                   
                   String id= rs.getString("Id_Admin");
                   String login= rs.getString("Usuario");
                   String pass = rs.getString("Clave");
                   String nit = rs.getString("Nit");
                   Admin sesion = new Admin();
                   
                   sesion.setUsuario(login);
                   sesion.setClave(pass);
                   sesion.setId_Admin(id);
                   sesion.setNit(nit);
                   System.out.println(id);
                   System.out.println(login);
                   System.out.println(pass);
                   System.out.println(nit);
                   return sesion;
                }else{
                  //Luego realizaremos otro tipo de retorno  
                  return null;
                }

		} catch (SQLException e) {
			e.printStackTrace();
		}
            
            return null;
    }
    
}
