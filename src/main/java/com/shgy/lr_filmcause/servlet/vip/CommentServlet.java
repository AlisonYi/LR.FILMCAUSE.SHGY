package com.shgy.lr_filmcause.servlet.vip;

import com.shgy.lr_filmcause.dao.IBookingDao;
import com.shgy.lr_filmcause.dao.IMovieDao;
import com.shgy.lr_filmcause.domain.Booking;
import com.shgy.lr_filmcause.utils.DaoType;
import com.shgy.lr_filmcause.utils.DaoUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/Vip/CommentServlet")
public class CommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");
            String idS=request.getParameter("id");
            String scoreS=request.getParameter("score");
            String comment=request.getParameter("comment");
            String email=request.getParameter("email");

            int id=Integer.parseInt(idS);
            float score=((int)(Float.parseFloat(scoreS)*10))/10;       //保留1为小鼠


        DaoUtils utils=new DaoUtils();


        //添加购买记录里面得评价、评分
        IBookingDao dao= (IBookingDao) utils.getDaoImpl(DaoType.IBookingDao);
        List<Booking> bookings=dao.findBookings(id,email);           //因为主键有三个，所以用过两个主键找购买的记录，可能会有多个
        if(bookings.isEmpty()){
            utils.close();
            String url=""+request.getContextPath()+"/MovieServlet?id="+id;
            System.out.println(url);
            response.getWriter().print("<script> alert('请先购票再评价!');window.location.href ='"+url+"' </script>");
        }else{
            System.out.println("uuuuu");
            Booking booking=null;
            for(Booking b:bookings){                                //找到一个没有评论的购买记录，赋值
                if(b.getComment()==null||b.getComment().equals("")){
                    booking=b;
                    System.out.println("hhh");
                    break;
                }
            }
            if(booking==null)                               //如果所有的都已经评价了就把第一个评分和评论换掉
                booking=bookings.get(0);

            booking.setComment(comment);
            booking.setScore(score);

            dao.addCommentAndScore(booking);   //添加评价


            //跟新电影评分
            //刚刚以及把评价添加金购买记录了，所以socre视图已经把最新得平均分更新了，所以要从里面取出来设置到电影表里
            IMovieDao mdao= (IMovieDao) utils.getDaoImpl(DaoType.IMovieDao);
            float scoreN=mdao.findScoreByidFromScoreTable(id);
            mdao.updateMovieScore(id,scoreN);

            utils.close();
            String url=""+request.getContextPath()+"/MovieServlet?id="+id;
            System.out.println(url);
            response.getWriter().print("<script> alert('comment successfully !');window.location.href ='"+url+"' </script>");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
