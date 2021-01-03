package com.shgy.lr_filmcause.servlet.administrator;

import com.shgy.lr_filmcause.dao.IAdministratorDao;
import com.shgy.lr_filmcause.dao.IMovieDao;
import com.shgy.lr_filmcause.domain.Administrator;
import com.shgy.lr_filmcause.domain.Movie;
import com.shgy.lr_filmcause.utils.DaoType;
import com.shgy.lr_filmcause.utils.DaoUtils;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.*;

@MultipartConfig
@WebServlet("/Ad/AddMovieServlet")
public class AddMovieServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setContentType("application/json; charset=utf-8");

        String id=request.getParameter("id");
        String actors=request.getParameter("actors");
        String name=request.getParameter("name");
        String director=request.getParameter("director");
        String state=request.getParameter("state");
        String price=request.getParameter("price");

        Part part=request.getPart("post");
        String fileName=part.getSubmittedFileName();//获取文件名

        //创建保存文件目录
        String dir = this.getServletContext().getRealPath("/images/movie");
        //判断目录是否存在
        File imgDir=new File(dir);
        if(!imgDir.exists()){
            imgDir.mkdirs();
        }
        //上传到服务器文件路径
        part.write(dir+"/"+fileName);
//      this.writeTo(request,fileName,part);

        Movie film=new Movie(Integer.parseInt(id), name,Integer.parseInt(price) , actors, director,Integer.parseInt(state),"/images/movie/"+fileName);
        System.out.println(film);
        DaoUtils utils=new DaoUtils();
        IMovieDao dao= (IMovieDao) utils.getDaoImpl(DaoType.IMovieDao);
        dao.addMovie(film);

        utils.close();
        String url=""+request.getContextPath()+"/Ad/MoviesListServlet";
        response.getWriter().print("<script> alert('Add successfully!');window.location.href ='"+url+"' </script>");

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

  /*  private  void writeTo(HttpServletRequest request,String fileName,Part part) throws IOException {
        InputStream in=part.getInputStream();
        OutputStream out=new FileOutputStream(request.getContextPath()+"/images/movie/"+fileName);
        byte[] b=new byte[1024];
        int length=-1;
        while((length=in.read(b))!=-1){
            out.write(b, 0, length);
        }
        in.close();
        out.close();
    }*/
}
