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

@WebServlet("/Ad/SetUpServlet")
public class SetUpServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");

        String id=request.getParameter("id");

        DaoUtils utils=new DaoUtils();
        IAdministratorDao dao=(IAdministratorDao)utils.getDaoImpl(DaoType.IAdministratorDao);
        Administrator adm =dao.findById(Integer.parseInt(id));
        request.setAttribute("id",id);
        request.setAttribute("rank",adm.getRank());
        request.setAttribute("adEmail",adm.getEmail());

        System.out.println(adm);
        utils.close();
        request.getRequestDispatcher("/administrator/SetUp.jsp").forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
