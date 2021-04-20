package com.mrkdiplom.cybermind.web.controller;

import com.mrkdiplom.cybermind.core.entity.Chapter;
import com.mrkdiplom.cybermind.core.entity.Learn;
import com.mrkdiplom.cybermind.core.facade.converter.CreateTaskDTOConverter;
import com.mrkdiplom.cybermind.core.facade.dto.CreateTaskDTO;
import com.mrkdiplom.cybermind.core.service.LearnService;
import com.mrkdiplom.cybermind.core.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    private TaskService taskService;

    @Autowired
    private LearnService learnService;

    @Autowired
    private CreateTaskDTOConverter createTaskDTOConverter;

    @GetMapping
    public String admin() {
        return "admin";
    }

    @GetMapping(value = "/createTask")
    public String createTaskPage() {
        return "createTask";
    }

    @PostMapping(value = "/createTask")
    public String createTask(@ModelAttribute CreateTaskDTO createTaskDTO, Model model) throws IOException {
        taskService.saveTask(createTaskDTOConverter.convert(createTaskDTO), createTaskDTO.getSolution(), createTaskDTO.getTest());
        return "redirect:/admin/createTask";
    }

    @GetMapping(value = "/updateTask/{id}")
    public String updateTask(@PathVariable("id") Long id) {
        return "";
    }

    @GetMapping(value = "/learn")
    public String createLearnPage() {
        Learn learn = learnService.saveLearn(new Learn(""));
        return "redirect:/admin/learn/" + learn.getId();
    }

    @GetMapping(value = "/learn/{id}")
    public String createLearnPage(@PathVariable("id") Long id) {
        Learn learn = learnService.getLearnById(id);
        List<Chapter> chapters = learnService.getChaptersForLearn(id);
        StringBuilder redirectUrl = new StringBuilder("/admin/learn/")
                .append(id)
                .append("/chapter/");

        if (chapters.size() == 0) {
            Chapter chapter = learnService.saveChapter(createDefaultChapter(learn));
            redirectUrl.append(chapter.getId());
        } else {
            redirectUrl.append(chapters.get(0).getId());
        }

        return "redirect:" + redirectUrl;
    }

    @GetMapping(value = "/learn/{id}/chapter/{chapterId}")
    public String createLearnPage(@PathVariable("id") Long id, @PathVariable("chapterId") Long chapterId, Model model) {
        Learn learn = learnService.getLearnById(id);
        List<Chapter> chapters = learnService.getChaptersForLearn(id);
        Chapter chapter = learnService.getChapterForLearnById(id, chapterId);

        model.addAttribute("learn", learn);
        model.addAttribute("chapters", chapters);
        model.addAttribute("chapter", chapter);

        return "createLearn";
    }

    @PostMapping(value = "/learn/{id}/chapter/{chapterId}")
    public String saveLearn(
            @PathVariable("id") Long id,
            @PathVariable("chapterId") Long chapterId,
            @RequestParam("learnName") String learnName,
            @RequestParam("name") String name,
            @RequestParam("text") String text) {
        Learn learn = learnService.getLearnById(id);
        learn.setName(learnName);
        learnService.saveLearn(learn);
        Chapter chapter = new Chapter(name, text, learnService.getLearnById(id));
        chapter.setId(chapterId);
        learnService.saveChapter(chapter);
        return "redirect:/admin/learn/" + id + "/chapter/" + chapterId;
    }

    @GetMapping(value = "/learn/{id}/createNewChapter")
    public String createChapter(@PathVariable("id") Long id) {
        Learn learn = learnService.getLearnById(id);
        Chapter chapter = learnService.saveChapter(createEmptyChapter(learn));
        return "redirect:/admin/learn/{id}/chapter/" + chapter.getId();
    }

    private Chapter createDefaultChapter(Learn learn) {
        Chapter chapter = new Chapter();

        chapter.setName("Overview");
        chapter.setLearn(learn);
        chapter.setText("");

        return chapter;
    }

    private Chapter createEmptyChapter(Learn learn) {
        Chapter chapter = new Chapter();

        chapter.setName("");
        chapter.setLearn(learn);
        chapter.setText("");

        return chapter;
    }

}
