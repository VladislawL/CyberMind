package com.mrkdiplom.cybermind.web.controller;

import com.mrkdiplom.cybermind.core.entity.User;
import com.mrkdiplom.cybermind.core.facade.converter.UserProfileConverter;
import com.mrkdiplom.cybermind.core.facade.dto.UserProfileDTO;
import com.mrkdiplom.cybermind.core.service.UserService;
import com.mrkdiplom.cybermind.web.siteconfig.SiteConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "/leaderboard")
public class LeaderBoardController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserProfileConverter userProfileConverter;

    @Autowired
    private SiteConfig siteConfig;

    @GetMapping
    public String leaderBoard(Model model) {
        List<User> topUsers = userService.getTopNUsers((siteConfig.getTop()));
        model.addAttribute("users",  userProfileConverter.convert(topUsers));
        return "leaderboard";
    }

}
