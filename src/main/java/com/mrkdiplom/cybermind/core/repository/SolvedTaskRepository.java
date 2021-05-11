package com.mrkdiplom.cybermind.core.repository;

import com.mrkdiplom.cybermind.core.entity.SolvedTask;
import com.mrkdiplom.cybermind.core.entity.SolvedTaskId;
import com.mrkdiplom.cybermind.core.entity.Task;
import com.mrkdiplom.cybermind.core.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface SolvedTaskRepository extends JpaRepository<SolvedTask, SolvedTaskId> {

    @Query("select s from SolvedTask s where s.user = :user")
    List<SolvedTask> findAllByUser(@Param("user") User user);

    SolvedTask findByUserAndTask(User user, Task task);

}
