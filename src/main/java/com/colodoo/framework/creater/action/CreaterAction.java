package com.colodoo.framework.creater.action;

import com.colodoo.framework.creater.model.*;
import com.colodoo.framework.creater.service.CreaterService;
import freemarker.template.TemplateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping(value = "/creater")
public class CreaterAction {

    @Autowired
    CreaterService createrService;

    @RequestMapping(value = {"/", ""})
    public String creater() {
        return "creater/creater";
    }

    /**
     * 生成查询语句
     *
     * @param tableName
     * @return
     */
    @RequestMapping(value = "/getSelectQuery")
    @ResponseBody
    public String getSelectQuery(String tableName) {
        return createrService.getSelectQuery(tableName);
    }

    /**
     * 生成模板查询语句
     *
     * @param tableName
     * @return
     */
    @RequestMapping(value = "/getSelectQueryByTemplate")
    @ResponseBody
    public String getSelectQueryByTemplate(String tableName) {
        try {
            return createrService.getSelectQueryByTemplate(tableName);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }
        return "";
    }

    @RequestMapping(value = "/createAllString")
    @ResponseBody
    public Map createAllString(BaseParm allParm) {
        Map rspMap = new HashMap();
        try {
            String mybatisStr = createrService.createMybatisString(allParm);
            String serviceStr = createrService.createServiceString(allParm);
            String actionStr = createrService.createActionString(allParm);
            rspMap.put("mybatis", mybatisStr);
            rspMap.put("service", serviceStr);
            rspMap.put("action", actionStr);
            rspMap.put("msg", "创建成功!");
        } catch (Exception e) {
            e.printStackTrace();
            rspMap.put("msg", "创建失败!");
        }
        return rspMap;
    }

    @RequestMapping(value = "/createModelString")
    @ResponseBody
    public String createModelString(String tableName) {
        String resultStr = "";
        try {
            resultStr = createrService.createModelString(tableName);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }
        return resultStr;
    }

    @RequestMapping(value = "/createDatagridString")
    @ResponseBody
    public Map createDatagridString(DatagridParm datagridParm) {
        Map rspMap = new HashMap();
        try {
            String result = createrService.createDatagridString(datagridParm);
            rspMap.put("result", result);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }
        return rspMap;
    }

    @RequestMapping(value = "/createMybatisString")
    @ResponseBody
    public Map createMybatisString(BaseParm mybatisParm) {
        Map rspMap = new HashMap();
        String result = createrService.createMybatisString(mybatisParm);
        rspMap.put("result", result);
        return rspMap;
    }

    @RequestMapping(value = "/createActionString")
    @ResponseBody
    public Map createActionString(BaseParm actionParm) {
        Map rspMap = new HashMap();
        try {
            String result = createrService.createActionString(actionParm);
            rspMap.put("result", result);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }
        return rspMap;
    }

    @RequestMapping(value = "/createServiceString")
    @ResponseBody
    public Map createServiceString(BaseParm serviceParm) {
        Map rspMap = new HashMap();
        try {
            String result = createrService.createServiceString(serviceParm);
            rspMap.put("result", result);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (TemplateException e) {
            e.printStackTrace();
        }
        return rspMap;
    }


}
