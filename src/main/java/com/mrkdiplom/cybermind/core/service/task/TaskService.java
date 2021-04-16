package com.mrkdiplom.cybermind.core.service.task;

import com.mrkdiplom.cybermind.core.entity.Tag;
import com.mrkdiplom.cybermind.core.entity.Task;
import com.mrkdiplom.cybermind.web.pagedata.PaginationData;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.IOException;
import java.util.List;

public interface TaskService {
    List<Task> getAll();
    List<Task> getTaskPage(String query, List<Tag> tags, PaginationData paginationData);
    Task getTask(Long id);
    long getNumberOfTasks(String query, List<Tag> tags);
    String getTaskCode(Task task, UserDetails userDetails) throws IOException;
    void saveTaskCode(Task task, UserDetails userDetails, String code) throws IOException;
    void createJavaFile(Task task, UserDetails userDetails) throws IOException;
    void startTask(Task task, UserDetails userDetails);
}
