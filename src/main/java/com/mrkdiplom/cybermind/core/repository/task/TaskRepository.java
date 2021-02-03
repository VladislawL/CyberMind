package com.mrkdiplom.cybermind.core.repository.task;

import com.mrkdiplom.cybermind.core.entity.Task;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TaskRepository extends JpaRepository<Task, Integer> {

}
