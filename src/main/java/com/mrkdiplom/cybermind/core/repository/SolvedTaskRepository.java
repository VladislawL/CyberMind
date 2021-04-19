package com.mrkdiplom.cybermind.core.repository;

import com.mrkdiplom.cybermind.core.entity.SolvedTask;
import com.mrkdiplom.cybermind.core.entity.SolvedTaskId;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SolvedTaskRepository extends JpaRepository<SolvedTask, SolvedTaskId> {
}
