package com.shgy.lr_filmcause.servlet.administrator;

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
import java.util.Arrays;

@WebServlet("/Ad/AddAdministratorServlet")
public class AddAdministratorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");

        String email=request.getParameter("email");
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        String rank=request.getParameter("rank");
        Administrator amd=new Administrator(name,password,email, Integer.parseInt(rank));

        DaoUtils utils=new DaoUtils();
        IAdministratorDao dao= (IAdministratorDao) utils.getDaoImpl(DaoType.IAdministratorDao);
        dao.add(amd);

        utils.close();
        response.sendRedirect(request.getContextPath()+"/administrator/AdministratorsList.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
