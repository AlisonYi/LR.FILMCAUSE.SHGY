package com.shgy.lr_filmcause.servlet.movie;

import com.shgy.lr_filmcause.dao.IBookingDao;
import com.shgy.lr_filmcause.dao.IMovieDao;
import com.shgy.lr_filmcause.domain.Booking;
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
import java.util.List;

@WebServlet("/MovieServlet")
public class MovieServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //request.setCharacterEncoding("utf-8");

        String idS=request.getParameter("id");
        int id=Integer.parseInt(idS);
        DaoUtils utils=new DaoUtils();

        IBookingDao dao= (IBookingDao) utils.getDaoImpl(DaoType.IBookingDao);
        List<Booking> bookings=dao.findByMovieId(id);
        IMovieDao mdao= (IMovieDao) utils.getDaoImpl(DaoType.IMovieDao);            //这个是为了获取sum也就是总票房还是预售票房
        Movie movie=mdao.findMovieById(id);

        if(movie.getState()==0)
            movie.setSum(mdao.findSumOfExpectedMovieById(id));
        else if(movie.getState()==1)
            movie.setSum(mdao.findSumOfBoxOfficeById(id));

        for(int i=0;i<bookings.size();i++){                     //因为我们只要获取指定电影的评价，所以要把没有评价的购票记录取出
            if(bookings.get(i).getComment()==null||bookings.get(i).getComment().equals(""))
                bookings.remove(i);
        }


        utils.close();

        PageBean<Booking> pageBean=new PageBean<>();
        pageBean.setList(bookings);

        request.setAttribute("score",pageBean);           //贫家
        request.setAttribute("film",movie);             //电影详情
        System.out.println(movie);

        request.getRequestDispatcher("/movie/Movie.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
