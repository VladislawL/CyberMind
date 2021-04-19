package com.mrkdiplom.cybermind.web.controller;

import com.mrkdiplom.cybermind.core.facade.TaskFacade;
import com.mrkdiplom.cybermind.core.facade.dto.task.TaskDTO;
import com.mrkdiplom.cybermind.core.service.task.TaskService;
import com.mrkdiplom.cybermind.web.pagedata.PaginationData;
import com.mrkdiplom.cybermind.web.siteconfig.SiteConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@RequestMapping(value = "/tasks")
public class TaskListController {

    private TaskService taskService;
    private TaskFacade taskFacade;
    private SiteConfig siteConfig;

    @GetMapping
    public String tasksPage(
            @RequestParam(value = "query", defaultValue = "", required = false) String query,
            @RequestParam(value = "page", defaultValue = "0", required = false) Integer page,
            @RequestParam(value = "SortField", defaultValue = "", required = false) String sortField,
            @RequestParam(value = "SortOrder", defaultValue = "", required = false) String sortOrder,
            Model model) {
        PaginationData paginationData = createPaginationData(siteConfig.getPageSize(), page, siteConfig.getNumberOfPagesToShow(), query);
        List<TaskDTO> taskList = taskFacade.getTasks(query, null, paginationData);
        model.addAttribute("tasks", taskList);
        model.addAttribute("paginationData", paginationData);
        return "tasks";
    }

    private PaginationData createPaginationData(int pageSize, int currentPage, int numberOfPagesToShow, String query) {
        PaginationData paginationData = new PaginationData();

        paginationData.setPageSize(pageSize);
        paginationData.setCurrentPage(currentPage);

        long numberOfTasks = taskService.getNumberOfTasks(query, null);
        if (numberOfTasks % pageSize == 0) {
            paginationData.setNumberOfPages(numberOfTasks / pageSize);
        } else {
            paginationData.setNumberOfPages(numberOfTasks / pageSize + 1);
        }
        paginationData.setNumberOfPagesToShow(numberOfPagesToShow);

        return paginationData;
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
}
