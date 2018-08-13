package com.colodoo.framework.creater.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

@ConfigurationProperties(prefix = "creater")
@Component
public class CreaterCfg {

    //项目源代码地址
    private String srcPath;

    public String getSrcPath() {
        return srcPath;
    }

    public void setSrcPath(String srcPath) {
        this.srcPath = srcPath;
    }
}
