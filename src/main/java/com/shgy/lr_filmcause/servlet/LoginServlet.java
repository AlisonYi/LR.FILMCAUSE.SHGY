package com.shgy.lr_filmcause.servlet;

import com.shgy.lr_filmcause.dao.IAdministratorDao;
import com.shgy.lr_filmcause.dao.IVipDao;
import com.shgy.lr_filmcause.domain.Administrator;
import com.shgy.lr_filmcause.domain.Vip;
import com.shgy.lr_filmcause.utils.DaoType;
import com.shgy.lr_filmcause.utils.DaoUtils;
import org.apache.ibatis.jdbc.Null;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=UTF-8");

        String requestURL = request.getHeader("referer");           // 获取请求是从哪里来的
         if(!requestURL.contains("vip")&&!requestURL.contains("administrator"))
                return;

        String password=request.getParameter("password");                               //获取账号密码
        String account=request.getParameter("account");
        String flag;                   //标识是什么登录
        System.out.println(account);
        System.out.println(password);

        DaoUtils daoUtils=new DaoUtils();                       //实例化utils

        if(requestURL.contains("vip")) {                        //如果是从vip登录页面来的
            IVipDao dao=(IVipDao) daoUtils.getDaoImpl(DaoType.IVipDao);             //实例化IVipDao
            Vip vip;
            if(account.contains("@")) {                                  //邮箱登录
                vip = dao.loginByEmail(account,password);
                flag="email";
            }
            else {                                                          //用户名登录
                vip = dao.loginByName(account, password);
                flag="name";
            }

            daoUtils.close();                                 //一定要注意关闭

             if(vip!=null){                                                 //匹配了
//                 Cookie cookieP=new Cookie("password",password);                    //设置cookie 暂存信息
                 Cookie cookieE=new Cookie("email",vip.getEmail());
                 Cookie cookieN=new Cookie("name",vip.getName());
//                 response.addCookie(cookieP);
                 response.addCookie(cookieE);
                 response.addCookie(cookieN);
                 response.sendRedirect(request.getContextPath()+"/index.jsp");
             }else{                                                             //不匹配
//                 String json="{\"tips\":\"匹配失败\"}";
                 String url=""+request.getContextPath()+"/vip/Login.jsp";
                 System.out.println(url);
                 response.getWriter().print("<script> alert('匹配失败!');window.location.href ='"+url+"' </script>");
             }
        }else{                                                      //从管理员登录来的
            System.out.println("管理员登录");
            IAdministratorDao dao= (IAdministratorDao) daoUtils.getDaoImpl(DaoType.IAdministratorDao);

            Administrator administrator=dao.login(Integer.parseInt(account),password);
            if(administrator!=null){
                Cookie cookieP=new Cookie("password",password);                    //设置cookie 暂存信息
                Cookie cookieI=new Cookie("id",""+administrator.getId());
                Cookie cookieR=new Cookie("rank",""+administrator.getRank());
                Cookie cookieE=new Cookie("AdEmail",administrator.getEmail());
                response.addCookie(cookieP);
                response.addCookie(cookieI);
                response.addCookie(cookieR);
                response.addCookie(cookieE);
                response.sendRedirect(request.getContextPath()+"/administrator/Main.jsp");
            }else{
                String url=""+request.getContextPath()+"/administrator/Login.jsp";
                System.out.println(url);
                response.getWriter().print("<script> alert('匹配失败!');window.location.href ='"+url+"' </script>");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        this.doPost(request, response);
    }
}
