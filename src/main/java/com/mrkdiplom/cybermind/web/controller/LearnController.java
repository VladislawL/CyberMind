package com.mrkdiplom.cybermind.web.controller;

import com.mrkdiplom.cybermind.core.entity.Chapter;
import com.mrkdiplom.cybermind.core.service.LearnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping(value = "/learn")
public class LearnController {

    @Autowired
    private LearnService learnService;

    @GetMapping
    private String learnList(Model model) {
        model.addAttribute("learnList", learnService.getAll());
        return "learns";
    }

    @GetMapping(value = "/{id}")
    private String learnPage(@PathVariable("id") Long id) {
        StringBuilder redirectUrl = new StringBuilder("/learn/");

        Chapter chapter = learnService.getFirstChapterForLearn(id);

        redirectUrl.append(id)
                .append("/chapter/")
                .append(chapter.getId());

        return "redirect:" + redirectUrl;
    }

    @GetMapping(value = "/{id}/chapter/{chapterId}")
    private String chapterPage(
            @PathVariable("id") Long id,
            @PathVariable("chapterId") Long chapterId,
            Model model) {
        List<Chapter> chapters = learnService.getChaptersForLearn(id);
        Chapter chapter = learnService.getChapterForLearnById(id, chapterId);

        model.addAttribute("chapters", chapters);
        model.addAttribute("chapter", chapter);
        model.addAttribute("learnId", id);
        model.addAttribute("learn",learnService.getLearnById(id));

        return "learnPage";
    }

}
