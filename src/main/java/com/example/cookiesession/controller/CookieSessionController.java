package com.example.cookiesession.controller;

import lombok.extern.slf4j.Slf4j;
import org.apache.catalina.startup.UserConfig;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@Slf4j
public class CookieSessionController {

    @GetMapping("/")
    public String mainPage(HttpSession httpSession, Model model){
        Object userId = httpSession.getAttribute("SESS_USER_ID");
        model.addAttribute("userId", userId);
        return "/main";
    }

    @PostMapping("/login")
    public void postLogin(HttpServletRequest request,
                          HttpServletResponse response,
                          HttpSession httpSession
    ){
        Cookie userIdCookie = new Cookie("userId",request.getParameter("userId"));
        response.addCookie(userIdCookie);

        httpSession.setAttribute("SESS_USER_ID",request.getParameter("userId"));
    }
}
