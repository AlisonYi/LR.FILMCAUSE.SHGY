package com.shgy.lr_filmcause.servlet.vip;

import com.shgy.lr_filmcause.dao.IVipDao;
import com.shgy.lr_filmcause.domain.Vip;
import com.shgy.lr_filmcause.utils.DaoType;
import com.shgy.lr_filmcause.utils.DaoUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/VipRegisterServlet")
public class RegisterServlet extends HttpServlet{
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws  IOException {
        this.doPost(req,resp);
    }
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        req.setCharacterEncoding("utf-8");

        String email=req.getParameter("email");
        String name=req.getParameter("name");
        String password=req.getParameter("password");
        Vip vip=new Vip(email,name,password);

        DaoUtils utils=new DaoUtils();
        IVipDao dao= (IVipDao) utils.getDaoImpl(DaoType.IVipDao);
        dao.add(vip);

        utils.close();
        resp.sendRedirect(req.getContextPath()+"/vip/Login.jsp");
    }
}
