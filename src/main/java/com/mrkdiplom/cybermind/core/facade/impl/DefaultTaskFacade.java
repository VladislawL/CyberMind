package com.mrkdiplom.cybermind.core.facade.impl;

import com.mrkdiplom.cybermind.core.entity.Task;
import com.mrkdiplom.cybermind.core.facade.TaskFacade;
import com.mrkdiplom.cybermind.core.facade.converter.task.TaskConverter;
import com.mrkdiplom.cybermind.core.facade.dto.task.TaskDTO;
import com.mrkdiplom.cybermind.core.sandbox.TaskExecutionResult;
import com.mrkdiplom.cybermind.core.service.task.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.io.IOException;

@Service
public class DefaultTaskFacade implements TaskFacade {

    @Autowired
    private TaskConverter taskConverter;

    @Autowired
    private TaskService taskService;

    @Override
    public TaskDTO getTask(long id) throws IOException {
        Task task = taskService.getTask(id);
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        TaskDTO taskDTO = taskConverter.convert(task);
        taskDTO.setCode(taskService.getTaskCode(task, userDetails));
        return taskDTO;
    }

    @Override
    public void saveTaskCode(TaskDTO taskDTO) throws IOException {
        Task task = taskService.getTask(taskDTO.getId());
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        taskService.saveTaskCode(task, userDetails, taskDTO.getCode());
    }

    @Override
    public TaskExecutionResult startTask(TaskDTO taskDTO) throws IOException {
        Task task = taskService.getTask(taskDTO.getId());
        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        taskService.createJavaFile(task, userDetails);
        return taskService.startTask(task, userDetails);
    }
}
