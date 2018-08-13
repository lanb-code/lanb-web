package com.colodoo.framework.exception;

/**
 * @Author: colodoo
 * @Date: 2018/8/11 23:46
 * @Description:
 */
public class DAOException extends Exception {

    private String msg;

    public DAOException(String msg) {
        this.msg = msg;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}
