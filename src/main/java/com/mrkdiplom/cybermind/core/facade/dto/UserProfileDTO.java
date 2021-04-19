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
    private List<Task> tasks;
    private List<Task> solvedTasks;
    private List<Task> attemptedTasks;

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

    public List<Task> getTasks() {
        return tasks;
    }

    public void setTasks(List<Task> tasks) {
        this.tasks = tasks;
    }

    public List<Task> getSolvedTasks() {
        return solvedTasks;
    }

    public void setSolvedTasks(List<Task> solvedTasks) {
        this.solvedTasks = solvedTasks;
    }

    public List<Task> getAttemptedTasks() {
        return attemptedTasks;
    }

    public void setAttemptedTasks(List<Task> attemptedTasks) {
        this.attemptedTasks = attemptedTasks;
    }
}
