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

@WebServlet("/CheckNameServlet")
public class checkNameServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");

        String referer=request.getHeader("referer");
        String name=request.getParameter("name");

        DaoUtils daoUtils=new DaoUtils();
        String jason;
        if(referer.contains("vip")){
            IVipDao dao= (IVipDao) daoUtils.getDaoImpl(DaoType.IVipDao);
            if(dao.findByName(name)==null)
                jason="{\"msg\":\"success\",\"info\":\"此用户名可用嘞\"}";
            else
                jason="{\"msg\":\"fail\",\"info\":\"此用户名太受欢迎，请换一个\"}";
        }else {
            System.out.println("dddd");
            IAdministratorDao dao= (IAdministratorDao) daoUtils.getDaoImpl(DaoType.IAdministratorDao);
            if(dao.findByName(name)==null)
                jason="{\"msg\":\"success\",\"info\":\"此用户名可用嘞\"}";
            else
                jason="{\"msg\":\"fail\",\"info\":\"此用户名太受欢迎，请换一个\"}";
        }

        daoUtils.close();
        response.getWriter().write(jason) ;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
