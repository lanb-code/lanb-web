package com.colodoo.framework.manager.user.action;

import com.colodoo.framework.common.Msg;
import com.colodoo.framework.common.SessionObject;
import com.colodoo.framework.manager.user.model.User;
import com.colodoo.framework.manager.user.service.UserService;
import com.colodoo.framework.easyui.Page;
import com.colodoo.framework.utils.Contants;
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
    public Msg loginCheck(User model, HttpSession session) {
        Msg msg = new Msg();
        SessionObject sessionObject = (SessionObject)session.getAttribute("sessionObject");
        //已经登录
        if (sessionObject != null) {
            msg.setSuccess(true);
            model.setPassword(null);
            model.setUserName(sessionObject.getUser().getUserName());
            msg.setData(model);
            msg.setMsg(Contants.LOGINED);
        } else {
            //登录成功
            msg = userService.loginCheck(model);
            if (msg.isSuccess()) {
                Subject subject = SecurityUtils.getSubject();
                UsernamePasswordToken token = new UsernamePasswordToken(model.getUserName(), model.getPassword());
                subject.login(token);
                msg.setMsg(Contants.LOGIN_SUCCESS);
                model.setPassword(null);
                msg.setData(model);
            } else {//登录失败
                msg.setSuccess(false);
                msg.setMsg(Contants.LOGIN_FAIL);
            }
        }
        return msg;
    }

    @RequestMapping(value = "/logout")
    @ResponseBody
    public Msg logout(HttpSession session) {
        Msg msg = new Msg();
        if(session.getAttribute("sessionObject") != null) {
            session.removeAttribute("sessionObject");
            msg.setSuccess(true);
            msg.setMsg("注销成功!");
        } else {
            msg.setSuccess(false);
            msg.setMsg("注销失败!");
        }
        return msg;
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
