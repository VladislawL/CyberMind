package com.mrkdiplom.cybermind.web.controller;

import com.mrkdiplom.cybermind.core.facade.TaskFacade;
import com.mrkdiplom.cybermind.core.facade.dto.task.TaskDTO;
import com.mrkdiplom.cybermind.core.sandbox.TaskExecutionResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.IOException;

@Controller
public class TaskController {

    private TaskFacade taskFacade;

    @GetMapping(value = "/task/{id}")
    public String taskPage(@PathVariable("id") Long id, Model model) throws IOException {
        TaskDTO task = taskFacade.getTask(id);
        taskFacade.viewTask(task);
        model.addAttribute("task", task);
        return "taskPage";
    }

    @PostMapping(value = "/task/{id}", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public TaskExecutionResult testTask(@PathVariable("id") Long id, @RequestBody TaskDTO code) throws IOException {
        code.setId(id);
        taskFacade.saveTaskCode(code);
        return taskFacade.startTask(code);
    }

    @Autowired
    public void setTaskFacade(TaskFacade taskFacade) {
        this.taskFacade = taskFacade;
    }
}
