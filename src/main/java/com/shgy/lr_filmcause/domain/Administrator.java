package com.shgy.lr_filmcause.domain;

public class Administrator {
    private int id;
    private String name;
    private String password;
    private String email;
    private int rank;

    public Administrator(int id, String name, String password, String email, int rank) {
        this.id = id;
        this.name = name;
        this.password = password;
        this.email = email;
        this.rank = rank;
    }
    public Administrator(String name, String password, String email, int rank) {
        this.name = name;
        this.password = password;
        this.email = email;
        this.rank = rank;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getRank() {
        return rank;
    }

    public void setRank(int rank) {
        this.rank = rank;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Administrator{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", rank=" + rank +
                '}';
    }
}
