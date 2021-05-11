package com.mrkdiplom.cybermind.core.service;

import com.mrkdiplom.cybermind.core.entity.SolvedTask;
import com.mrkdiplom.cybermind.core.entity.Task;
import com.mrkdiplom.cybermind.core.entity.User;

import java.util.List;

public interface SolvedTaskService {
    void saveSolvedTask(SolvedTask newSolvedTask);
    List<SolvedTask> getSolvedTasksForUser(User user);
    SolvedTask getSolvedTaskByUserAndTask(User user, Task task);
}
