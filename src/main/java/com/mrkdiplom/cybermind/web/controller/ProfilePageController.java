package com.mrkdiplom.cybermind.web.controller;

import com.mrkdiplom.cybermind.core.entity.User;
import com.mrkdiplom.cybermind.core.facade.converter.UserProfileConverter;
import com.mrkdiplom.cybermind.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/profile")
public class ProfilePageController {

    @Autowired
    private UserProfileConverter userProfileConverter;

    @Autowired
    private UserService userService;

    @GetMapping
    public String profile() {
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        return "redirect:/profile/" + userDetails.getUsername() + "/all";
    }

    @GetMapping(value = "/{username}")
    public String profile(@PathVariable("username") String username) {
        return "redirect:/profile/" + username + "/all";
    }

    @GetMapping(value = "/{username}/{listType}")
    public String profile(@PathVariable("username") String username,
                          @PathVariable("listType") String listType,
                          Model model) {
        model.addAttribute("name", username);
        User user = userService.getUserByUsername(username);
        model.addAttribute("userProfile", userProfileConverter.convert(user));
        model.addAttribute("listType", listType);
        return "profile";
    }
}
