package com.shgy.lr_filmcause.domain;

import java.sql.Timestamp;

public class Booking {
    private String email;
    private String vipName;
    private int id;
    private String movieName;
    private Timestamp time;
    private int seatX;
    private int seatY;
    private  String comment;
    private float score;

    public Booking(String email, String vipName, int id, String movieName, Timestamp time, int seatX, int seatY) {
        this.email = email;
        this.vipName = vipName;
        this.id = id;
        this.movieName = movieName;
        this.time = time;
        this.seatX = seatX;
        this.seatY = seatY;
    }

    public Booking(String email, String vipName, int id, String movieName, Timestamp time, int seatX, int seatY, String comment, float score) {
        this.email = email;
        this.vipName = vipName;
        this.id = id;
        this.movieName = movieName;
        this.time = time;
        this.seatX = seatX;
        this.seatY = seatY;
        this.comment = comment;
        this.score = score;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getVipName() {
        return vipName;
    }

    public void setVipName(String vipName) {
        this.vipName = vipName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getMovieName() {
        return movieName;
    }

    public void setMovieName(String movieName) {
        this.movieName = movieName;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public int getSeatX() {
        return seatX;
    }

    public void setSeatX(int seatX) {
        this.seatX = seatX;
    }

    public int getSeatY() {
        return seatY;
    }

    public void setSeatY(int seatY) {
        this.seatY = seatY;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "Booking{" +
                "email='" + email + '\'' +
                ", vipName='" + vipName + '\'' +
                ", id=" + id +
                ", movieName='" + movieName + '\'' +
                ", time=" + time +
                ", seatX=" + seatX +
                ", seatY=" + seatY +
                ", score=" + score +
                ",c " +comment+
                '}';
    }
}
