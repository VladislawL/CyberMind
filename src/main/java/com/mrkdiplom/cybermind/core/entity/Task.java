package com.mrkdiplom.cybermind.core.entity;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "task")
public class Task implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name")
    private String name;

    @Column(name = "description")
    private String description;

    @Column(name = "level")
    private Long level;

    @Fetch(FetchMode.SELECT)
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "task_tags",
            joinColumns = @JoinColumn(name = "task_id", referencedColumnName = "id"),
            inverseJoinColumns = @JoinColumn(name = "tags_id", referencedColumnName = "id")
    )
    private List<Tag> tags;

    @Fetch(FetchMode.SELECT)
    @OneToMany(mappedBy = "task", fetch = FetchType.EAGER)
    private List<SolvedTask> solvedTasks;

    public Task() {
    }

    public Task(String name, String description, List<Tag> tags) {
        this.name = name;
        this.description = description;
        this.tags = tags;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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

    public Long getLevel() {
        return level;
    }

    public void setLevel(Long level) {
        this.level = level;
    }

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }

    public List<SolvedTask> getSolvedTasks() {
        return solvedTasks;
    }

    public void setSolvedTasks(List<SolvedTask> solvedTasks) {
        this.solvedTasks = solvedTasks;
    }
}
