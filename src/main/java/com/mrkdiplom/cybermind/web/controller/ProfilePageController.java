package com.mrkdiplom.cybermind.web.controller;

import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/profile")
public class ProfilePageController {

    @GetMapping
    public String profile(@CurrentSecurityContext(expression="authentication.name") String username,
                          Model model) {
        model.addAttribute("name", username);
        return "profile";
    }
}
