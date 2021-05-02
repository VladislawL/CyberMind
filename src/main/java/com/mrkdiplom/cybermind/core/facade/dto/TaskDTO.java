package com.mrkdiplom.cybermind.core.facade.dto;

import com.mrkdiplom.cybermind.core.entity.Tag;

import java.util.List;

public class TaskDTO {
    private Long id;
    private String name;
    private String description;
    private String code;
    private Long views;
    private Long solutions;
    private String level;
    private List<Tag> tags;

    public TaskDTO() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Long getViews() {
        return views;
    }

    public void setViews(Long views) {
        this.views = views;
    }

    public Long getSolutions() {
        return solutions;
    }

    public void setSolutions(Long solutions) {
        this.solutions = solutions;
    }

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }
}
