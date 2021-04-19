package com.mrkdiplom.cybermind.web.controller;

import com.mrkdiplom.cybermind.core.entity.User;
import com.mrkdiplom.cybermind.core.facade.converter.UserProfileConverter;
import com.mrkdiplom.cybermind.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.CurrentSecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/profile")
public class ProfilePageController {

    @Autowired
    private UserProfileConverter userProfileConverter;

    @Autowired
    private UserService userService;

    @GetMapping
    public String profile(@CurrentSecurityContext(expression="authentication.name") String username,
                          Model model) {
        model.addAttribute("name", username);
        User user = userService.getUserByUsername(username);
        model.addAttribute("userProfile", userProfileConverter.convert(user));
        return "profile";
    }
}
