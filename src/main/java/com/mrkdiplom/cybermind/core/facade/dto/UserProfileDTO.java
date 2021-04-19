package com.mrkdiplom.cybermind.core.facade.dto;

import com.mrkdiplom.cybermind.core.entity.Task;

import java.util.List;
import java.util.Map;

public class UserProfileDTO {
    private String username;
    private Integer level;
    private Long points;
    private Long leaderBoardPosition;
    private Map<Long, Long> numberOfSolvedTasks;
    private List<TaskDTO> tasks;
    private List<TaskDTO> solvedTasks;
    private List<TaskDTO> attemptedTasks;

    public UserProfileDTO() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Integer getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public Long getPoints() {
        return points;
    }

    public void setPoints(Long points) {
        this.points = points;
    }

    public Long getLeaderBoardPosition() {
        return leaderBoardPosition;
    }

    public void setLeaderBoardPosition(Long leaderBoardPosition) {
        this.leaderBoardPosition = leaderBoardPosition;
    }

    public Map<Long, Long> getNumberOfSolvedTasks() {
        return numberOfSolvedTasks;
    }

    public void setNumberOfSolvedTasks(Map<Long, Long> numberOfSolvedTasks) {
        this.numberOfSolvedTasks = numberOfSolvedTasks;
    }

    public List<TaskDTO> getTasks() {
        return tasks;
    }

    public void setTasks(List<TaskDTO> tasks) {
        this.tasks = tasks;
    }

    public List<TaskDTO> getSolvedTasks() {
        return solvedTasks;
    }

    public void setSolvedTasks(List<TaskDTO> solvedTasks) {
        this.solvedTasks = solvedTasks;
    }

    public List<TaskDTO> getAttemptedTasks() {
        return attemptedTasks;
    }

    public void setAttemptedTasks(List<TaskDTO> attemptedTasks) {
        this.attemptedTasks = attemptedTasks;
    }
}
