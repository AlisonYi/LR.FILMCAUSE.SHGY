package com.shgy.lr_filmcause.servlet.administrator;

import com.shgy.lr_filmcause.domain.Administrator;
import com.shgy.lr_filmcause.domain.Movie;
import com.shgy.lr_filmcause.domain.PageBean;
import com.shgy.lr_filmcause.service.AdministratorService;
import com.shgy.lr_filmcause.utils.ParameterUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/Ad/FindMovieByPageServlet")
public class FindMovieByPageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        //获取查询参数
        //这里新建一个Map再把request.getParameterMap()赋值给map是因为，request.getParameterMap()获得的map，不能修改
        //因为我要把rows和currentPage放到map中，要调用的时候，就可以取出来用，不用单独作为参数传入方法中
        //不单独作为参数的主要原因是 mabatis注解配置 动态sql语句 若传入多个参数，需要用map接收，而我本身就要又一个map，所以为了避免麻烦就把row和currentPage放到了map中
        Map<String, String[]> condition =new HashMap<>(request.getParameterMap());//把表提交的数据封装起来（(第一次进入无当前页面和条数)有当前页面，每页条数，和三个查询条件）

        String currentPage,rows;

        if(!condition.containsKey("currentPage")){             //第一次访问的时候没有 当前页面和rows的参数 ，所以需要手动设置
            currentPage="1";
            String[] strs=new String[]{currentPage};
            System.out.println("First-currentPage "+strs[0]);
            condition.put("currentPage",strs);
            System.out.println(condition.get("currentPage")[0]);
        }
        if(!condition.containsKey("rows")){
            rows=String.valueOf(ParameterUtils.STABLE_ROW);//STABLE_ROW是自己定义的一个全局常量，代表每页条数
            String[] strs=new String[]{rows};
            System.out.println("First-rows"+strs[0]);
            condition.put("rows",strs);
        }

        //调用  AdministratorService查询
        AdministratorService service= new  AdministratorService();
        PageBean<Movie> pageBean=service.findMovieByPage(condition);

        //将PageBean 存入request
        request.setAttribute("pageBean",pageBean);
        request.setAttribute("condition",condition); //查询条件页存入request，给搜索框输入内容的回显用
        request.setAttribute("STABLE_ROW",ParameterUtils.STABLE_ROW);
        //转发到list.jsp
        request.getRequestDispatcher("/administrator/MoviesList.jsp").forward(request,response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
