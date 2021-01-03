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

@WebServlet("/Ad/UpdateServlet")
public class UpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String id=request.getParameter("id");
        String name=request.getParameter("name");
        String password=request.getParameter("passwordN");

        DaoUtils utils=new DaoUtils();
        IAdministratorDao dao=(IAdministratorDao )utils.getDaoImpl(DaoType.IAdministratorDao );
        Administrator administrator=dao.findById(Integer.parseInt(id));

        if(password!=null&&!password.equals(""))
            administrator.setPassword(password);
        System.out.println(name);
        if(name!=null&&!name.equals(""))
            administrator.setName(name);

        dao.update(administrator);

        utils.close();
        String url=""+request.getContextPath()+"/Ad/AdministratorsListServlet";
        response.getWriter().print("<script> alert('Modified successfully!');window.location.href ='"+url+"' </script>");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
