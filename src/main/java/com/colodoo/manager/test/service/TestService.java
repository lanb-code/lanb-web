package com.colodoo.manager.test.service;

import com.colodoo.framework.base.abs.BaseService;
import com.colodoo.framework.exception.DAOException;
import com.colodoo.framework.utils.Contants;
import com.colodoo.manager.test.model.Test;
import com.colodoo.framework.easyui.Page;
import com.colodoo.manager.test.model.TestExample;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author colodoo
 * @date 2018-8-11 15:08:12
 * @description
 */
@Service
@Slf4j
public class TestService extends BaseService<Test> {

    /**
     * 新增数据
     *
     * @param model
     * @return
     */
    public int saveTest(Test model) {
        int ret = Contants.CODE_FAILED;
        model.setTestId(uuid());
        try {
            ret = this.insert(model);
        } catch (DAOException e) {
            log.error(e.getMsg());
        }
        return ret;
    }

    /**
     * 删除数据
     *
     * @param model
     * @return
     */
    public int deleteTest(Test model) {
        int ret = Contants.CODE_FAILED;
        try {
            ret = this.delete(model.getTestId());
        } catch (DAOException e) {
            log.error(e.getMsg());
        }
        return ret;
    }

    /**
     * 更新数据
     *
     * @param model
     * @return
     */
    public int updateTest(Test model) {
        int ret = Contants.CODE_FAILED;
        try {
            ret = this.update(model);
        } catch (DAOException e) {
            log.error(e.getMsg());
        }
        return ret;
    }

    /**
     * 根据id查找单条数据
     *
     * @param model
     * @return
     */
    public Test queryById(Test model) {
        Test test = null;
        try {
            test = this.get(model.getTestId());
        } catch (DAOException e) {
            log.error(e.getMsg());
        }
        return test;
    }

    /**
     * 查找列表
     *
     * @return
     */
    public List<Test> query() {
        List<Test> list = null;
        TestExample example = new TestExample();
        try {
            list = this.find(example);
        } catch (DAOException e) {
            log.error(e.getMsg());
        }
        return list;
    }

    /**
     * 查找分页列表
     *
     * @param page
     * @return
     */
    public PageInfo query(Page page) {
        PageInfo pageInfo;
        List<Test> list = null;
        PageHelper.startPage(page.getPage(), page.getRows());
        try {
            list = this.find();
        } catch (DAOException e) {
            log.error(e.getMsg());
        }
        pageInfo = new PageInfo(list);
        return pageInfo;
    }
}
