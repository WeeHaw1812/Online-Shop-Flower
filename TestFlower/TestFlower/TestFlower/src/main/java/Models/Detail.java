/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author MSI GTX
 */
public class Detail {
    private int ID;
    private String FlowerName;
    private int Price;
    private int Quantity;
    private String Linkimage;
    private String Description;
    

    public Detail() {
    }

    public Detail(int ID, String FlowerName, int Price, int Quantity, String Linkimage, String Description) {
        this.ID = ID;
        this.FlowerName = FlowerName;
        this.Price = Price;
        this.Quantity = Quantity;
        this.Linkimage = Linkimage;
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

    public int getPrice() {
        return Price;
    }

    public void setPrice(int Price) {
        this.Price = Price;
    }

    public int getQuantity() {
        return Quantity;
    }

    public void setQuantity(int Quantity) {
        this.Quantity = Quantity;
    }

    public String getLinkimage() {
        return Linkimage;
    }

    public void setLinkimage(String Linkimage) {
        this.Linkimage = Linkimage;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

}
