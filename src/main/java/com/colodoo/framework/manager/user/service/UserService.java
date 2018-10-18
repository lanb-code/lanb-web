package com.colodoo.framework.manager.user.service;

import com.colodoo.framework.info.Msg;
import com.colodoo.framework.manager.user.model.User;
import com.colodoo.framework.utils.Contants;
import com.colodoo.framework.utils.StringUtil;
import com.colodoo.framework.easyui.Page;
import com.colodoo.framework.manager.user.model.UserExample;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class UserService {

    @Autowired
    UserMapper userMapper;

    public int save(User model) {
        model.setUserId(StringUtil.uuid());
        model.setCreateDate(new Date());
        model.setLastDate(new Date());
        return userMapper.insert(model);
    }

    public int delete(User model) {
        return userMapper.deleteByPrimaryKey(model.getUserId());
    }

    public int update(User model) {
        return userMapper.updateByPrimaryKey(model);
    }

    public User queryById(User model) {
        return userMapper.selectByPrimaryKey(model.getUserId());
    }

    public List<User> query() {
        return userMapper.selectByExample(null);
    }

    public PageInfo query(Page page) {
        PageHelper.startPage(page.getPage(), page.getRows());
        return new PageInfo(userMapper.selectByExample(null));
    }

    public Msg loginCheck(User model) {
        Msg msg = new Msg();
        //是否存在空参数
        if (model.getUserName() == null
                || "".equals(model.getUserName())
                || model.getPassword() == null
                || "".equals(model.getPassword())) {
            msg.setSuccess(false);
            return msg;
        }
        UserExample example = new UserExample();
        example.createCriteria()
                .andUserNameEqualTo(model.getUserName())
                .andPasswordEqualTo(model.getPassword())
                .andEnableEqualTo(Contants.TRUE);
        List<User> users = userMapper.selectByExample(example);
        if (users.size() == 1) {
            msg.setSuccess(true);
            return msg;
        } else {
            failLogin(model);
            msg.setSuccess(false);
            return msg;
        }
    }

    public void failLogin(User model) {
        UserExample example = new UserExample();
        example.createCriteria().andUserNameEqualTo(model.getUserName());
        //防止出现没有数据的问题,重新查实体类
        List<User> users = userMapper.selectByExample(example);
        if (users.size() == 1) {
            model = users.get(0);
            //如果已经锁号,直接停止所有操作
            if (model.getEnable().equals(Contants.FALSE)) {
                return;
            }
            //如果超出限制次数,则锁号
            if (model.getTryCount() >= Contants.MAX_LOGIN_TRY_COUNT) {
                model.setEnable(Contants.FALSE);
                model.setTryCount(0);
                userMapper.updateByPrimaryKeySelective(model);
            } else {//登录失败次数+1
                model.setTryCount(model.getTryCount() + 1);
                userMapper.updateByPrimaryKeySelective(model);
            }
        }
    }

    public boolean register(User model) {
        //先判断信息的完整性
        if (model.getUserName() == null
                || "".equals(model.getUserName())
                || model.getPassword() == null
                || "".equals(model.getPassword())) {
            return false;
        }
        //防止恶意注册,进行数据的二次验证
        //再进行操作
        model.setEnable(Contants.TRUE);
        model.setTryCount(0);
        if (save(model) > 0) {
            return true;
        }
        return false;
    }
}
