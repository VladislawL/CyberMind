package com.mrkdiplom.cybermind.core.service.impl;

import com.mrkdiplom.cybermind.core.entity.Tag;
import com.mrkdiplom.cybermind.core.entity.Task;
import com.mrkdiplom.cybermind.core.repository.TaskRepository;
import com.mrkdiplom.cybermind.core.sandbox.SandBox;
import com.mrkdiplom.cybermind.core.sandbox.TaskExecutionResult;
import com.mrkdiplom.cybermind.core.service.TaskService;
import com.mrkdiplom.cybermind.utils.FileUtils;
import com.mrkdiplom.cybermind.web.pagedata.PaginationData;
import com.mrkdiplom.cybermind.web.siteconfig.SiteConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class DefaultTaskService implements TaskService {

    private TaskRepository taskRepository;
    private SiteConfig siteConfig;

    @Override
    public List<Task> getAll() {
        return taskRepository.findAll();
    }

    @Override
    public List<Task> getTaskPage(String query, String level, List<Tag> tags, PageRequest pageRequest) {
        if (tags.size() == 0) {
            return taskRepository.findAllByNameContainingIgnoreCaseAndLevelContaining(query, level, pageRequest);
        } else {
            List<String> tagsName = tags.stream()
                    .map(Tag::getName)
                    .collect(Collectors.toList());
            return taskRepository.findAllByNameContainingIgnoreCaseAndLevelContainingAndTags_nameIn(query, level, tagsName, pageRequest);
        }
    }

    @Override
    public Optional<Task> getTask(Long id) {
        return taskRepository.findById(id);
    }

    @Override
    public long getNumberOfTasks(String query, String level, List<Tag> tags) {
        if (tags.size() == 0) {
            return taskRepository.countTasksByNameContainingIgnoreCaseAndLevelContaining(query, level);
        } else {
            List<String> tagsName = tags.stream()
                    .map(Tag::getName)
                    .collect(Collectors.toList());
            return taskRepository.countTasksByNameContainingIgnoreCaseAndLevelContainingAndTags_nameIn(query, level, tagsName);
        }
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
    public TaskExecutionResult startTask(Task task, UserDetails userDetails) throws IOException, InterruptedException {
        return SandBox.start(String.join(FileUtils.getFileDelimiter(), siteConfig.getUploadDir(), userDetails.getUsername(), task.getName().toLowerCase(), "Test.java"));
    }

    @Override
    public Long saveTask(Task task, String solution, String test) throws IOException {
        Long id = taskRepository.save(task).getId();
        FileUtils.saveFile(String.join(FileUtils.getFileDelimiter(), siteConfig.getUploadDir(), task.getName().toLowerCase()), "Solution.txt", solution);
        FileUtils.saveFile(String.join(FileUtils.getFileDelimiter(), siteConfig.getUploadDir(), task.getName().toLowerCase()), "Test.txt", test);
        return id;
    }

    @Override
    public String getSolution(Long id) throws IOException {
        Task task = taskRepository.getOne(id);
        return FileUtils.readFile(String.join(FileUtils.getFileDelimiter(), siteConfig.getUploadDir(), task.getName(), "Solution.txt"));
    }

    @Override
    public String getTest(Long id) throws IOException {
        Task task = taskRepository.getOne(id);
        return FileUtils.readFile(String.join(FileUtils.getFileDelimiter(), siteConfig.getUploadDir(), task.getName(), "Test.txt"));
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
