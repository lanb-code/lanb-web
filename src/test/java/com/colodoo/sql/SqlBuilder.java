package com.colodoo.sql;

import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.jdbc.SQL;

/**
 * @Author: colodoo
 * @Date: 2018/8/12 3:08
 * @Description:
 */
@Slf4j
public class SqlBuilder {

    public static void main(String[] args) {
        log.info(new SQL().SELECT("test_id").FROM("test").toString());
    }
}
