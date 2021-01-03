package com.shgy.lr_filmcause.dao;

import com.shgy.lr_filmcause.domain.Booking;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IBookingDao extends Dao{
    /**
     * 查询所有订单及评价,
     * @return
     */
    @Select( "select * from booking")
    @Results( id = "bookingMap", value = {
            @Result(id=true,column = "email" ,property = "email"),
            @Result(column = "vip_name" ,property = "vipName"),
            @Result(id=true,column = "id" ,property = "id"),
            @Result(column = "movie_name" ,property = "movieName"),
            @Result(column = "time" ,property = "time"),
            @Result(column = "seatx" ,property = "seatX"),
            @Result(column = "seaty" ,property = "seatY"),
            @Result(column = "comment" ,property = "comment"),
            @Result(column = "score" ,property = "score")
    })
    List<Booking> findAll();

    /**
     * 查询指定电影的购票记录
     */
    @Select("select * from booking where id=#{id}")
    @ResultMap("bookingMap")          //参数是value【】：1.如果参数只有一个value可以省略不写，2.数组中只有一个元素{}也可以不写
    List<Booking> findByMovieId(int id);

@ResultMap("bookingMap")
@Select("select * from booking where id=#{id} and email=#{email}")
    List<Booking> findBookings(@Param("id") int id,@Param("email") String email);

    @Update("update booking set comment=#{comment},score=#{score} where email=#{email} and id=#{id} and time=#{time}")
   void addCommentAndScore(Booking booking);

    @Insert("insert into booking(email,vip_name,id,movie_name,time,seatx,seaty,comment,score) values(#{email},#{vipName},#{id},#{movieName},#{time},#{seatX},#{seatY},#{comment},#{score})")
    void addBooking(Booking booking);


}
