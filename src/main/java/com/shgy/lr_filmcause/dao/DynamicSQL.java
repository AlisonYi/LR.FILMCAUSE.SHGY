package com.shgy.lr_filmcause.dao;

import com.shgy.lr_filmcause.domain.Administrator;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class DynamicSQL {
    /**
     * 查询总条数
     * @param condition
     * @return
     */
    public String findTotalCount(Map<String ,String[]> condition){
        String sql="select count(*) from administrator where 1=1";
        StringBuilder sb=new StringBuilder(sql);
        //遍历map
        Set<String> keySet= condition.keySet();
        for(String key:keySet){
            //排除分页条件参数
            if("currentPage".equals(key)||"rows".equals(key)||"start".equals(key))           //因为在分页的时候，会在地址栏传入分页参数
                continue;
            String value = condition.get(key)[0];
            if(value!=null&&!"".equals(value)){
                //有值
                sb.append(" and ").append(key).append(" like \'%").append(value).append("%\'");
            }
        }
        System.out.println(sql);
        return String.valueOf(sb);
    }

    public String findByPage(Map<String ,String[]> condition){
        String sql="select * from administrator where 1=1";
        StringBuilder sb=new StringBuilder(sql);
        //遍历map
        Set<String> keySet= condition.keySet();
        for(String key:keySet){
            //排除分页条件参数、开始处
            if("currentPage".equals(key)||"rows".equals(key)||"start".equals(key))
                continue;
            String value = condition.get(key)[0];
            if(value!=null&&!"".equals(value)){
                //有值
                sb.append(" and ").append(key).append(" like \'%").append(value).append("%\'");
            }

        }
        sb.append(" limit ").append(condition.get("start")[0]).append(" , ").append(condition.get("rows")[0]);
        return String.valueOf(sb);
    }


    public String findMovieTotalCount(Map<String ,String[]> condition){
        String sql="select count(*) from movie where 1=1";
        StringBuilder sb=new StringBuilder(sql);
        //遍历map
        Set<String> keySet= condition.keySet();
        for(String key:keySet){
            //排除分页条件参数
            if("currentPage".equals(key)||"rows".equals(key)||"start".equals(key))           //因为在分页的时候，会在地址栏传入分页参数
                continue;
            String value = condition.get(key)[0];
            if(value!=null&&!"".equals(value)){
                //有值
                sb.append(" and ").append(key).append(" like \'%").append(value).append("%\'");
            }
        }
        return String.valueOf(sb);
    }

    public String findMovieByPage(Map<String ,String[]> condition){
        String sql="select * ,((movie.sell_sum + movie.expect_sum)* movie.price) AS sum from movie where 1=1";
        String value;

        StringBuilder  sb=new StringBuilder(sql);
        //遍历map
        Set<String> keySet= condition.keySet();
        for(String key:keySet){
            //排除分页条件参数、开始处
            if("currentPage".equals(key)||"rows".equals(key)||"start".equals(key))
                continue;
             value = condition.get(key)[0];
            if(value!=null&&!"".equals(value)){  //有
                sb.append(" and ").append(key).append(" like \'%").append(value).append("%\'");
            }

        }
        sb.append(" limit ").append(condition.get("start")[0]).append(" , ").append(condition.get("rows")[0]);
        System.out.println(sql);
        return String.valueOf(sb);
    }
}
