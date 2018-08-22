package com.colodoo.framework.exception;

/**
 * @author colodoo
 * @date 2018/8/11 23:46
 * @description
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
