package com.shgy.lr_filmcause.servlet.movie;

import com.shgy.lr_filmcause.dao.IMovieDao;
import com.shgy.lr_filmcause.domain.Administrator;
import com.shgy.lr_filmcause.domain.Movie;
import com.shgy.lr_filmcause.domain.PageBean;
import com.shgy.lr_filmcause.service.AdministratorService;

import com.shgy.lr_filmcause.utils.DaoType;
import com.shgy.lr_filmcause.utils.DaoUtils;
import com.shgy.lr_filmcause.utils.ParameterUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/FindMovieByConditionServlet")
public class FindMovieByConditionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String referer=request.getHeader("referer");
        //获取查询参数
        String currentPage=request.getParameter("currentPage");
        String rows=request.getParameter("rows");

        if(currentPage==null||currentPage.equals("")){
            currentPage="1";
        }
        if(rows==null||rows.equals("")){
            if(referer.contains("index.jsp"))
                rows=String.valueOf(ParameterUtils.LITTLE_HOTMOVIE_STABLE_ROW);  //STABLE_ROW是自己定义的一个全局常量，代表每页条数
            else
                rows=String.valueOf(ParameterUtils.HOTMOVIE_STABLE_ROW);
        }

        PageBean<Movie> pageBean=new PageBean<>();

        DaoUtils utils=new DaoUtils();
        IMovieDao dao= (IMovieDao) utils.getDaoImpl(DaoType.IMovieDao);

        if(referer.contains("index.jsp")){
            pageBean.setList(dao.findHotMovie());
            PageBean<Movie> pageBean2=new PageBean<>();
            pageBean2.setList(dao.findComingSoonMovie());

            utils.close();//一定要记得关闭
            //将PageBean 存入request
            request.setAttribute("pageBeanHotMovie",pageBean);
            request.setAttribute("pageBeanComingSoonMovie",pageBean2);
            //转发
            request.setAttribute("ifFirst","yes");
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }else{
           /* pageBean.setCurrentPage(Integer.parseInt(currentPage));
            pageBean.setRows(Integer.parseInt(rows));
            pageBean.setTotalCount();
            //计算页数，设置pagebean的页数
            int totalPage= (pageBean.getTotalPage()%pageBean.getRows()) ==0 ? pageBean.getTotalPage()/pageBean.getRows() : pageBean.getTotalPage()/pageBean.getRows() +1;
            pageBean.setTotalPage(totalPage);

            request.setAttribute("STABLE_ROW",ParameterUtils.HOTMOVIE_STABLE_ROW);
            request.getRequestDispatcher("/movie/WellReceived.jsp").forward(request,response);*/

        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
