package com.shgy.lr_filmcause.domain;

import java.util.List;
/**
 * 分页工具对象
 */
public class PageBean<T> {

    private int totalCount;//总记录数
    private int totalPage; //总页码
    private List<T> list;     //每页的数据
    private int  currentPage; //当前页码
    private int rows;       //每页显示的记录数
    private int searchRows ;  //符合搜索条件的电影数 能显示几行

    public int getSearchRows() {
        return searchRows;
    }

    public void setSearchRows(int searchRows) {
        this.searchRows = searchRows;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public void setTotalPage(int totalPage) {
        this.totalPage = totalPage;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public int getTotalCount() {
        return totalCount;
    }

    public int getTotalPage() {
        return totalPage;
    }

    public List<T> getList() {
        return list;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public int getRows() {
        return rows;
    }

    @Override
    public String toString() {
        return "PageBean{" +
                "totalCount=" + totalCount +
                ", totalPage=" + totalPage +
                ", list=" + list +
                ", currentPage=" + currentPage +
                ", rows=" + rows +
                '}';
    }
}
