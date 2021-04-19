package com.mrkdiplom.cybermind.core.service.impl;

import com.mrkdiplom.cybermind.core.entity.SolvedTask;
import com.mrkdiplom.cybermind.core.entity.SolvedTaskId;
import com.mrkdiplom.cybermind.core.repository.SolvedTaskRepository;
import com.mrkdiplom.cybermind.core.service.SolvedTaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class DefaultSolvedTaskService implements SolvedTaskService {

    @Autowired
    private SolvedTaskRepository solvedTaskRepository;

    @Override
    public void saveSolvedTask(SolvedTask newSolvedTask) {
        Optional<SolvedTask> optionalSolvedTask = solvedTaskRepository.findById(new SolvedTaskId(newSolvedTask.getTask().getId(), newSolvedTask.getUser().getId()));
        if (optionalSolvedTask.isEmpty()) {
            solvedTaskRepository.save(newSolvedTask);
        } else if (optionalSolvedTask.get().getSolved() != Boolean.TRUE && newSolvedTask.getSolved() != Boolean.FALSE) {
            solvedTaskRepository.save(newSolvedTask);
        }
    }
}
