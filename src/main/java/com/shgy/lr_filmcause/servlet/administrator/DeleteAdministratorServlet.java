package com.shgy.lr_filmcause.servlet.administrator;

import com.shgy.lr_filmcause.dao.IAdministratorDao;
import com.shgy.lr_filmcause.utils.DaoType;
import com.shgy.lr_filmcause.utils.DaoUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/Ad/DeleteAdministratorServlet")
public class DeleteAdministratorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String[] ids=request.getParameterValues("id");
        DaoUtils utils=new DaoUtils();
        IAdministratorDao dao=((IAdministratorDao)utils.getDaoImpl(DaoType.IAdministratorDao));
        for(int i=0;i<ids.length;i++)
           dao.deleteById(Integer.parseInt(ids[i]));

        utils.close();
        response.sendRedirect(request.getContextPath()+"/Ad/AdministratorsListServlet");
    }
}
