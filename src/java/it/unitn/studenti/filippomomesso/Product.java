/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package it.unitn.studenti.filippomomesso;

import java.util.ArrayList;
import java.util.Objects;
import jdk.nashorn.internal.objects.NativeString;

/**
 *
 * @author filippomomesso
 */
public class Product {

    Integer id;
    String name;
    String description;
    String price;
    String imgUrl;

    public Product(Integer id, String name, String description, String price, String imgUrl) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.imgUrl = imgUrl;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public String toJSON() {
        String template = "{";
        template += " \"id\": " + this.id;
        template += ", \"name\": \"" + this.name;
        template += "\", \"description\": \"" + this.description;
        template += "\", \"price\": \"" + this.price;
        template += "\", \"imgURL\": \"" + this.imgUrl;

        template += "\" }";

        System.out.println(template);

        return template;
    }

    public String toJSON(ArrayList<Product> recentProducts) {
        String template = "{";
        template += " \"id\": " + this.id;
        template += ", \"name\": \"" + this.name;
        template += "\", \"description\": \"" + this.description;
        template += "\", \"price\": \"" + this.price;
        template += "\", \"imgURL\": \"" + this.imgUrl;
        template += "\", \"recentProducts\": [";
        for (Product product : recentProducts) {
            template += product.toJSON() + ", ";
        }
        template = template.substring(0, template.length() - 2);

        template += "]}";
        System.out.println(template);
        return template;
    }

    @Override
    public int hashCode() {
        int hash = 3;
        hash = 97 * hash + Objects.hashCode(this.id);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Product other = (Product) obj;
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        return true;
    }

   
}
