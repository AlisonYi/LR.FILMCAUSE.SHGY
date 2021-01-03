package com.shgy.lr_filmcause.dao;

import com.shgy.lr_filmcause.domain.Administrator;
import com.shgy.lr_filmcause.domain.Movie;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface IMovieDao extends Dao {

    @Select("select count(*) from hot_movie")
    int findHotMovieTotalCount();

    @Select("select * from hot_movie")
    List<Movie> findHotMovie();

    @Select("select count(*) from comingsoon_movie")
    int findComingSoonTotalCount();

    @Select("select * from comingsoon_movie")
    List<Movie> findComingSoonMovie();

    @Select("select * from box_office")
    List<Movie> findBoxOfficeMovie();

    @Select("select * from most_expected")
    List<Movie> findMostExpectedMovie();

    @Results( id = "MovieMap", value = {
            @Result(id=true,column = "id" ,property = "id"),
            @Result(column = "name" ,property = "name"),
            @Result(column = "price" ,property = "price"),
            @Result(column = "actors" ,property = "actors"),
            @Result(column = "director" ,property = "director"),
            @Result(column = "score" ,property = "score"),
            @Result(column = "state" ,property = "state"),
            @Result(column = "post" ,property = "post"),
            @Result(column = "expect_sum" ,property = "expect_sum"),
//            @Result(column = "id",property = "accounts" ,many = @Many(select = "dao.IAccountDao.findByUid",fetchType = FetchType.LAZY))
    })


    @Select("select * from movie where id=#{id}")
    Movie findMovieById(int id);

    @Select("select sum from most_expected where id=#{id}")
    int findSumOfExpectedMovieById(int id);

    @Select("select sum from box_office where id=#{id}")
    int findSumOfBoxOfficeById(int id);

    @Select("select name from movie where id=#{id}")
    String findNameById(int id);


    /**
     * 查询总条数
     * @return
     */
    //实现动态 SQL 映射
    @SelectProvider(type = DynamicSQL.class,method = "findMovieTotalCount")
    int findMovieTotalCount(Map<String ,String[]> condition);


    /**
     * 查询某页的movie们
     * @param condition
     * @return
     */
    @SelectProvider(type = DynamicSQL.class,method = "findMovieByPage")
    List<Movie>findMovieByPage(Map<String ,String[]> condition);

    @Delete("delete from movie where id=#{id}")
    void deleteMovieById(int id);

    @Update("update movie set price=#{price},state=#{state} where id=#{id}")
    void updateMovie(Movie movie);

    @Select("select * from movie where name like #{condition} or actors like #{condition} or director like #{condition}")
    List<Movie> findMoviesByCondition(String condition);

    @Update("update movie set score=#{score} where id=#{id}")
    void updateMovieScore(@Param("id") int id,@Param("score") float score);

    @Select("select sum_score from score where id= #{id}")
    int findScoreByidFromScoreTable(int id);

    @Select("select sell_sum from movie where id=#{id}")
    int findSellSumById(int id);

    @Select("select expect_sum from movie where id=#{id}")
    int findExpectSumById(int id);

    @Update("update movie set sell_sum=#{sum} where id=#{id}")
    void updateSellSumById(@Param("id") int id,@Param("sum") int sum);

    @Update("update movie set expect_sum=#{sum} where id=#{id}")
    void updateExpectSumById(@Param("id") int id,@Param("sum") int sum);

    @Insert("insert into movie(id,name,price,actors,director,score,state,post,sell_sum,expect_sum) values(#{id},#{name},#{price},#{actors},#{director},${price},#{state},#{post},#{sell_sum},#{expect_sum})")
    void addMovie(Movie movie);

    @Select("select * from movie where state=#{state}")
    List<Movie>findMoviesByState(int state);
}
