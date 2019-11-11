package br.com.fatecpg.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author romario
 */
public class Purchase {
    public int idPurchase;
    public String customer;
    public String product;
    public int quantity;
    public float shippingCost;
    public String salesDate;
    public String shippingDate;
    public String freightCompany;
    
    public Purchase(int idPurchase, String customer, String product, int quantity, float shippingCost, String salesDate, String shippingDate, String freightCompany) {
        this.idPurchase = idPurchase;
        this.customer = customer;
        this.product = product;
        this.quantity = quantity;
        this.shippingCost = shippingCost;
        this.salesDate = salesDate;
        this.shippingDate = shippingDate;
        this.freightCompany = freightCompany;
    }
    
       
    public static ArrayList<Purchase> getById(Integer id) throws Exception{
        ArrayList<Purchase> list = new ArrayList();
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        String url = "jdbc:derby://localhost:1527/sample";
        String user = "app";
        String pass = "app";
        
        Connection con = DriverManager.getConnection(url,user,pass);
        Statement stmt = con.createStatement();
        String sql = "SELECT PO.ORDER_NUM, C.CUSTOMER_ID, C.NAME, PO.PRODUCT_ID, (P.DESCRIPTION || ' - ' || P.PRODUCT_CODE) AS PRODUCT, PO.QUANTITY, PO.SHIPPING_COST, PO.SALES_DATE, PO.SHIPPING_DATE, PO.FREIGHT_COMPANY "
                + "FROM PURCHASE_ORDER PO "
                + "JOIN CUSTOMER C ON (C.CUSTOMER_ID = PO.CUSTOMER_ID)"
                + "JOIN PRODUCT P ON (P.PRODUCT_ID = PO.PRODUCT_ID)"
                + "WHERE PO.CUSTOMER_ID = " + id;
        ResultSet rs  = stmt.executeQuery(sql);
        while(rs.next()){
            Purchase p = new Purchase(
            rs.getInt("ORDER_NUM"),
            rs.getString("NAME"),
            rs.getString("PRODUCT"),
            rs.getInt("QUANTITY"),
            rs.getInt("SHIPPING_COST"),
            rs.getString("SALES_DATE"),
            rs.getString("SHIPPING_DATE"),
            rs.getString("FREIGHT_COMPANY")
        );
        list.add(p);
        }
      return list;          
    }
 

    public int getIdPurchase() {
        return idPurchase;
    }

    public void setIdPurchase(int idPurchase) {
        this.idPurchase = idPurchase;
    }

    public String getCustomer() {
        return customer;
    }

    public void setCustomer(String customer) {
        this.customer = customer;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getShippingCost() {
        return shippingCost;
    }

    public void setShippingCost(float shippingCost) {
        this.shippingCost = shippingCost;
    }

    public String getSalesDate() {
        return salesDate;
    }

    public void setSalesDate(String salesDate) {
        this.salesDate = salesDate;
    }

    public String getShippingDate() {
        return shippingDate;
    }

    public void setShippingDate(String shippingDate) {
        this.shippingDate = shippingDate;
    }

    public String getFreightCompany() {
        return freightCompany;
    }

    public void setFreightCompany(String freightCompany) {
        this.freightCompany = freightCompany;
    }       
}
