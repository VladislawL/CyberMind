package com.mrkdiplom.cybermind.web.controller;

import com.mrkdiplom.cybermind.core.service.UserService;
import com.mrkdiplom.cybermind.web.siteconfig.SiteConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/leaderboard")
public class LeaderBoardController {

    @Autowired
    private UserService userService;

    @Autowired
    private SiteConfig siteConfig;

    @GetMapping
    public String leaderBoard(Model model) {
        model.addAttribute("users", userService.getTopNUsers(siteConfig.getTop()));
        return "leaderboard";
    }

}
