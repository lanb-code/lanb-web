package com.colodoo.scaner;

import com.colodoo.Application;
import com.colodoo.framework.easyui.Page;
import com.colodoo.framework.exception.DAOException;
import com.colodoo.framework.manager.codeInfo.model.CodeInfo;
import com.colodoo.framework.manager.codeInfo.service.CodeInfoService;
import com.colodoo.framework.utils.SpringContextsUtil;
import com.colodoo.framework.utils.StringUtil;
import com.colodoo.manager.test.model.TestExample;
import com.colodoo.manager.test.service.TestService;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Mapper;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MockMvcBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Random;


@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = Application.class)
//@SpringBootTest(classes = Application.class, webEnvironment = SpringBootTest.WebEnvironment.NONE)
@Slf4j
public class ApplicationTest {

    @Autowired
    TestService testService;

    @Test
    @Rollback
    public void testInsert() {
        com.colodoo.manager.test.model.Test test = new com.colodoo.manager.test.model.Test();
        test.setTestName("测试" + new Random().nextInt());
        test.setCreateTime(new Timestamp(new Date().getTime()));
        testService.saveTest(test);
    }

    @Test
    @Rollback
    public void testDelete() {
        try {
            testService.delete("415c6d3bdcd342dfa07c6a1c14ac8e7c");
        } catch (DAOException e) {
            e.printStackTrace();
        }
    }

    @Test
    @Rollback
    public void testUpdate() {
        com.colodoo.manager.test.model.Test model = new com.colodoo.manager.test.model.Test();
        model.setTestId("63aa489558074390acfd2681e5928643");
        model.setCreateTime(new Timestamp(new Date().getTime()));
        model.setTestName("2");
        testService.updateTest(model);
    }

    @Test
    @Rollback
    public void testFind() {
        //log.info(testService.find().toString());
        Page page = new Page();
        page.setPage(2);
        page.setRows(10);
        assert testService.query(page) != null;
        log.info(testService.query(page).toString());
    }

    @Test
    public void testExample() {
        TestExample example = new TestExample();
        assert example.createCriteria().getClass().getTypeName() != null;
    }

    @Autowired
    private WebApplicationContext wac;
    private MockMvc mvc;
    private MockHttpSession session;

    @Before
    public void setupMockMvc() {
        mvc = MockMvcBuilders.webAppContextSetup(wac).build();
    }

    @Test
    public void getBeans() {
        for(String beanName : SpringContextsUtil.getApplicationContext().getBeanDefinitionNames()) {
            System.out.println(beanName);
        }
    }

}
