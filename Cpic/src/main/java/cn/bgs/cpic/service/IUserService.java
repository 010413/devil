package cn.bgs.cpic.service;



import cn.bgs.cpic.pojo.*;

import java.util.List;

public interface IUserService {
    TbUser login(String codename);

    List<TbUser> findUsers();

    List<TbAddress> findAllAddress(Integer id);

    List<TbAddress> findAddressUsers(Integer id);

    int insertUser(TbUser tbUser);

    int updataAddress(String name,Integer id);

    int subAddress(TbAddress tbAddress);

    int deletAddress(Integer id);

    List<TbPlan> findPlans(Integer userlevel);

    List<TbPlan> findData(TableParam tableParam, Integer userlevel);

    int subPlan(TbPlan tbPlan);

    int insertReal(TbPlan tbPlan);

    int uploadFiles(List<TbGallery> list);

    int addGid(String gId, int id);

    List<TbPlan> shengFiline(String planStarttime, String endryTime);
}
