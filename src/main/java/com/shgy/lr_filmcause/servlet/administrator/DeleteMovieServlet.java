package com.shgy.lr_filmcause.servlet.administrator;

import com.shgy.lr_filmcause.dao.IMovieDao;
import com.shgy.lr_filmcause.utils.DaoType;
import com.shgy.lr_filmcause.utils.DaoUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Ad/DeleteMovieServlet")
public class DeleteMovieServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] ids=request.getParameterValues("id");
        DaoUtils utils=new DaoUtils();
        IMovieDao dao=((IMovieDao)utils.getDaoImpl(DaoType.IMovieDao));

        for (int i=0;i<ids.length;i++)
            dao.deleteMovieById(Integer.parseInt(ids[i]));

        utils.close();
        response.sendRedirect(request.getContextPath()+"/Ad/MoviesListServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
