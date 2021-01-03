package com.shgy.lr_filmcause.servlet.vip;

import com.shgy.lr_filmcause.dao.IVipDao;
import com.shgy.lr_filmcause.domain.Vip;
import com.shgy.lr_filmcause.utils.DaoType;
import com.shgy.lr_filmcause.utils.DaoUtils;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

@WebServlet("/Vip/SetUpServlet")
@MultipartConfig
public class SetUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");

        String email=request.getParameter("email");
        String password=request.getParameter("passwordN");
        String name=request.getParameter("name");

        DaoUtils utils=new DaoUtils();
        IVipDao dao=(IVipDao)utils.getDaoImpl(DaoType.IVipDao);
        Vip vip=dao.findByEmail(email);

        if(!password.equals(""))
            vip.setPassword(password);
        if(!name.equals(""))
            vip.setName(name);

        System.out.println(vip);
        dao.update(vip);

        utils.close();
        String url=""+request.getContextPath()+"/vip/SetUp.jsp";
        response.getWriter().print("<script> alert('Modified successfully!');window.location.href ='"+url+"' </script>");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
