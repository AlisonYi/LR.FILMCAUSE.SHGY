package com.shgy.lr_filmcause.dao;

import com.shgy.lr_filmcause.domain.Vip;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IVipDao extends Dao {
    /**
     * 查询所有用户
     * @return
     */
    @Select( "select * from vip")
    List<Vip> findAll();

    /**
     * 根据email查找用户
     * @param email
     * @return
     */
    @Select("select * from vip where email=#{email}")
    Vip findByEmail(String email);

    /**
     * 根据name查找用户
     * @param name
     * @return
     */
    @Select("select * from vip where name=#{name}")
    Vip findByName(String name);

    /**
     * 添加用户
     * @param vip
     */
    @Insert("insert into vip(email,name,password,photo) values(#{email},#{name},#{password},#{photo})")
    void add(Vip vip);

    /**
     * 根据email删除用户
     * @param email
     */
    @Delete("delete from vip where email=#{email}")
    void deleteByEmail(String email);

    /**
     *更新数据
     * @param v
     */
    @Update("update vip set name=#{name},password=#{password},photo=#{photo} where email=#{email}")
    void update(Vip v);

    /**
     * 根据email登录
     * @param email
     * @param password
     * @return
     */

    @Select("select * from vip where email=#{email} and password=#{password}")
    Vip loginByEmail(@Param("email") String email,@Param("password") String password);

    /**
     * 根据name登录
     * @param name
     * @param password
     * @return
     */
    @Select("select * from vip where name=#{name} and password=#{password}")
    Vip loginByName(@Param("name")String name,@Param("password")String password);

    @Select("select name from vip where email=#{email}")
    String findNameByEmail(String email);
}
