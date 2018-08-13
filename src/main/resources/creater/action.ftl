package ${packageName}.action;

import ${packageName}.model.${tableName?cap_first};
import ${packageName}.service.${tableName?cap_first}Service;
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
* @author: colodoo
* @Date: ${.now?date} ${.now?time}
* @description:
*/
@Controller
@RequestMapping(value = "/${tableName}")
@CrossOrigin
public class ${tableName?cap_first}Action {

    @Autowired
    ${tableName?cap_first}Service ${tableName}Service;

    @RequestMapping(value = "/${tableName}Manager")
    public String ${tableName}Manager() {
        return "manager/${tableName}/${tableName}Manager";
    }

    @RequestMapping(value = "/save")
    @ResponseBody
    public Map save(${tableName?cap_first} model) {
        Map rspMap = new HashMap();
        int ret = ${tableName}Service.save${tableName?cap_first}(model);
        if(ret > 0) {
            rspMap.put("success", true);
        } else {
            rspMap.put("msg", "保存失败");
        }
        return rspMap;
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public Map delete(${tableName?cap_first} model) {
        Map rspMap = new HashMap();
        int ret = ${tableName}Service.delete${tableName?cap_first}(model);
        if(ret > 0) {
            rspMap.put("success", true);
        } else {
            rspMap.put("msg", "删除失败");
        }
        return rspMap;
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public Map update(${tableName?cap_first} model) {
        Map rspMap = new HashMap();
        int ret = ${tableName}Service.update${tableName?cap_first}(model);
        if(ret > 0) {
            rspMap.put("success", true);
        } else {
            rspMap.put("msg", "更新失败");
        }
        return rspMap;
    }

    @RequestMapping(value = "/queryById")
    @ResponseBody
    public Map queryById(${tableName?cap_first} model) {
        Map rspMap = new HashMap();
        rspMap.put("rows", ${tableName}Service.queryById(model));
        return rspMap;
    }

    @RequestMapping(value = "/query")
    @ResponseBody
    public List<${tableName?cap_first}> query() {
        return ${tableName}Service.query();
    }

    @RequestMapping(value = "/queryPage")
    @ResponseBody
    public Map query(Page page) {
        Map rspMap = new HashMap();
        PageInfo info = ${tableName}Service.query(page);
        rspMap.put("rows", info.getList());
        rspMap.put("total", info.getTotal());
        return rspMap;
    }
}
