package com.colodoo.framework.common;

import com.colodoo.framework.manager.role.model.Role;
import com.colodoo.framework.manager.user.model.User;

/**
 * @author colodoo
 * @date 2018/10/18 15:55
 * @description
 */
public class SessionObject {
    private User user;
    private Role role;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }
}
