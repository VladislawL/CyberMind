package com.mrkdiplom.cybermind.core.entity;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@IdClass(SolvedTaskId.class)
@Table(name = "solved_tasks")
public class SolvedTask implements Serializable {

    @Id
    @Fetch(FetchMode.SELECT)
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id")
    private User user;

    @Id
    @Fetch(FetchMode.SELECT)
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "task_id")
    private Task task;

    @Column(name = "is_solved")
    private Boolean isSolved;

    public SolvedTask() {
    }

    public SolvedTask(User user, Task task, Boolean isSolved) {
        this.user = user;
        this.task = task;
        this.isSolved = isSolved;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Task getTask() {
        return task;
    }

    public void setTask(Task task) {
        this.task = task;
    }

    public Boolean getSolved() {
        return isSolved;
    }

    public void setSolved(Boolean solved) {
        isSolved = solved;
    }
}
