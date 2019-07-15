package com.springboot.mariadb.entity;

import java.util.Date;

public class MailSend {
    private String sendId;

    private String sendUserId;

    private String sendTo;

    private String sendContent;

    private Double sendPriority;

    private Double sendCount;

    private String sendStatus;

    private String remark;

    private Double version;

    private String updateBy;

    private Date updateTime;

    public String getSendId() {
        return sendId;
    }

    public void setSendId(String sendId) {
        this.sendId = sendId == null ? null : sendId.trim();
    }

    public String getSendUserId() {
        return sendUserId;
    }

    public void setSendUserId(String sendUserId) {
        this.sendUserId = sendUserId == null ? null : sendUserId.trim();
    }

    public String getSendTo() {
        return sendTo;
    }

    public void setSendTo(String sendTo) {
        this.sendTo = sendTo == null ? null : sendTo.trim();
    }

    public String getSendContent() {
        return sendContent;
    }

    public void setSendContent(String sendContent) {
        this.sendContent = sendContent == null ? null : sendContent.trim();
    }

    public Double getSendPriority() {
        return sendPriority;
    }

    public void setSendPriority(Double sendPriority) {
        this.sendPriority = sendPriority;
    }

    public Double getSendCount() {
        return sendCount;
    }

    public void setSendCount(Double sendCount) {
        this.sendCount = sendCount;
    }

    public String getSendStatus() {
        return sendStatus;
    }

    public void setSendStatus(String sendStatus) {
        this.sendStatus = sendStatus == null ? null : sendStatus.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Double getVersion() {
        return version;
    }

    public void setVersion(Double version) {
        this.version = version;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy == null ? null : updateBy.trim();
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }
}