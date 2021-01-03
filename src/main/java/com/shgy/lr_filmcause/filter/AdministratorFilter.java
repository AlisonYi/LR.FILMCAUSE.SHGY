package com.shgy.lr_filmcause.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(value = {"/Ad/*","/administrator/AddAdministrator.jsp","/administrator/AdministratorsList.jsp","/administrator/SetUp.jsp","/administrator/Main.jsp"})
public class AdministratorFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        /*
        * 过滤器拦截到请求之后，首先是执行doFilter()方法中chain.doFilter()之前的代码，
        * 然后放弃权限给下一个过滤器或者serverlet等等，最后才执行chain.doFilter()之后的代码。
        * */

        //要强制转换,ServletRequest是一个接口,HttpServletRequest是ServletRequest的孩子
        //只有带Http的HttpServlet才有和http有关的请求和想要的方法
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response= (HttpServletResponse) servletResponse;
        boolean ifPass=false;
        if(request.getRequestURL().toString().contains("/administrator/Login.jsp")) {//如果是要去登录界面
            filterChain.doFilter(request, response);  //放行
        }else{
            response.setContentType("text/html;charset=UTF-8");
            Cookie[] cookies=request.getCookies();
            for(Cookie cookie:cookies){
                if("rank".equals(cookie.getName())){
                    System.out.println("放行");
                    ifPass=true;
                    filterChain.doFilter(request, response);  //放行
                }
            }
            if(!ifPass){                                //如果是没放行
                String url=""+request.getContextPath()+"/administrator/Login.jsp";
                response.getWriter().print("<script> alert('您未使用管理员账号登录!');window.location.href ='"+url+"' </script>");
            }
        }
    }

    @Override
    public void destroy() {

    }
}
