package com.shgy.lr_filmcause.filter;


import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebFilter(value = {"/Vip/*","/vip/SetUp.jsp","/vip/comment.jsp"})
public class VipFilter implements Filter {
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
        response.setContentType("text/html;charset=UTF-8");

        Cookie[] cookies=request.getCookies();
        boolean ifPass=false;
        for(Cookie cookie:cookies)
            if("name".equals(cookie.getName())){
                ifPass=true;
                filterChain.doFilter(request, servletResponse);  //放行
            }
        if(!ifPass){                //如果没放行
            String url=""+request.getContextPath()+"/vip/Login.jsp";
            System.out.println(url);
            response.getWriter().print("<script> alert('您还未登录!');window.location.href ='"+url+"' </script>");
        }
    }

    @Override
    public void destroy() {

    }
}
