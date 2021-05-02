package com.mrkdiplom.cybermind.web.controller;

import com.mrkdiplom.cybermind.core.entity.Tag;
import com.mrkdiplom.cybermind.core.facade.TaskFacade;
import com.mrkdiplom.cybermind.core.facade.dto.TaskDTO;
import com.mrkdiplom.cybermind.core.service.TagService;
import com.mrkdiplom.cybermind.core.service.TaskService;
import com.mrkdiplom.cybermind.web.pagedata.PaginationData;
import com.mrkdiplom.cybermind.web.siteconfig.SiteConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Controller
@RequestMapping(value = "/tasks")
public class TaskListController {

    private TaskService taskService;
    private TaskFacade taskFacade;
    private SiteConfig siteConfig;
    private TagService tagService;

    @GetMapping
    public String tasksPage(
            @RequestParam(value = "query", defaultValue = "", required = false) String query,
            @RequestParam(value = "page", defaultValue = "0", required = false) Integer page,
            @RequestParam(value = "sortField", defaultValue = "", required = false) String sortField,
            @RequestParam(value = "sortOrder", defaultValue = "", required = false) String sortOrder,
            @RequestParam(value = "tags", required = false) List<Tag> tags,
            @RequestParam(value = "level", defaultValue = "", required = false) String level,
            Model model) {
        tags = populateTags(tags);

        PaginationData paginationData =
                createPaginationData(siteConfig.getPageSize(), page, siteConfig.getNumberOfPagesToShow(),
                        query, level, sortField, sortOrder, tags);

        List<TaskDTO> taskList = taskFacade.getTasks(query, level, tags, paginationData);

        model.addAttribute("tasks", taskList);
        model.addAttribute("paginationData", paginationData);
        model.addAttribute("allTags", tagService.getAllTags());
        model.addAttribute("appliedTags", tags);
        model.addAttribute("paramTags", tags == null ? "" : tags.stream()
                .map(Tag::getName)
                .collect(Collectors.joining(",")));
        model.addAttribute("currentLevel", level);

        return "tasks";
    }

    private PaginationData createPaginationData(int pageSize, int currentPage, int numberOfPagesToShow, String query,
                                                String level, String sortField, String sortOrder, List<Tag> tags) {
        PaginationData paginationData = new PaginationData();

        paginationData.setPageSize(pageSize);
        paginationData.setCurrentPage(currentPage);
        paginationData.setSortField(sortField);
        paginationData.setSortOrder(sortOrder);

        long numberOfTasks = taskService.getNumberOfTasks(query, level, tags);
        if (numberOfTasks % pageSize == 0) {
            paginationData.setNumberOfPages(numberOfTasks / pageSize);
        } else {
            paginationData.setNumberOfPages(numberOfTasks / pageSize + 1);
        }
        paginationData.setNumberOfPagesToShow(numberOfPagesToShow);

        return paginationData;
    }

    public List<Tag> populateTags(List<Tag> tags) {
        return Objects.requireNonNullElseGet(tags, ArrayList::new);
    }

    @Autowired
    public void setTaskService(TaskService taskService) {
        this.taskService = taskService;
    }

    @Autowired
    public void setSiteConfig(SiteConfig siteConfig) {
        this.siteConfig = siteConfig;
    }

    @Autowired
    public void setTaskFacade(TaskFacade taskFacade) {
        this.taskFacade = taskFacade;
    }

    @Autowired
    public void setTagService(TagService tagService) {
        this.tagService = tagService;
    }
}
