package com.mrkdiplom.cybermind.web.controller;

import com.mrkdiplom.cybermind.core.facade.dto.UserRegistrationDTO;
import com.mrkdiplom.cybermind.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping(value = "/registration")
public class RegistrationController {

    @Autowired
    private UserService userService;

    @GetMapping
    public String registration(Model model) {
        model.addAttribute("user", new UserRegistrationDTO());
        return "registration";
    }

    @PostMapping
    public String registration(Model model, @Valid UserRegistrationDTO userRegistrationDTO, Errors errors) {
        if (!errors.hasErrors()) {
            userService.register(userRegistrationDTO);
            return "redirect:login";
        }
        model.addAttribute("user", userRegistrationDTO);
        return "registration";
    }

}
