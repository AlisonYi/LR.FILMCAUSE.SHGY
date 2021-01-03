package com.shgy.lr_filmcause.servlet.movie;

import com.shgy.lr_filmcause.dao.IMovieDao;
import com.shgy.lr_filmcause.domain.Movie;
import com.shgy.lr_filmcause.domain.PageBean;
import com.shgy.lr_filmcause.utils.DaoType;
import com.shgy.lr_filmcause.utils.DaoUtils;
import com.shgy.lr_filmcause.utils.ParameterUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/FindDataToMainServlet")
public class FindDataToMainServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        PageBean<Movie> pageBeanHotMovie = new PageBean<>();
        PageBean<Movie> pageBeanComingSoonMovie = new PageBean<>();
        PageBean<Movie>  pageBeanBoxOfficeMovie = new PageBean<>();
        PageBean<Movie> pageBeanMostExpectedMovie = new PageBean<>();

        DaoUtils utils = new DaoUtils();
        IMovieDao dao = (IMovieDao) utils.getDaoImpl(DaoType.IMovieDao);

        pageBeanHotMovie.setList(dao.findHotMovie());
        pageBeanComingSoonMovie.setList(dao.findComingSoonMovie());
        pageBeanBoxOfficeMovie.setList(dao.findBoxOfficeMovie());
        pageBeanMostExpectedMovie.setList(dao.findMostExpectedMovie());

        utils.close();//一定要记得关闭

        request.setAttribute("ifFirst", "yes");
        //将PageBean 存入request
        request.setAttribute("pageBeanHotMovie", pageBeanHotMovie);
        request.setAttribute("pageBeanComingSoonMovie", pageBeanComingSoonMovie);
        request.setAttribute("pageBeanBoxOfficeMovie",  pageBeanBoxOfficeMovie);
        request.setAttribute("pageBeanMostExpectMovie", pageBeanMostExpectedMovie);
        //转发
        request.getRequestDispatcher("/index.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
