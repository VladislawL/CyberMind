package com.mrkdiplom.cybermind.core.service.task.impl;

import com.mrkdiplom.cybermind.core.entity.Tag;
import com.mrkdiplom.cybermind.core.entity.Task;
import com.mrkdiplom.cybermind.core.repository.TaskRepository;
import com.mrkdiplom.cybermind.core.sandbox.SandBox;
import com.mrkdiplom.cybermind.core.sandbox.TaskExecutionResult;
import com.mrkdiplom.cybermind.core.service.task.TaskService;
import com.mrkdiplom.cybermind.utils.FileUtils;
import com.mrkdiplom.cybermind.web.pagedata.PaginationData;
import com.mrkdiplom.cybermind.web.siteconfig.SiteConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

@Service
public class DefaultTaskService implements TaskService {

    private TaskRepository taskRepository;
    private SiteConfig siteConfig;

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
    public Optional<Task> getTask(Long id) {
        return taskRepository.findById(id);
    }

    @Override
    public long getNumberOfTasks(String query, List<Tag> tags) {
        return taskRepository.countTasksByNameContainingIgnoreCase(query);
    }

    @Override
    public String getTaskCode(Task task, UserDetails userDetails) throws IOException {
        if (!FileUtils.fileExists(String.join(FileUtils.getFileDelimiter(), siteConfig.getUploadDir(), userDetails.getUsername(), task.getName().toLowerCase(), "Solution.txt"))) {
            return FileUtils.readFile(String.join(FileUtils.getFileDelimiter(), siteConfig.getUploadDir(), task.getName().toLowerCase(), "Solution.txt"));
        } else {
            return FileUtils.readFile(String.join(FileUtils.getFileDelimiter(), siteConfig.getUploadDir(), userDetails.getUsername(), task.getName().toLowerCase(), "Solution.txt"));
        }
    }

    @Override
    public void saveTaskCode(Task task, UserDetails userDetails, String code) throws IOException {
        FileUtils.saveFile(String.join(FileUtils.getFileDelimiter(), siteConfig.getUploadDir(), userDetails.getUsername(), task.getName().toLowerCase()), "Solution.txt", code);
    }

    @Override
    public void createJavaFile(Task task, UserDetails userDetails) throws IOException {
        String testFile = FileUtils.readFile(String.join(FileUtils.getFileDelimiter(), siteConfig.getUploadDir(), task.getName().toLowerCase(), "Test.txt"));
        String solutionFile = FileUtils.readFile(String.join(FileUtils.getFileDelimiter(), siteConfig.getUploadDir(), userDetails.getUsername(), task.getName().toLowerCase(), "Solution.txt"));
        FileUtils.saveFile(String.join(FileUtils.getFileDelimiter(), siteConfig.getUploadDir(), userDetails.getUsername(), task.getName().toLowerCase()),
                "Test.java",
                testFile + "\n" + solutionFile);
    }

    @Override
    public TaskExecutionResult startTask(Task task, UserDetails userDetails) throws IOException {
        return SandBox.start(String.join(FileUtils.getFileDelimiter(), siteConfig.getUploadDir(), userDetails.getUsername(), task.getName().toLowerCase(), "Test.java"));
    }

    @Autowired
    public void setTaskRepository(TaskRepository taskRepository) {
        this.taskRepository = taskRepository;
    }

    @Autowired
    public void setSiteConfig(SiteConfig siteConfig) {
        this.siteConfig = siteConfig;
    }
}
