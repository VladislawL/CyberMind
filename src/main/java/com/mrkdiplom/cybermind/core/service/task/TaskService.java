package com.mrkdiplom.cybermind.core.service.task;

import com.mrkdiplom.cybermind.core.entity.Tag;
import com.mrkdiplom.cybermind.core.entity.Task;
import com.mrkdiplom.cybermind.web.pagedata.PaginationData;

import java.util.List;

public interface TaskService {
    List<Task> getAll();
    List<Task> getTaskPage(String query, List<Tag> tags, PaginationData paginationData);
    Task getTask(Long id);
    long getNumberOfTasks(String query, List<Tag> tags);
}
