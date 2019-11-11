package br.com.fatecpg.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author beatriz
 * @author Ermesom
 */
public class Product {
    private int idProduto;
    private String codigo;
    private double preco;
    private String disp;
    private String desc;
    private int idFabricante;

    public int getIdProduto() {
        return idProduto;
    }

    public void setIdProduto(int idProduto) {
        this.idProduto = idProduto;
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public double getPreco() {
        return preco;
    }

    public void setPreco(double preco) {
        this.preco = preco;
    }

    public String getDisp() {
        return disp;
    }

    public void setDisp(String disp) {
        this.disp = disp;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    public int getIdFabricante() {
        return idFabricante;
    }

    public void setIdFabricante(int idFabricante) {
        this.idFabricante = idFabricante;
    }

    public Product(int idProduto, String codigo, double preco, String disp, String desc, int idFabricante) {
        this.idProduto = idProduto;
        this.codigo = codigo;
        this.preco = preco;
        this.disp = disp;
        this.desc = desc;
        this.idFabricante = idFabricante;
    }

    
    public static ArrayList<Product> getList(int id) throws Exception{
        ArrayList<Product> list = new ArrayList();
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        String url = "jdbc:derby://localhost:1527/sample";
        String user = "app";
        String pass = "app";
        
        Connection con = DriverManager.getConnection(url,user,pass);
        
        String sql = "SELECT PRODUCT_ID,PRODUCT_CODE,PURCHASE_COST,AVAILABLE,DESCRIPTION, MANUFACTURER_ID, DESCRIPTION FROM PRODUCT WHERE MANUFACTURER_ID= ?";
        PreparedStatement stmt = con.prepareStatement(sql);
        stmt.setInt(1,id);
        ResultSet rs  = stmt.executeQuery();
        while(rs.next()){
            Product p = new Product(
            rs.getInt("PRODUCT_ID")                   
                   , rs.getString("PRODUCT_CODE")
                    , rs.getDouble("PURCHASE_COST")
                   , rs.getString("AVAILABLE")
                   , rs.getString("DESCRIPTION")
                   , rs.getInt("MANUFACTURER_ID") 
                   
        );
        list.add(p);
        }
      return list;          
    }
    
    
    
    
}
