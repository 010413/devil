package cn.bgs.cpic.pojo;


public class TbAddress {

  private Integer id;
  private String name;
  private Integer level;
  private Integer pId;
  private Integer isParent;
  private String code;

  public String getCode() {
    return code;
  }

  public void setCode(String code) {
    this.code = code;
  }

  public Integer getIsParent() {
    return isParent;
  }

  public void setIsParent(Integer isParent) {
    this.isParent = isParent;
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


  public Integer getLevel() {
    return level;
  }

  public void setLevel(Integer level) {
    this.level = level;
  }

  public Integer getpId() {
    return pId;
  }

  public void setpId(Integer pId) {
    this.pId = pId;
  }

  @Override
  public String toString() {
    return "TbAddress{" +
            "id=" + id +
            ", name='" + name + '\'' +
            ", level=" + level +
            ", pId=" + pId +
            ", isParent=" + isParent +
            ", code='" + code + '\'' +
            '}';
  }
}
