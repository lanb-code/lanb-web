package com.colodoo.framework.manager.sys;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/sys")
public class SysAction {

    @RequestMapping(value = "/menuSetting")
    public String menuSetting() {
        return "manager/sys/menuSetting";
    }

}
