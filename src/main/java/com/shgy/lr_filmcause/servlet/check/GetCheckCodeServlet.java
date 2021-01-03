package com.shgy.lr_filmcause.servlet.check;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Properties;
import java.util.ResourceBundle;

@WebServlet("/GetCheckCodeServlet")
public class GetCheckCodeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response){
        response.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");

        String vipEmail=request.getParameter("email");
        int code=(int)(Math.random()*10000+1000);//随机产生验证码
        if(code>=10000)
            code=code-1000;

        //读取我邮箱的信息
        ResourceBundle resourceBundle = ResourceBundle.getBundle("MyEmailConfig");
        System.out.println(resourceBundle.getString("recipient"));

        Properties properties = new Properties();
        properties.put("mail.transport.protocol", "smtp");// 连接协议
        properties.put("mail.smtp.host", "smtp.qq.com");// 主机名
        properties.put("mail.smtp.port", 465);// 端口号
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.ssl.enable", "true");// 设置是否使用ssl安全连接 ---一般都使用
        properties.put("mail.debug", "true");// 设置是否显示debug信息 true 会在控制台显示相关信息
        // 得到回话对象
        Session session = Session.getInstance(properties);
        // 获取邮件对象
        Message message = new MimeMessage(session);
        // 设置发件人邮箱地址
        try {
            message.setFrom(new InternetAddress(resourceBundle.getString("recipient")));
            // 设置收件人邮箱地址
           // message.setRecipients(Message.RecipientType.TO, new InternetAddress[]{new InternetAddress(vipEmail),new InternetAddress("xxx@qq.com"),new InternetAddress("xxx@qq.com")});
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(vipEmail));//一个收件人
            // 设置邮件标题
            message.setSubject("LR.FilmCause.神画光影 验证码");
            // 设置邮件内容
            message.setText("验证码为: "+code+"  若非本人操作，请忽略");
            // 得到邮差对象
            Transport transport = session.getTransport();
            // 连接自己的邮箱账户
            transport.connect(resourceBundle.getString("from"), resourceBundle.getString("authorizationCode"));// 密码为QQ邮箱开通的stmp服务后得到的客户端授权码
            // 发送邮件
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();

//返回信息，因为验证码要和邮箱匹配
            String json="{\"code\":\""+code+"\",\"email\":\""+vipEmail+"\"}";
            System.out.println(json);
            response.getWriter().write(json);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
