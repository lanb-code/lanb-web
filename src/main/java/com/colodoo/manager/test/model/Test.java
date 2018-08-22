package com.colodoo.manager.test.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.sql.Timestamp;
import java.util.Date;

public class Test {
    private String testId;
    private String testName;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Timestamp createTime;

    public String getTestId() {
        return testId;
    }

    public void setTestId(String testId) {
        this.testId = testId == null ? null : testId.trim();
    }

    public String getTestName() {
        return testName;
    }

    public void setTestName(String testName) {
        this.testName = testName == null ? null : testName.trim();
    }

    public Timestamp getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Timestamp createTime) {
        this.createTime = createTime;
    }
}