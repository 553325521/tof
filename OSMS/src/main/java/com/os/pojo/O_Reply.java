package com.os.pojo;

import java.util.Date;

public class O_Reply {
    private Integer rId;

    private Date rTime;

    private Integer rUId;

    private String rContent;

    private Integer rQId;

    private String uName;

    private String qTitle;


    public String getqTitle() {
        return qTitle;
    }

    public void setqTitle(String qTitle) {
        this.qTitle = qTitle;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public Integer getrId() {
        return rId;
    }

    public void setrId(Integer rId) {
        this.rId = rId;
    }

    public Date getrTime() {
        return rTime;
    }

    public void setrTime(Date rTime) {
        this.rTime = rTime;
    }

    public Integer getrUId() {
        return rUId;
    }

    public void setrUId(Integer rUId) {
        this.rUId = rUId;
    }

    public String getrContent() {
        return rContent;
    }

    public void setrContent(String rContent) {
        this.rContent = rContent == null ? null : rContent.trim();
    }

    public Integer getrQId() {
        return rQId;
    }

    public void setrQId(Integer rQId) {
        this.rQId = rQId;
    }
}