/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author MSI GTX
 */
public class Product {

    private int ID;
    private String FlowerName;
    private String Linkimage;
    private String Quantity;
    private String Price;
    private String Description;

    public Product() {
    }

    public Product(int ID, String FlowerName, String Linkimage, String Quantity, String Price, String Description) {
        this.ID = ID;
        this.FlowerName = FlowerName;
        this.Linkimage = Linkimage;
        this.Quantity = Quantity;
        this.Price = Price;
        this.Description = Description;
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getFlowerName() {
        return FlowerName;
    }

    public void setFlowerName(String FlowerName) {
        this.FlowerName = FlowerName;
    }

    public String getLinkimage() {
        return Linkimage;
    }

    public void setLinkimage(String Linkimage) {
        this.Linkimage = Linkimage;
    }

    public String getQuantity() {
        return Quantity;
    }

    public void setQuantity(String Quantity) {
        this.Quantity = Quantity;
    }

    public String getPrice() {
        return Price;
    }

    public void setPrice(String Price) {
        this.Price = Price;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    
    
}
