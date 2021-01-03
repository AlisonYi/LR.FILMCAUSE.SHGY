package com.shgy.lr_filmcause.servlet.check;

import com.shgy.lr_filmcause.dao.IAdministratorDao;
import com.shgy.lr_filmcause.dao.IVipDao;
import com.shgy.lr_filmcause.domain.Administrator;
import com.shgy.lr_filmcause.domain.Vip;
import com.shgy.lr_filmcause.utils.DaoType;
import com.shgy.lr_filmcause.utils.DaoUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/CheckAccountServlet")
public class CheckAccountServlet extends HttpServlet {  //账号密码是不是匹配
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");

        String referer=request.getHeader("referer");
        String password=request.getParameter("password");
        String account;

        DaoUtils utils=new DaoUtils();
        String json;
        if(referer.contains("vip")){
            account=request.getParameter("email");
            Vip vip=((IVipDao)utils.getDaoImpl(DaoType.IVipDao)).loginByEmail(account,password);
            if(vip!=null){
                json="{\"msg\":\"true\"}";
            }else{
                json="{\"msg\":\"false\"}";
            }
        }else{
            account=request.getParameter("id");
            Administrator adm=((IAdministratorDao)utils.getDaoImpl(DaoType.IAdministratorDao)).login(Integer.parseInt(account),password);
            if(adm!=null){
                json="{\"msg\":\"true\"}";
            }else{
                json="{\"msg\":\"false\"}";
            }
        }

        utils.close();
        response.getWriter().write(json);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
