package com.shgy.lr_filmcause.utils;

import com.shgy.lr_filmcause.dao.*;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;

public class DaoUtils {
    private InputStream in;
    private SqlSessionFactory factory;
    private SqlSession sqlSession;

    public DaoUtils()throws IOException{
        in=Resources.getResourceAsStream("SqlMapConfig.xml");
        factory=new SqlSessionFactoryBuilder().build(in);
        sqlSession=factory.openSession();
    }

    public Dao getDaoImpl(DaoType daoType) {
       if(DaoType.IBookingDao==daoType)
         return sqlSession.getMapper(IBookingDao.class);
       else if(DaoType.IVipDao==daoType)
           return sqlSession.getMapper(IVipDao .class);
       else if(DaoType.IAdministratorDao==daoType)
           return sqlSession.getMapper(IAdministratorDao.class);
       else if(DaoType.IMovieDao==daoType)
           return sqlSession.getMapper(IMovieDao.class);
       return null;
    }
 /*   public DaoUtils(IVipDao dao) throws IOException {
        this();
        dao=sqlSession.getMapper(IVipDao.class);
    }
    public DaoUtils(IAdministratorDao dao) throws IOException {
        this();
        dao=sqlSession.getMapper(IAdministratorDao.class);
    }
    public DaoUtils(IMovieDao dao) throws IOException {
        this();
        dao=sqlSession.getMapper(IMovieDao.class);
    }*/
    public void close() throws IOException {
        //提交一定不要忘记写
        sqlSession.commit();
        sqlSession.close();
        in.close();
    }
}
