package com.mrkdiplom.cybermind.core.service;

import com.mrkdiplom.cybermind.core.entity.Tag;
import com.mrkdiplom.cybermind.core.entity.Task;
import com.mrkdiplom.cybermind.core.sandbox.TaskExecutionResult;
import com.mrkdiplom.cybermind.web.pagedata.PaginationData;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.userdetails.UserDetails;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

public interface TaskService {
    List<Task> getAll();
    List<Task> getTaskPage(String query, String level, List<Tag> tags, PageRequest pageRequest);
    Optional<Task> getTask(Long id);
    long getNumberOfTasks(String query, String level, List<Tag> tags);
    String getTaskCode(Task task, UserDetails userDetails) throws IOException;
    void saveTaskCode(Task task, UserDetails userDetails, String code) throws IOException;
    void createJavaFile(Task task, UserDetails userDetails) throws IOException;
    TaskExecutionResult startTask(Task task, UserDetails userDetails) throws IOException, InterruptedException;
    Long saveTask(Task task, String solution, String test) throws IOException;
    String getSolution(Long id) throws IOException;
    String getTest(Long id) throws IOException;
}
