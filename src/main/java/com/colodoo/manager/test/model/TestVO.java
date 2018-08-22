package com.colodoo.manager.test.model;

import java.io.Serializable;
import java.util.Date;

/**
 * @author colodoo
 * @date 2018/8/12 0:11
 * @description 
 */
public class TestVO extends Test implements Serializable {

    private Date dateFrom;
    private Date dateTo;

    public Date getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(Date dateFrom) {
        this.dateFrom = dateFrom;
    }

    public Date getDateTo() {
        return dateTo;
    }

    public void setDateTo(Date dateTo) {
        this.dateTo = dateTo;
    }
}
