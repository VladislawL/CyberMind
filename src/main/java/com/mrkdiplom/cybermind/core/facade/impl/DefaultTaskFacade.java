package com.mrkdiplom.cybermind.core.facade.impl;

import com.mrkdiplom.cybermind.core.entity.SolvedTask;
import com.mrkdiplom.cybermind.core.entity.Tag;
import com.mrkdiplom.cybermind.core.entity.Task;
import com.mrkdiplom.cybermind.core.entity.User;
import com.mrkdiplom.cybermind.core.facade.TaskFacade;
import com.mrkdiplom.cybermind.core.facade.converter.TaskConverter;
import com.mrkdiplom.cybermind.core.facade.dto.TaskDTO;
import com.mrkdiplom.cybermind.core.sandbox.TaskExecutionResult;
import com.mrkdiplom.cybermind.core.service.SolvedTaskService;
import com.mrkdiplom.cybermind.core.service.TaskService;
import com.mrkdiplom.cybermind.core.service.UserService;
import com.mrkdiplom.cybermind.web.pagedata.PaginationData;
import com.mrkdiplom.cybermind.web.siteconfig.SiteConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class DefaultTaskFacade implements TaskFacade {

    @Autowired
    private TaskConverter taskConverter;

    @Autowired
    private TaskService taskService;

    @Autowired
    private UserService userService;

    @Autowired
    private SolvedTaskService solvedTaskService;

    @Autowired
    private SiteConfig siteConfig;

    @Override
    public TaskDTO getTask(long id) throws IOException {
        Task task = taskService.getTask(id).get();
        UserDetails userDetails = getUserDetails();
        TaskDTO taskDTO = taskConverter.convert(task);
        taskDTO.setCode(taskService.getTaskCode(task, userDetails));
        return taskDTO;
    }

    @Override
    public List<TaskDTO> getTasks(String query, String level, List<Tag> tags, PaginationData paginationData) {
        if (paginationData.getSortField() == null || "".equals(paginationData.getSortField())) {
            paginationData.setSortField(siteConfig.getDefaultSortField());
        }

        if (paginationData.getSortOrder() == null || "".equals(paginationData.getSortOrder())) {
            paginationData.setSortOrder(siteConfig.getDefaultSortOrder());
        }

        PageRequest pageRequest = PageRequest.of(
                paginationData.getCurrentPage(), paginationData.getPageSize(),
                Sort.by(new Sort.Order(Sort.Direction.fromString(paginationData.getSortOrder()), paginationData.getSortField())));

        return taskConverter.convert(taskService.getTaskPage(query, level, tags, pageRequest));
    }

    @Override
    public void saveTaskCode(TaskDTO taskDTO) throws IOException {
        Task task = taskService.getTask(taskDTO.getId()).get();
        UserDetails userDetails = getUserDetails();
        taskService.saveTaskCode(task, userDetails, taskDTO.getCode());
    }

    @Override
    public TaskExecutionResult startTask(TaskDTO taskDTO) throws IOException, InterruptedException {
        Task task = taskService.getTask(taskDTO.getId()).get();
        UserDetails userDetails = getUserDetails();
        User user = userService.getUserByUsername(userDetails.getUsername());
        taskService.createJavaFile(task, userDetails);
        TaskExecutionResult result = taskService.startTask(task, userDetails);

        if (result.getError().isEmpty()) {
            solvedTaskService.saveSolvedTask(new SolvedTask( user, task, Boolean.TRUE));
        }

        return taskService.startTask(task, userDetails);
    }

    @Override
    public void viewTask(TaskDTO taskDTO) {
        Task task = taskService.getTask(taskDTO.getId()).get();
        UserDetails userDetails = getUserDetails();
        User user = userService.getUserByUsername(userDetails.getUsername());
        SolvedTask solvedTask = new SolvedTask();
        solvedTask.setSolved(Boolean.FALSE);
        solvedTask.setTask(task);
        solvedTask.setUser(user);
        solvedTaskService.saveSolvedTask(solvedTask);
    }

    private UserDetails getUserDetails() {
        return (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }
}
