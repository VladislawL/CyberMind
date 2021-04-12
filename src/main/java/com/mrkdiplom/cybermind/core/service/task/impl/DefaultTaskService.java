package com.mrkdiplom.cybermind.core.service.task.impl;

import com.mrkdiplom.cybermind.core.entity.Tag;
import com.mrkdiplom.cybermind.core.entity.Task;
import com.mrkdiplom.cybermind.core.repository.task.TaskRepository;
import com.mrkdiplom.cybermind.core.service.task.TaskService;
import com.mrkdiplom.cybermind.web.pagedata.PaginationData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class DefaultTaskService implements TaskService {

    private TaskRepository taskRepository;

    @Override
    public List<Task> getAll() {
        return taskRepository.findAll();
    }

    @Override
    public List<Task> getTaskPage(String query, List<Tag> tags, PaginationData paginationData) {
        PageRequest pageRequest = PageRequest.of(paginationData.getCurrentPage(), paginationData.getPageSize());
        if (tags == null) {
            tags = Collections.emptyList();
        }
        return taskRepository.findAllByNameContainingIgnoreCase(query, pageRequest);
    }

    @Override
    public Task getTask(Long id) {
        return taskRepository.getOne(id);
    }

    @Override
    public long getNumberOfTasks(String query, List<Tag> tags) {
        return taskRepository.countTasksByNameContainingIgnoreCase(query);
    }

    @Autowired
    public void setTaskRepository(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }
}
