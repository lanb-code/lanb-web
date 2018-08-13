package com.colodoo.framework.manager.system.service;

import com.colodoo.framework.manager.system.model.System;
import com.colodoo.framework.manager.system.model.SystemExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SystemMapper {
    long countByExample(SystemExample example);

    int deleteByExample(SystemExample example);

    int deleteByPrimaryKey(String systemId);

    int insert(System record);

    int insertSelective(System record);

    List<System> selectByExample(SystemExample example);

    System selectByPrimaryKey(String systemId);

    int updateByExampleSelective(@Param("record") System record, @Param("example") SystemExample example);

    int updateByExample(@Param("record") System record, @Param("example") SystemExample example);

    int updateByPrimaryKeySelective(System record);

    int updateByPrimaryKey(System record);
}