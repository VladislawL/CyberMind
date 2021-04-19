package com.mrkdiplom.cybermind.core.facade.dto;

public class TaskDTO {
    private Long id;
    private String name;
    private String description;
    private String code;
    private Long views;
    private Long solutions;

    public TaskDTO() {
    }

    public TaskDTO(Long id, String name, String description, String code) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.code = code;
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
}
