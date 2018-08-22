package com.colodoo.framework.manager.system.service;

import com.colodoo.framework.manager.system.model.System;
import com.colodoo.framework.utils.StringUtil;
import com.colodoo.framework.easyui.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
/**
 * @author colodoo
 * @date 2018/08/13
 */
public class SystemService {

    @Autowired
    SystemMapper systemMapper;

    public int save(System model) {
    model.setSystemId(StringUtil.uuid());
        return systemMapper.insert(model);
    }

    public int delete(System model) {
        return systemMapper.deleteByPrimaryKey(model.getSystemId());
    }

    public int update(System model) {
        return systemMapper.updateByPrimaryKey(model);
    }

    public System queryById(System model) {
        return systemMapper.selectByPrimaryKey(model.getSystemId());
    }

    public List<System> query() {
        return systemMapper.selectByExample(null);
    }

    public PageInfo query(Page page) {
        PageHelper.startPage(page.getPage(), page.getRows());
        return new PageInfo(systemMapper.selectByExample(null));
    }
}
