package com.shgy.lr_filmcause.servlet.administrator;

import com.shgy.lr_filmcause.dao.IMovieDao;
import com.shgy.lr_filmcause.domain.Movie;
import com.shgy.lr_filmcause.utils.DaoType;
import com.shgy.lr_filmcause.utils.DaoUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 实行修改
 */
@WebServlet("/Ad/UpDateMovieServlet")
public class UpDateMovieServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id=request.getParameter("id");
        String state=request.getParameter("state");
        String price=request.getParameter("price");
        System.out.println(state);
        System.out.println(price);
        DaoUtils utils=new DaoUtils();
        IMovieDao dao= (IMovieDao) utils.getDaoImpl(DaoType.IMovieDao);
        Movie  film=dao.findMovieById(Integer.parseInt(id));

        if(state!=null&&!state.equals(""))
             film.setState(Integer.parseInt(state));
        if(price!=null&&!price.equals(""))
             film.setPrice(Integer.parseInt(price));
        System.out.println(film);
        dao.updateMovie(film);

        utils.close();
        String url=""+request.getContextPath()+"/Ad/MoviesListServlet";
        response.getWriter().print("<script> alert('Modified successfully!');window.location.href ='"+url+"' </script>");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
