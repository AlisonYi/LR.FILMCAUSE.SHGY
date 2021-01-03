package com.shgy.lr_filmcause.domain;

public class Vip {
    private String email;
    private String name;
    private String password;
    private byte[] photo;

    public Vip(String email, String name, String password){
        this.email = email;
        this.name = name;
        this.password = password;
    }

    public Vip(String email, String name, String password, byte[] photo) {
        this.email = email;
        this.name = name;
        this.password = password;
        this.photo = photo;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    @Override
    public String toString() {
        return "Vip{" +
                "email='" + email + '\'' +
                ", name='" + name + '\'' +
                ",password= "+password+'\''+
                '}';
    }
}
