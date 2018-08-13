package com.colodoo.framework.manager.system.action;

import com.colodoo.framework.manager.system.model.System;
import com.colodoo.framework.manager.system.service.SystemService;
import com.colodoo.framework.easyui.Page;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

@Controller
@RequestMapping(value = "/system")
public class SystemAction {

    @Autowired
    SystemService systemService;

    @RequestMapping(value = "/systemManager")
    public String systemManager() {
        return "manager/system/systemManager";
    }

    @RequestMapping(value = "/save")
    @ResponseBody
    public Map save(System model) {
        Map rspMap = new HashMap();
        int ret = systemService.save(model);
        if(ret > 0) {
            rspMap.put("success", true);
        } else {
            rspMap.put("msg", "保存失败");
        }
        return rspMap;
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public Map delete(System model) {
        Map rspMap = new HashMap();
        int ret = systemService.delete(model);
        if(ret > 0) {
            rspMap.put("success", true);
        } else {
            rspMap.put("msg", "删除失败");
        }
        return rspMap;
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public Map update(System model) {
        Map rspMap = new HashMap();
        int ret = systemService.update(model);
        if(ret > 0) {
            rspMap.put("success", true);
        } else {
            rspMap.put("msg", "更新失败");
        }
        return rspMap;
    }

    @RequestMapping(value = "/queryById")
    @ResponseBody
    public Map queryById(System model) {
        Map rspMap = new HashMap();
        rspMap.put("rows", systemService.queryById(model));
        return rspMap;
    }

    @RequestMapping(value = "/query")
    @ResponseBody
    public List<System> query() {
        return systemService.query();
    }

    @RequestMapping(value = "/queryPage")
    @ResponseBody
    public Map query(Page page) {
        Map rspMap = new HashMap();
        PageInfo info = systemService.query(page);
        rspMap.put("rows", info.getList());
        rspMap.put("total", info.getTotal());
        return rspMap;
    }
}
