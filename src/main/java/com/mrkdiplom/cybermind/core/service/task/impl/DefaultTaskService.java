package com.mrkdiplom.cybermind.core.service.task.impl;

import com.mrkdiplom.cybermind.core.entity.Task;
import com.mrkdiplom.cybermind.core.repository.task.TaskRepository;
import com.mrkdiplom.cybermind.core.service.task.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DefaultTaskService implements TaskService {

    private TaskRepository taskRepository;

    @Override
    public List<Task> getAll() {
        return taskRepository.findAll();
    }

    @Override
    public Task getTask(Integer id) {
        return taskRepository.getOne(id);
    }

    @Autowired
    public void setTaskRepository(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }
}
