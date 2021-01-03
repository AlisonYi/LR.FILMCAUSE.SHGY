package com.shgy.lr_filmcause.servlet.check;

import com.shgy.lr_filmcause.dao.IAdministratorDao;
import com.shgy.lr_filmcause.dao.IVipDao;
import com.shgy.lr_filmcause.utils.DaoType;
import com.shgy.lr_filmcause.utils.DaoUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/CheckEmailServlet")
public class CheckEmailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws  IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");

        String referer=request.getHeader("referer");
        String email=request.getParameter("email");

        String jason;
        DaoUtils daoUtils=new DaoUtils();

        if(referer.contains("vip")){            //是从vip的页面来的
            IVipDao dao= (IVipDao) daoUtils.getDaoImpl(DaoType.IVipDao);
            if(dao.findByEmail(email)==null)
                jason="{\"msg\":\"success\",\"info\":\"此邮箱可用嘞\"}";
            else
                jason="{\"msg\":\"fail\",\"info\":\"此邮箱太受欢迎，请换一个\"}";
        }else{                      //管理员来的
            System.out.println("管理员来的验证邮箱");
            IAdministratorDao dao= (IAdministratorDao) daoUtils.getDaoImpl(DaoType.IAdministratorDao);
            if(dao.findByEmail(email)==null)
                jason="{\"msg\":\"success\",\"info\":\"此邮箱可用嘞\"}";
            else
                jason="{\"msg\":\"fail\",\"info\":\"此邮箱太受欢迎，请换一个\"}";
        }

        daoUtils.close();
        response.getWriter().write(jason) ;

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        this.doPost(request, response);
    }
}
