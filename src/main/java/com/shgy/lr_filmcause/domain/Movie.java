package com.shgy.lr_filmcause.domain;

public class Movie {
    private int id;
    private String name;
    private int price;
    private  String actors;
    private String director;
    private float score;
    private int state;
    private String post;
    private  int sell_sum;          //已买人数
    private int expect_sum;             //期待人数
    private float sum;          //销售或预售票房

    public Movie(int id, String name, int price, String actors, String post) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.actors = actors;
        this.post =post;
    }

    public Movie(int id, String name, int price, String actors, String director,  int state, String post) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.actors = actors;
        this.director = director;
        this.state = state;
        this.post = post;
    }

    public Movie(int id, String name, int price, String actors, String director, float score, int state, String post, int sell_sum, int expect_sum) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.actors = actors;
        this.director = director;
        this.score = score;
        this.state = state;
        this.post = post;
        this.sell_sum = sell_sum;
        this.expect_sum = expect_sum;
    }

    public Movie(int id, String name, int price, String actors, String director, float score, int state, String post, int sell_sum, int expect_sum, float sum) {
        this.id = id;
        this.name = name;
        this.price = price;
        this.actors = actors;
        this.director = director;
        this.score = score;
        this.state = state;
        this.post = post;
        this.sell_sum = sell_sum;
        this.expect_sum = expect_sum;
        this.sum = sum;
    }

    public float getSum() {
        return sum;
    }

    public void setSum(float sum) {
        this.sum = sum;
    }

    public int getSell_sum() {
        return sell_sum;
    }

    public void setSell_sum(int sell_sum) {
        this.sell_sum = sell_sum;
    }

    public int getExpect_sum() {
        return expect_sum;
    }

    public void setExpect_sum(int expect_sum) {
        this.expect_sum = expect_sum;
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getActors() {
        return actors;
    }

    public void setActors(String actors) {
        this.actors = actors;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public float getScore() {
        return score;
    }

    public void setScore(float score) {
        this.score = score;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    @Override
    public String toString() {
        return "Movie{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", actors='" + actors + '\'' +
                ", director='" + director + '\'' +
                ", score=" + score +
                ", state=" + state +
                ", post='" + post + '\'' +
                '}';
    }
}
