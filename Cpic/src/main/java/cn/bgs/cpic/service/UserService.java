package cn.bgs.cpic.service;

import cn.bgs.cpic.dao.IUserDao;
import cn.bgs.cpic.pojo.*;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class UserService implements IUserService {
    @Resource
    private IUserDao iUserDao;

    @Override
    public TbUser login(String codename) {
        return iUserDao.login(codename);
    }

    @Override
    public List<TbUser> findUsers() {
        return iUserDao.findUsers();
    }

    @Override
    public List<TbAddress> findAllAddress(Integer id) {
        return iUserDao.findAllAddress(id);
    }

    @Override
    public List<TbAddress> findAddressUsers(Integer id) {
        return iUserDao.findAddressUsers(id);
    }

    @Override
    public int insertUser(TbUser tbUser) {
        return iUserDao.insertUser(tbUser);
    }

    @Override
    public int updataAddress(String name,Integer id) {
        return iUserDao.updataAddress(name,id);
    }

    @Override
    public int subAddress(TbAddress tbAddress) {
        return iUserDao.subAddress(tbAddress);
    }

    @Override
    public int deletAddress(Integer id) {
        return iUserDao.deletAddress(id);
    }

    @Override
    public List<TbPlan> findPlans(Integer userlevel) {
        return iUserDao.findPlans(userlevel);
    }

    @Override
    public List<TbPlan> findData(TableParam tableParam, Integer userlevel) {
        return iUserDao.findData(tableParam,userlevel);
    }

    @Override
    public int subPlan(TbPlan tbPlan) {
        return iUserDao.subPlan(tbPlan);
    }

    @Override
    public int insertReal(TbPlan tbPlan) {
        return iUserDao.insertReal(tbPlan);
    }

    @Override
    public int uploadFiles(List<TbGallery> list) {
        return iUserDao.uploadFiles(list);
    }

    @Override
    public int addGid(String gId, int id) {
        return iUserDao.addGid(gId,id);
    }

    @Override
    public List<TbPlan> shengFiline(String planStarttime, String endryTime) {
        return iUserDao.shengFiline(planStarttime,endryTime);
    }

}
