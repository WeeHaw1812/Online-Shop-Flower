/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author HP
 */
public class Order {

    private String CustomerName;
    private String Address;
    private String Phone;
    private String ProductBuy;
    private int Quantity;
    private int Price;
    private int Total;

    public Order() {
    }

    public Order(String CustomerName, String Address, String Phone, String ProductBuy, int Quantity, int Price, int Total) {
        this.CustomerName = CustomerName;
        this.Address = Address;
        this.Phone = Phone;
        this.ProductBuy = ProductBuy;
        this.Quantity = Quantity;
        this.Price = Price;
        this.Total = Total;
    }

    public String getCustomerName() {
        return CustomerName;
    }

    public void setCustomerName(String CustomerName) {
        this.CustomerName = CustomerName;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getProductBuy() {
        return ProductBuy;
    }

    public void setProductBuy(String ProductBuy) {
        this.ProductBuy = ProductBuy;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public int getTotal() {
        return Total;
    }

    public void setTotal(int Total) {
        this.Total = Total;
    }

}