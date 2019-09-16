package cn.bgs.cpic.controller;

import cn.bgs.cpic.pojo.*;
import cn.bgs.cpic.service.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("tbUser")
public class UserController {
    @Resource
    private IUserService iUserService;
    private String realth ="D:" +File.separator+"temp"+File.separator+"reception";

    @RequestMapping("login")
    @ResponseBody
    public Map<String,Object> login(String codename, String password, HttpSession session){
        TbUser tbUser = iUserService.login(codename);
        Map<String,Object> map = new HashMap<>();
        if (tbUser!=null){
            if (tbUser.getPassword().equals(password)){
                session.setAttribute("tbUser",tbUser);
                map.put("flag",true);
            }else{
                map.put("flag",false);
                map.put("error","密码错误");
            }
        }else{
            map.put("flag",false);
            map.put("error","codeName不存在");
        }
        return map;
    }
    @RequestMapping("loginOut")
    public String loginOut(HttpSession session){
        session.removeAttribute("tbUser");
        return "redirect:/login.jsp";
    }
    @RequestMapping("findUsers")
    @ResponseBody
    public  List<TbUser>  findData(){
        List<TbUser> tbUser = iUserService.findUsers();
        return tbUser;
    }
    @RequestMapping("findAllAddress")
    @ResponseBody
    public  List<TbAddress>  findAllAddress(Integer id){
        List<TbAddress> tbAddress = iUserService.findAllAddress(id);
        return tbAddress;
    }
    @RequestMapping("findAddressUsers")
    @ResponseBody
    public  List<TbAddress>  findAddressUsers(Integer id){
        List<TbAddress> tbAddress = iUserService.findAddressUsers(id);
        return tbAddress;
    }
    @RequestMapping("insertUser")
    @ResponseBody
    public  int  insertUser(TbUser tbUser){
        TbUser user = iUserService.login(tbUser.getCodename());
        int i = 0;
        if (user==null){
            i = iUserService.insertUser(tbUser);
        }
        return i;
    }
    @RequestMapping("updataAddress")
    @ResponseBody
    public  int  updataAddress(String name,Integer id){
        int i = iUserService.updataAddress(name,id);
        return i;
    }
    @RequestMapping("subAddress")
    @ResponseBody
    public  int  subAddress(TbAddress tbAddress){
        System.out.println(tbAddress);
        int i = iUserService.subAddress(tbAddress);
        return i;
    }
    @RequestMapping("deletAddress")
    @ResponseBody
    public  int  deletAddress(Integer id){
        int i=iUserService.deletAddress(id);
        return i;
    }
    @RequestMapping("findPlans")
    @ResponseBody
    public  List<TbPlan>  findPlans(HttpSession session){
        TbUser tbUser = (TbUser) session.getAttribute("tbUser");
        List<TbPlan> tbPlans = iUserService.findPlans(tbUser.getUserlevel());
        return tbPlans;
    }
    @RequestMapping("findData")
    @ResponseBody
    public  List<TbPlan>  findData(TableParam tableParam,HttpSession session){
        TbUser tbUser = (TbUser) session.getAttribute("tbUser");
        List<TbPlan> tbPlans = iUserService.findData(tableParam,tbUser.getUserlevel());
        return tbPlans;
    }
    @RequestMapping("subPlan")
    @ResponseBody
    public int subPlan(TbPlan tbPlan,HttpSession session){
        TbUser user = (TbUser) session.getAttribute("tbUser");
        tbPlan.setuId(user.getId());
        int i = iUserService.subPlan(tbPlan);
        return i;
    }
    @RequestMapping("insertReal")
    @ResponseBody
    public  int  insertReal(TbPlan tbPlan,HttpSession session){
//        System.out.println(tbPlan);
//        DecimalFormat df = new DecimalFormat("0.00");
//        df.format(tbPlan.getTables()/tbPlan.getPlanTables());
        session.setAttribute("planId",tbPlan.getId());
        double d = tbPlan.getTables();
        double d1 = tbPlan.getPlanTables();
        double d2 = d/d1;
        tbPlan.setImplementationRate(d2*100);
//        tbPlan.setImplementationRate(Double.valueOf(new DecimalFormat("0.00").format(d2)));
        System.out.println(tbPlan.getImplementationRate());
        int i = iUserService.insertReal(tbPlan);
        return i;
    }
    @RequestMapping("uploadFiles")
    @ResponseBody
    public boolean uploadFiles(@RequestParam("files")MultipartFile[] files, HttpSession session) throws IllegalStateException, IOException, IOException {
        //创建File
        File tempFile = new File(realth);
        if (!tempFile.isDirectory()) {
            tempFile.mkdirs();
        }
        //集合返回值
        boolean result = false;
        //创建批量插入对象
        List<TbGallery> list = new ArrayList<TbGallery>();
        TbGallery tbGallery = null;
        //获取当前系统时间
        long currTime = System.currentTimeMillis();
        //循环获取批量插入图片内容
        for (int i = 0; i < files.length; i++) {
            if (!files[i].isEmpty()) {
                tbGallery = new TbGallery();
                //获取后缀名
                String 	uniquename = files[i].getOriginalFilename();//得到文件名
                String suffix = uniquename.substring(uniquename.lastIndexOf(".")+1);//获取扩展名
                //得到文件路径
                String newName = uniquename.substring(0,uniquename.lastIndexOf("."))+"_"+currTime+"."+suffix;
                String filePath = realth+File.separator+newName;//路径
                tbGallery.setAlbumName(newName);
                //获取文件大小
//				long size = files[i].getSize();
                //上传
                files[i].transferTo(new File(filePath));//转存文件到对象list集合中
                list.add(tbGallery);
            }
        }
        int j = iUserService.uploadFiles(list);
        if (j>0) {
            result = true;
        }
        StringBuffer buf = new StringBuffer();
        for (int i = 0; i < list.size(); i++) {
            int id=list.get(i).getId();
            //将id根据逗号进行分隔
            buf.append(","+id);
        }
        int id = (int) session.getAttribute("planId");
        String gId = String.valueOf(buf.deleteCharAt(0));
        int o = iUserService.addGid(gId,id);
        session.removeAttribute("planId");
        return result;
    }
    @RequestMapping("showEcharts")
    @ResponseBody
    public List<TbPlan> xianFiline(HttpSession session, String planStarttime, String endryTime){
        //从session域中得到登录的用户数据

        TbUser tbUser= (TbUser) session.getAttribute("tbUser");

        Date d = new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy");
        String year = dateFormat.format(d);
        if(planStarttime==null) {
            planStarttime = year+ "-01-01";
        }
        if(endryTime==null) {
            endryTime = year+ "-12-31";
        }


        List<TbPlan> list = iUserService.shengFiline(planStarttime,endryTime);

        return list;
    }
}
