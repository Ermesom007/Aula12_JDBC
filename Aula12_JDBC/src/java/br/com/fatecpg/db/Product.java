package br.com.fatecpg.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author beatriz
 */
public class Product {
    private int idProduto;
    private int idFabricante;
    private String descricao;

    public Product(int idProduto, int idFabricante, String descricao) {
        this.idProduto = idProduto;
        this.idFabricante = idFabricante;
        this.descricao = descricao;
    }

    public static ArrayList<Product> getList() throws Exception{
        ArrayList<Product> list = new ArrayList();
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        String url = "jdbc:derby://localhost:1527/sample";
        String user = "app";
        String pass = "app";
        
        Connection con = DriverManager.getConnection(url,user,pass);
        Statement stmt = con.createStatement();
        String sql = "SELECT PRODUCT_ID, MANUFACTURER_ID, DESCRIPTION FROM PRODUCT";
        ResultSet rs  = stmt.executeQuery(sql);
        while(rs.next()){
            Product p = new Product(
            rs.getInt("PRODUCT_ID")
                   , rs.getInt("MANUFACTURER_ID")
                   , rs.getString("DESCRIPTION") 
        );
        list.add(p);
        }
      return list;          
    }
    
    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public int getIdFabricante() {
        return idFabricante;
    }

    public void setIdFabricante(int idFabricante) {
        this.idFabricante = idFabricante;
    }
    
    
}
