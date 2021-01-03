package com.shgy.lr_filmcause.servlet.vip;

import com.shgy.lr_filmcause.dao.IMovieDao;
import com.shgy.lr_filmcause.domain.Movie;
import com.shgy.lr_filmcause.domain.PageBean;
import com.shgy.lr_filmcause.utils.DaoType;
import com.shgy.lr_filmcause.utils.DaoUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@WebServlet("/SearchServlet")
public class SearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String condition=request.getParameter("condition");
        DaoUtils utils=new DaoUtils();
        IMovieDao dao= (IMovieDao) utils.getDaoImpl(DaoType.IMovieDao);

        List<Movie> movies;
        if(request.getParameter("state")==null||request.getParameter("state").equals(""))
            movies=dao.findMoviesByCondition("%"+condition+"%");
        else{
            movies=dao.findMoviesByState(Integer.parseInt(request.getParameter("state")));
        }

        PageBean<Movie> pageBean=new PageBean<>();
        pageBean.setList(movies);

        int searchRows;//一行2个,所以除以2
        if(movies.size()%2==0)
            searchRows=movies.size()/2;
        else
            searchRows=movies.size()/2+1;

        pageBean.setSearchRows(searchRows);
        System.out.println(searchRows);
        request.setAttribute("pageBean", pageBean);
        //转发
        request.getRequestDispatcher("/vip/Search.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
