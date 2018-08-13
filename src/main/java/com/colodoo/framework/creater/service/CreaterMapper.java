package com.colodoo.framework.creater.service;

import com.colodoo.framework.creater.model.Column;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface CreaterMapper {

    @Select("SELECT\n" +
            "\tcolumn_name as columnName,\n" +
            "\tcolumn_type as columnType,\n" +
            "\tis_nullable as isNullable,\n" +
            "\tcolumn_key as columnKey,\n" +
            "\tcolumn_comment as columnComment\n" +
            "FROM\n" +
            "\tinformation_schema.COLUMNS " +
            "WHERE\n" +
            "\ttable_name = #{tableName} " +
            "and ")
    public List<Column> getColumns(@Param("tableName") String tableName);

}
