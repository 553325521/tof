package com.os.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.os.pojo.O_User;


public class CheckLoginStatus {
    private HttpServletRequest mRequest;

    public CheckLoginStatus(HttpServletRequest request) {
        mRequest = request;
    }

    public boolean isLogin() {
        HttpSession session = mRequest.getSession();
        if (session.getAttribute("SESSION_USER") != null) {
            return true;
        } else {
            return false;
        }
    }

    public void removeSession() {
        HttpSession session = mRequest.getSession();
        session.removeAttribute("SESSION_USER");
    }

    public O_User getUsers() {
        HttpSession session = mRequest.getSession();
        if (session != null) {
            if (session.getAttribute("SESSION_USER") != null) {
                return (O_User) session.getAttribute("SESSION_USER");
            } else {
                return null;
            }
        } else {
            return null;
        }
    }

    public void putUsers(O_User users) {
        HttpSession session = mRequest.getSession();
        if (session != null) {
            session.setAttribute("SESSION_USER", users);
        }
    }
}
