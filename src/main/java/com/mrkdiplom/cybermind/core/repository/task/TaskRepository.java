package com.mrkdiplom.cybermind.core.repository.task;

import com.mrkdiplom.cybermind.core.entity.Tag;
import com.mrkdiplom.cybermind.core.entity.Task;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TaskRepository extends JpaRepository<Task, Long> {
    List<Task> findAllByTagsInAndNameIsLike(List<Tag> tags, String name, Pageable pageable);
    List<Task> findAllByNameContainingIgnoreCase(String name, Pageable pageable);
    Long countTasksByNameContainingIgnoreCase(String name);
    List<Task> findAllByTagsIn(List<Tag> tags);
}
