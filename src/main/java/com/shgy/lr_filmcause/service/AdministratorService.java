package com.shgy.lr_filmcause.service;

import com.shgy.lr_filmcause.dao.IAdministratorDao;
import com.shgy.lr_filmcause.dao.IMovieDao;
import com.shgy.lr_filmcause.domain.Administrator;
import com.shgy.lr_filmcause.domain.Movie;
import com.shgy.lr_filmcause.domain.PageBean;
import com.shgy.lr_filmcause.domain.Vip;
import com.shgy.lr_filmcause.utils.DaoType;
import com.shgy.lr_filmcause.utils.DaoUtils;

import java.io.IOException;
import java.util.List;
import java.util.Map;

public class AdministratorService {
    private DaoUtils utils;

    {
        try {
            utils = new DaoUtils();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public PageBean<Administrator> findVipByPage( Map<String,String[]> condition) throws IOException {
        int currentPage=Integer.parseInt(condition.get("currentPage")[0]);
        int rows=Integer.parseInt(condition.get("rows")[0]);
        //创建PageBean对象
        PageBean<Administrator> pageBean= new PageBean<>();
        //设置参数:rows,currentPage
        pageBean.setRows(rows);
        pageBean.setCurrentPage(currentPage);
        //查询总页码数
        IAdministratorDao dao= (IAdministratorDao) utils.getDaoImpl(DaoType.IAdministratorDao);
        int totalCount= dao.findTotalCount(condition);
        //设置总页码数
        pageBean.setTotalCount(totalCount);
            //查询该页的adm们
        int start=(currentPage-1)*rows;  //注意查询当页需要显示的adm，是从当页-1*每一页需要显示的数；注意要减一
        String[] strs=new String[]{""+start};
        condition.put("start",strs);
        List<Administrator> list= dao.findByPage(condition);
        //设置把本页的adm设置到pagebean中
        pageBean.setList(list);
        //计算页数，设置pagebean的页数
        int totalPage= (totalCount%rows) ==0 ? totalCount/rows : totalCount/rows +1;
        pageBean.setTotalPage(totalPage);

        //关闭utils
        utils.close();
        //返回pagebean
        return pageBean;
    }

    public PageBean<Movie> findMovieByPage(Map<String,String[]> condition) throws IOException {
        int currentPage=Integer.parseInt(condition.get("currentPage")[0]);
        int rows=Integer.parseInt(condition.get("rows")[0]);

        //创建PageBean对象
        PageBean<Movie> pageBean= new PageBean<>();
        //设置参数:rows,currentPage
        pageBean.setRows(rows);
        pageBean.setCurrentPage(currentPage);
        //查询总页码数
        System.out.println("查询总页码数");
        IMovieDao dao= (IMovieDao) utils.getDaoImpl(DaoType.IMovieDao);
        int totalCount= dao.findMovieTotalCount(condition);
        //设置总页码数
        pageBean.setTotalCount(totalCount);
        //查询该页的Movie们
        int start=(currentPage-1)*rows;  //注意查询当页需要显示的adm，是从当页-1*每一页需要显示的数；注意要减一
        String[] strs=new String[]{""+start};
        condition.put("start",strs);
        List<Movie> list= dao.findMovieByPage(condition);

        //设置把本页的Movie设置到pagebean中
        pageBean.setList(list);
        //计算页数，设置pagebean的页数
        int totalPage= (totalCount%rows) ==0 ? totalCount/rows : totalCount/rows +1;
        pageBean.setTotalPage(totalPage);

        //关闭utils
        utils.close();
        //返回pagebean
        return pageBean;
    }
}
