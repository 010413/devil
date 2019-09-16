package cn.bgs.cpic.pojo;


import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class TbPlan {
  private String adname;
  private Integer aid;
  private Integer id;
  private String planName;
  private Double planTables;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date planStarttime;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date planEndtime;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date entryTime;
  @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
  private Date executionTime;
  private Double tables;
  private String intentionalCustomer;
  private String newCustomer;
  private String oldCustomer;
  private Double predictedPremium;
  private Double implementationRate;
  private String gId;
  private Integer uId;

  public String getAdname() {
    return adname;
  }

  public void setAdname(String adname) {
    this.adname = adname;
  }

  public Integer getuId() {
    return uId;
  }

  public void setuId(Integer uId) {
    this.uId = uId;
  }

  public String getgId() {
    return gId;
  }

  public void setgId(String gId) {
    this.gId = gId;
  }

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

  public String getPlanName() {
    return planName;
  }

  public void setPlanName(String planName) {
    this.planName = planName;
  }

  public Double getPlanTables() {
    return planTables;
  }

  public void setPlanTables(Double planTables) {
    this.planTables = planTables;
  }

  public Date getPlanStarttime() {
    return planStarttime;
  }

  public void setPlanStarttime(Date planStarttime) {
    this.planStarttime = planStarttime;
  }

  public Date getPlanEndtime() {
    return planEndtime;
  }

  public void setPlanEndtime(Date planEndtime) {
    this.planEndtime = planEndtime;
  }

  public Date getEntryTime() {
    return entryTime;
  }

  public void setEntryTime(Date entryTime) {
    this.entryTime = entryTime;
  }

  public Date getExecutionTime() {
    return executionTime;
  }

  public void setExecutionTime(Date executionTime) {
    this.executionTime = executionTime;
  }

  public Double getTables() {
    return tables;
  }

  public void setTables(Double tables) {
    this.tables = tables;
  }

  public String getIntentionalCustomer() {
    return intentionalCustomer;
  }

  public void setIntentionalCustomer(String intentionalCustomer) {
    this.intentionalCustomer = intentionalCustomer;
  }

  public String getNewCustomer() {
    return newCustomer;
  }

  public void setNewCustomer(String newCustomer) {
    this.newCustomer = newCustomer;
  }

  public String getOldCustomer() {
    return oldCustomer;
  }

  public void setOldCustomer(String oldCustomer) {
    this.oldCustomer = oldCustomer;
  }

  public Double getPredictedPremium() {
    return predictedPremium;
  }

  public void setPredictedPremium(Double predictedPremium) {
    this.predictedPremium = predictedPremium;
  }

  public Double getImplementationRate() {
    return implementationRate;
  }

  public void setImplementationRate(Double implementationRate) {
    this.implementationRate = implementationRate;
  }

}
