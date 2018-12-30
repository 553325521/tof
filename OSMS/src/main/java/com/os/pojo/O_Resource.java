package com.os.pojo;

import java.util.Date;

public class O_Resource {
    private Integer resourceId;

    private String resourceType;

    private String resourceUrl;

    private Date resourceTime;

    private String resourceName;

    public Integer getResourceId() {
        return resourceId;
    }

    public void setResourceId(Integer resourceId) {
        this.resourceId = resourceId;
    }

    public String getResourceType() {
        return resourceType;
    }

    public void setResourceType(String resourceType) {
        this.resourceType = resourceType == null ? null : resourceType.trim();
    }

    public String getResourceUrl() {
        return resourceUrl;
    }

    public void setResourceUrl(String resourceUrl) {
        this.resourceUrl = resourceUrl == null ? null : resourceUrl.trim();
    }

    public Date getResourceTime() {
        return resourceTime;
    }

    public void setResourceTime(Date resourceTime) {
        this.resourceTime = resourceTime;
    }

    public String getResourceName() {
        return resourceName;
    }

    public void setResourceName(String resourceName) {
        this.resourceName = resourceName == null ? null : resourceName.trim();
    }
}