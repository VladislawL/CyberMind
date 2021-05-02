package com.mrkdiplom.cybermind.core.repository;

import com.mrkdiplom.cybermind.core.entity.Tag;
import com.mrkdiplom.cybermind.core.entity.Task;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TaskRepository extends JpaRepository<Task, Long>, TaskRepositoryCustom {
    List<Task> findAllByTagsInAndNameIsLike(List<Tag> tags, String name, Pageable pageable);
    List<Task> findAllByNameContainingIgnoreCaseAndLevelContaining(String name, String level, Pageable pageable);
    Long countTasksByNameContainingIgnoreCaseAndLevelContaining(String name, String level);
    Long countTasksByNameContainingIgnoreCaseAndLevelContainingAndTags_nameIn(String name, String level, List<String> tags);
    List<Task> findAllByNameContainingIgnoreCaseAndLevelContainingAndTags_nameIn(String name, String level, List<String> tags, Pageable pageable);
}
