/*
import com.shgy.lr_filmcause.dao.IVipDao;
import com.shgy.lr_filmcause.domain.Booking;
import com.shgy.lr_filmcause.dao.IBookingDao;
import com.shgy.lr_filmcause.domain.Vip;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class daotest {
    private InputStream in;
    private SqlSessionFactory factory;
    private SqlSession sqlSession;
    private IBookingDao bdao;
    private IVipDao vdao;
    @Before
    public  void init() throws IOException {
        in= Resources.getResourceAsStream("SqlMapConfig.xml");
        factory=new SqlSessionFactoryBuilder().build(in);
        sqlSession=factory.openSession();
        bdao=sqlSession.getMapper(IBookingDao.class);
        vdao=sqlSession.getMapper(IVipDao.class);
    }
    @After
    public void close() throws IOException {
        //提交一定不要忘记写
        sqlSession.commit();
        sqlSession.close();
        in.close();
    }

    @Test
    public void findAll(){
        List<Booking> bookings=bdao.findAll();

        for(Booking booking:bookings) {
            System.out.println("=========每个账户的信息========");
            System.out.println(booking);
        }
    }

    @Test
    public void findByMovieId(){
        List<Booking> bookings=bdao.findByMovieId(1);

        for(Booking booking:bookings) {
            System.out.println(booking.getVipName()+" 评价: "+booking.getComment()+" ,评分 "+booking.getScore());
        }
    }

    //-------------------------------------------vip--------------------------------------------------------------------

    @Test
    public void findAllVip(){
        List<Vip> vips=vdao.findAll();

        for(Vip vip:vips) {
            System.out.println("=========每个账户的信息========");
            System.out.println(vip);
        }
    }
}
*/
