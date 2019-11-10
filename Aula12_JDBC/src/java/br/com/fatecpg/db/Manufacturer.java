
package br.com.fatecpg.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author emers
 */
public class Manufacturer {
    private int id;
    private String nome;
    private String email;
    private String cidade;
    private String estado;
    

    public Manufacturer(int id, String nome, String email, String cidade, String estado) {
        this.id = id;
        this.nome = nome;
        this.email = email;
        this.cidade = cidade;
        this.estado = estado;        
    }

    public static ArrayList<Manufacturer> getList() throws Exception{
        ArrayList<Manufacturer> list = new ArrayList();
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        String url = "jdbc:derby://localhost:1527/sample";
        String user = "app";
        String pass = "app";
        
        Connection con = DriverManager.getConnection(url,user,pass);
        Statement stmt = con.createStatement();
        String sql = "SELECT MANUFACTURER_ID, NAME, EMAIL, CITY, STATE FROM MANUFACTURER";
        ResultSet rs  = stmt.executeQuery(sql);
        while(rs.next()){
            Manufacturer m = new Manufacturer(
            rs.getInt("MANUFACTURER_ID")
                   , rs.getString("NAME")
                   , rs.getString("EMAIL") 
                   , rs.getString("CITY") 
                   , rs.getString("STATE") 
        );
        list.add(m);
        }
      return list;          
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
}
