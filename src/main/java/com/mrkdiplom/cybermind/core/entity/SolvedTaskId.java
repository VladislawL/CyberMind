package com.mrkdiplom.cybermind.core.entity;

import java.io.Serializable;

public class SolvedTaskId implements Serializable {

    private Long task;
    private Integer user;

    public SolvedTaskId() {
    }

    public SolvedTaskId(Long task, Integer user) {
        this.task = task;
        this.user = user;
    }

    public Long getTask() {
        return task;
    }

    public void setTask(Long task) {
        this.task = task;
    }

    public Integer getUser() {
        return user;
    }

    public void setUser(Integer user) {
        this.user = user;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        SolvedTaskId that = (SolvedTaskId) o;

        if (task != null ? !task.equals(that.task) : that.task != null) return false;
        return user != null ? user.equals(that.user) : that.user == null;
    }

    @Override
    public int hashCode() {
        int result = task != null ? task.hashCode() : 0;
        result = 31 * result + (user != null ? user.hashCode() : 0);
        return result;
    }
}
