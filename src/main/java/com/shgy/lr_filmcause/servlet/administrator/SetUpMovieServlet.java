package com.shgy.lr_filmcause.servlet.administrator;

import com.shgy.lr_filmcause.dao.IAdministratorDao;
import com.shgy.lr_filmcause.dao.IMovieDao;
import com.shgy.lr_filmcause.domain.Administrator;
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
 * 用来搜索待修改用户的数据，回显到修改页面，真正实行修改的是update
 */
@WebServlet("/Ad/SetUpMovieServlet")
public class SetUpMovieServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");

        String id=request.getParameter("id");

        DaoUtils utils=new DaoUtils();
        IMovieDao dao=(IMovieDao)utils.getDaoImpl(DaoType.IMovieDao);
        Movie film =dao.findMovieById(Integer.parseInt(id));

        request.setAttribute("film", film);
        /*request.setAttribute("id",id);
        request.setAttribute("name",film .getName());
        request.setAttribute("actors",film .getActors());
        request.setAttribute("director",film .getDirector());
        request.setAttribute("score",film .getScore());*/
        request.setAttribute("sellOrExpectSum",film .getSell_sum()==0?film .getExpect_sum():film .getSell_sum());
        int sum=(film.getSell_sum()+film.getExpect_sum()* film.getPrice())/10000;

        /*request.setAttribute("sum",sum);

        request.setAttribute("price",film.getPrice());        //这是可以修改的，这里也将他返回是用作回显用*/


        System.out.println(film);
        utils.close();
        request.getRequestDispatcher("/administrator/SetUpMovie.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
