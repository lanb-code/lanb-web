package com.colodoo.framework.manager.user.action;

import com.colodoo.framework.manager.user.model.User;
import com.colodoo.framework.manager.user.service.UserService;
import com.colodoo.framework.easyui.Page;
import com.github.pagehelper.PageInfo;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

@Controller
@RequestMapping(value = "/user")
public class UserAction {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/login")
    public String login() {
        return "manager/login";
    }

    @RequestMapping(value = "/userManager")
    public String userManager() {
        return "manager/user/userManager";
    }

    @RequestMapping(value = "/loginCheck")
    @ResponseBody
    public Map loginCheck(User model, HttpSession session) {
        Map map = new HashMap();
        Object userName = session.getAttribute("userName");
        //已经登录
        if (userName != null) {
            map.put("success", true);
            model.setPassword(null);
            model.setUserName(userName.toString());
            map.put("user", model);
            map.put("msg", "您已经登录!");
        } else {
            //登录成功
            if (userService.loginCheck(model)) {
                Subject subject = SecurityUtils.getSubject();
                UsernamePasswordToken token = new UsernamePasswordToken(model.getUserName(), model.getPassword());
                subject.login(token);
                map.put("success", true);
                map.put("msg", "登录成功!");
                model.setPassword(null);
                map.put("user", model);
                session.setAttribute("userName", model.getUserName());
            } else {//登录失败
                map.put("success", false);
                map.put("msg", "登录失败!");
            }
        }
        return map;
    }

    @RequestMapping(value = "/register")
    @ResponseBody
    public Map register(User model) {
        Map map = new HashMap();
        boolean isSuccessed = userService.register(model);
        if (isSuccessed) {
            map.put("success", true);
            map.put("msg", "注册成功!");
        } else {
            map.put("success", false);
            map.put("msg", "注册失败!");
        }
        return map;
    }

    @RequestMapping(value = "/save")
    @ResponseBody
    public Map save(User model) {
        Map rspMap = new HashMap();
        int ret = userService.save(model);
        if (ret > 0) {
            rspMap.put("success", true);
        } else {
            rspMap.put("errorMsg", "保存失败");
        }
        return rspMap;
    }

    @RequestMapping(value = "/delete")
    @ResponseBody
    public Map delete(User model) {
        Map rspMap = new HashMap();
        int ret = userService.delete(model);
        if (ret > 0) {
            rspMap.put("success", true);
        } else {
            rspMap.put("errorMsg", "删除失败");
        }
        return rspMap;
    }

    @RequestMapping(value = "/update")
    @ResponseBody
    public Map update(User model) {
        Map rspMap = new HashMap();
        int ret = userService.update(model);
        if (ret > 0) {
            rspMap.put("success", true);
        } else {
            rspMap.put("errorMsg", "更新失败");
        }
        return rspMap;
    }

    @RequestMapping(value = "/queryById")
    @ResponseBody
    public Map queryById(User model) {
        Map rspMap = new HashMap();
        rspMap.put("rows", userService.queryById(model));
        return rspMap;
    }

    @RequestMapping(value = "/query")
    @ResponseBody
    public List<User> query() {
        return userService.query();
    }

    @RequestMapping(value = "/queryPage")
    @ResponseBody
    public Map query(Page page) {
        Map rspMap = new HashMap();
        PageInfo info = userService.query(page);
        rspMap.put("rows", info.getList());
        rspMap.put("total", info.getTotal());
        return rspMap;
    }
}
