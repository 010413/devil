package cn.bgs.cpic.dao;


import cn.bgs.cpic.pojo.*;
import org.apache.ibatis.annotations.Param;


import java.util.List;

public interface IUserDao {

    TbUser login(String codename);

    List<TbUser> findUsers();

    List<TbAddress> findAllAddress(@Param("pId") Integer id);

    List<TbAddress> findAddressUsers(@Param("id")Integer id);

    int insertUser(TbUser tbUser);

    int updataAddress(@Param("name")String name,@Param("id")Integer id);

    int subAddress(TbAddress tbAddress);

    int deletAddress(Integer id);

    List<TbPlan> findPlans(Integer userlevel);

    List<TbPlan> findData(@Param("tableParam")TableParam tableParam,@Param("userlevel") Integer userlevel);

    int subPlan(TbPlan tbPlan);

    int insertReal(TbPlan tbPlan);

    int uploadFiles(List<TbGallery> list);

    int addGid(@Param("gId")String gId,@Param("id")int id);

    List<TbPlan> shengFiline(@Param("planStarttime")String planStarttime, @Param("endryTime")String endryTime);
}