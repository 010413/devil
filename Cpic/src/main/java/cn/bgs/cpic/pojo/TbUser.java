package cn.bgs.cpic.pojo;


public class TbUser {

  private Integer id;
  private String name;
  private String codename;
  private String password;
  private Integer userlevel;
  private Integer aid;

  public Integer getAid() {
    return aid;
  }

  public void setAid(Integer aid) {
    this.aid = aid;
  }

  public Integer getId() {
    return id;
  }

  public void setId(Integer id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public String getCodename() {
    return codename;
  }

  public void setCodename(String codename) {
    this.codename = codename;
  }


  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }


  public Integer getUserlevel() {
    return userlevel;
  }

  public void setUserlevel(Integer userlevel) {
    this.userlevel = userlevel;
  }

}
