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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Nicolas
 */
public class DaoControlVentas {
    
          
    public Producto Buscar(int Id) throws SQLException {
        return null;
     
    }

   
    public List<Producto> BuscarTodo() throws SQLException {
        Producto registro = null;
        List<Producto> productos = null;
        String query = "Select Producto.Nombre, Producto_Vendido.Cantidad from Producto join Producto_Vendido on Producto.Id_P = Producto_Vendido.Id_P where Producto_Vendido.Id_P = Producto.Id_P group by Producto.Nombre, Producto_Vendido.Cantidad ";
        Connection connection = Conexion.getConnection();
        try {
            Statement st = connection.createStatement();
            ResultSet rs = st.executeQuery(query);
            
            int Id_P = 0;
            String nombre = null;
            int cantidad = 0;
            float Pcomp = 0;
            float Pvent = 0;
            
            
            while (rs.next()) {
                if (productos == null) {
                    productos = new ArrayList<Producto>();
                }

                
                Id_P = rs.getInt("Id_P");

                nombre = rs.getString("nombre");

                cantidad = rs.getInt("Cantidad");
                
                
                
                registro = new Producto(Id_P, nombre, cantidad, Pcomp,Pvent);
                productos.add(registro);
            }
            st.close();

        } catch (SQLException e) {
            System.out.println("Problemas al obtener la lista de Producto");
            e.printStackTrace();
        }

        return productos;

    }

   
    public boolean insertar(Producto t) throws SQLException {
        return false;
        
    }

    
    public boolean actualizar(Producto t) throws SQLException {
     
        return false;

    }

 
    public boolean   borrar(Producto t) throws SQLException {
        return false;
  
    }
}
