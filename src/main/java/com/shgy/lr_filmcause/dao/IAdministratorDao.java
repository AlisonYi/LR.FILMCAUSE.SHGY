package com.shgy.lr_filmcause.dao;

import com.shgy.lr_filmcause.domain.Administrator;
import org.apache.ibatis.annotations.*;

import java.util.List;
import java.util.Map;

public interface IAdministratorDao extends Dao {
    /**
     * 根据id登录
     * @param id
     * @param password
     * @return
     */
    @Select("select * from administrator where id=#{id} and password=#{password}")
    Administrator login(@Param("id") int id,@Param("password") String password);

    /**
     * 根据name
     * @param name
     * @return
     */
    @Select("select * from administrator where name=#{name}")
    Administrator findByName(String name);

    /**
     * 根据emal
     * @param email
     * @return
     */
    @Select("select * from administrator where email=#{email}")
    Administrator findByEmail(String email);

    /**
     *
     * @param id
     * @return
     */
    @Select("select * from administrator where id=#{id}")
    Administrator findById(int id);

    /**
     * 添加管理员
     * @param adm
     */
    @Insert("insert into administrator(id,name,password,email,rank) values(#{id},#{name},#{password},#{email},#{rank})")
    void add(Administrator adm);

    /**
     * 查询总条数
     * @return
     */
    //实现动态 SQL 映射
    @SelectProvider(type = DynamicSQL.class,method = "findTotalCount")
    int findTotalCount(Map<String ,String[]> condition);

    /**
     * 查询某页的amd们
     * @param condition
     * @return
     */
    @SelectProvider(type = DynamicSQL.class,method = "findByPage")
    List<Administrator>findByPage(Map<String ,String[]> condition);

    /**
     * 根据id删除管理员
     * @param id
     */
    @Delete("delete from administrator where id=#{id}")
    void deleteById(int id);

    /**
     *更新数据
     * @param v
     */
    @Update("update administrator set name=#{name},password=#{password} where id=#{id}")
    void update(Administrator v);
}
