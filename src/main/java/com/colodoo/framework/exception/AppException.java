package com.colodoo.framework.exception;

/**
 * @Author: colodoo
 * @Date: 2018/8/10 22:56
 * @Description:
 */
public class AppException extends Exception {

    private String msg;

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public AppException(String msg) {
        this.msg = msg;
    }
}
