package com.shgy.lr_filmcause.servlet.vip;

import com.shgy.lr_filmcause.dao.IBookingDao;
import com.shgy.lr_filmcause.dao.IMovieDao;
import com.shgy.lr_filmcause.dao.IVipDao;
import com.shgy.lr_filmcause.domain.Booking;
import com.shgy.lr_filmcause.utils.DaoType;
import com.shgy.lr_filmcause.utils.DaoUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Time;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet("/Vip/BookingServlet")
public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
            String idS=request.getParameter("id");
            String email=request.getParameter("email");
            int id=Integer.parseInt(idS);

        DaoUtils utils=new DaoUtils();
        IVipDao dao= (IVipDao) utils.getDaoImpl(DaoType.IVipDao);
        IMovieDao mdao= (IMovieDao) utils.getDaoImpl(DaoType.IMovieDao);
        IBookingDao bdao= (IBookingDao) utils.getDaoImpl(DaoType.IBookingDao);
        Booking booking=new Booking(email, dao.findNameByEmail(email), id, mdao.findNameById(id) ,new Timestamp(new Date().getTime()), 0, 0);

        bdao.addBooking(booking);

        //跟新movie订票数量
        if(mdao.findMovieById(id).getState()==0){
            int sum=mdao.findExpectSumById(id);
            mdao.updateExpectSumById(id,sum+1);
        }else{
            int sum=mdao.findSellSumById(id);
            mdao.updateSellSumById(id,sum+1);
        }
        utils.close();
        String url=""+request.getContextPath()+"/MovieServlet?id="+id;
        System.out.println(url);
        response.getWriter().print("<script> alert('订票成功 !');window.location.href ='"+url+"' </script>");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
