package com.os.pojo;

import java.util.Date;

public class O_Question {
    private Integer qId;

    private String qTitle;

    private Date qTime;

    private String qContent;

    private Integer qState;

    private Integer qUid;

    private Integer qReplyCount;

    private Integer qViewCount;

    private Integer qRid;

    private Integer qType;

    public Integer getqId() {
        return qId;
    }

    public void setqId(Integer qId) {
        this.qId = qId;
    }

    public String getqTitle() {
        return qTitle;
    }

    public void setqTitle(String qTitle) {
        this.qTitle = qTitle == null ? null : qTitle.trim();
    }

    public Date getqTime() {
        return qTime;
    }

    public void setqTime(Date qTime) {
        this.qTime = qTime;
    }

    public String getqContent() {
        return qContent;
    }

    public void setqContent(String qContent) {
        this.qContent = qContent == null ? null : qContent.trim();
    }

    public Integer getqState() {
        return qState;
    }

    public void setqState(Integer qState) {
        this.qState = qState;
    }

    public Integer getqUid() {
        return qUid;
    }

    public void setqUid(Integer qUid) {
        this.qUid = qUid;
    }

    public Integer getqReplyCount() {
        return qReplyCount;
    }

    public void setqReplyCount(Integer qReplyCount) {
        this.qReplyCount = qReplyCount;
    }

    public Integer getqViewCount() {
        return qViewCount;
    }

    public void setqViewCount(Integer qViewCount) {
        this.qViewCount = qViewCount;
    }

    public Integer getqRid() {
        return qRid;
    }

    public void setqRid(Integer qRid) {
        this.qRid = qRid;
    }

    public Integer getqType() {
        return qType;
    }

    public void setqType(Integer qType) {
        this.qType = qType;
    }
}