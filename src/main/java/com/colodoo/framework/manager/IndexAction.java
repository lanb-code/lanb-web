package com.colodoo.framework.manager;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = {"/", ""})
public class IndexAction {

    @GetMapping
    public String mainView() {
        return "manager/index";
    }

}
