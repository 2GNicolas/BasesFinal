/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

import VO.Producto;
import VO.Producto_Vendido;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Nicolas
 */
public class ProductoVDAO {
    public boolean insertar(Producto_Vendido t) throws SQLException {
        boolean result = false;
        Connection connection = Conexion.getConnection();
        String query = " insert into Producto_Vendido(Id_Pv,Id_P,Cantidad) values (?,?,?)";
        PreparedStatement preparedStmt = null;
        try {
            preparedStmt = connection.prepareStatement(query);
            preparedStmt.setInt(1, t.getId_V());
            preparedStmt.setInt(2, t.getId_P());
            preparedStmt.setInt(3, t.getCantidad());
            
            
            
            result = preparedStmt.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
    
    public Producto_Vendido Buscar(int Id) throws SQLException {
        Producto_Vendido resultado = null;
        
        String query = "Select * from Producto_Vendido Where Id_P =" + Id;
        Connection connection = Conexion.getConnection();
        
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);
            
            int Id_PV = 0;
            int Id_P = 0;
        
            int cantidad = 0;
            

            if (rs.next()) {
                Id_P = rs.getInt("Id_PV");
                Id_P = rs.getInt("Id_P");

                cantidad = rs.getInt("Cantidad");
                
                
                resultado = new Producto_Vendido();
                resultado.setId_V(Id_PV);
                resultado.setId_P(Id_P);
                resultado.setCantidad(cantidad);

            }
            st.close();
        } catch (SQLException e) {
            System.out.println("Problemas al obtener Productos");
            e.printStackTrace();
        }
        return resultado;
    }
    public boolean   borrar(Producto_Vendido t) throws SQLException {
     boolean result=false;
	   Connection connection = Conexion.getConnection();
	   String query = "delete from Producto_Vendido where Id_P = ?";
	   PreparedStatement preparedStmt=null;
	   try {
		     preparedStmt = connection.prepareStatement(query);
		     preparedStmt.setInt(1, t.getId_P());
		    result= preparedStmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	   
	   return result;
	}
}
