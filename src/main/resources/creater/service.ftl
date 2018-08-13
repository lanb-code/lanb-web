package ${packageName}.service;

import com.colodoo.framework.base.abs.BaseService;
import com.colodoo.framework.exception.DAOException;
import com.colodoo.framework.utils.Contants;
import ${packageName}.model.${tableName?cap_first};
import com.colodoo.framework.easyui.Page;
import ${packageName}.model.${tableName?cap_first}Example;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* @author: colodoo
* @Date: ${.now?date} ${.now?time}
* @description:
*/
@Service
@Slf4j
public class ${tableName?cap_first}Service extends BaseService<${tableName?cap_first}> {

    /**
    * 新增数据
    *
    * @param model
    * @return
    */
    public int save${tableName?cap_first}(${tableName?cap_first} model) {
        int ret = Contants.CODE_FAILED;
        model.set${tableName?cap_first}Id(uuid());
        // model.setCreateDate(new Date());
        // model.setLastDate(new Date());
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
    public int delete${tableName?cap_first}(${tableName?cap_first} model) {
        int ret = Contants.CODE_FAILED;
        try {
            ret = this.delete(model.get${tableName?cap_first}Id());
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
    public int update${tableName?cap_first}(${tableName?cap_first} model) {
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
    public ${tableName?cap_first} queryById(${tableName?cap_first} model) {
        ${tableName?cap_first} ${tableName} = null;
        try {
            ${tableName} = this.get(model.get${tableName?cap_first}Id());
        } catch (DAOException e) {
            log.error(e.getMsg());
        }
        return ${tableName};
    }

    /**
    * 查找列表
    *
    * @return
    */
    public List<${tableName?cap_first}> query() {
        List<${tableName?cap_first}> list = null;
        ${tableName?cap_first}Example example = new ${tableName?cap_first}Example();
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
        List<${tableName?cap_first}> list = null;
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
