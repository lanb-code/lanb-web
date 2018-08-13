package com.colodoo.framework.startup;

import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;

@Component
public class InitializingBeanHandler implements InitializingBean {

//    @Autowired
//    RedisService redisService;
//    @Autowired
//    MenuService menuService;

    @Override
    public void afterPropertiesSet() throws Exception {
        //redisService.setObj("menuList", menuService.getSubMenuTreeGrid(""));
    }
}
