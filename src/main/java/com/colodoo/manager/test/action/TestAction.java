package com.colodoo.manager.test.action;

import com.colodoo.manager.test.model.Test;
import com.colodoo.manager.test.service.TestService;
import com.colodoo.framework.easyui.Page;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

/**
* @Author: colodoo
* @Date: 2018-8-11 15:08:12
* @Description:
*/
@Controller
@RequestMapping(value = "/test")
@CrossOrigin
public class TestAction {

    @Autowired
    TestService testService;

    @RequestMapping(value = "/testManager")
    public String testManager() {
        return "manager/test/testManager";
    }

    @RequestMapping(value = "/save")
    @ResponseBody
    public Map save(Test model) {
        Map rspMap = new HashMap();
        int ret = testService.saveTest(model);
        if(ret > 0) {
            rspMap.put("success", true);
        } else {
            rspMap.put("msg", "保存失败");
        }
        return rspMap;
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public Map delete(Test model) {
        Map rspMap = new HashMap();
        int ret = testService.deleteTest(model);
        if(ret > 0) {
            rspMap.put("success", true);
        } else {
            rspMap.put("msg", "删除失败");
        }
        return rspMap;
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public Map update(Test model) {
        Map rspMap = new HashMap();
        int ret = testService.updateTest(model);
        if(ret > 0) {
            rspMap.put("success", true);
        } else {
            rspMap.put("msg", "更新失败");
        }
        return rspMap;
    }

    @RequestMapping(value = "/queryById")
    @ResponseBody
    public Map queryById(Test model) {
        Map rspMap = new HashMap();
        rspMap.put("rows", testService.queryById(model));
        return rspMap;
    }

    @RequestMapping(value = "/query")
    @ResponseBody
    public List<Test> query() {
        return testService.query();
    }

    @RequestMapping(value = "/queryPage")
    @ResponseBody
    public Map query(Page page) {
        Map rspMap = new HashMap();
        PageInfo info = testService.query(page);
        rspMap.put("rows", info.getList());
        rspMap.put("total", info.getTotal());
        return rspMap;
    }
}
