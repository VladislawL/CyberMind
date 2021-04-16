package com.mrkdiplom.cybermind.core.facade;

import com.mrkdiplom.cybermind.core.facade.dto.task.TaskDTO;
import com.mrkdiplom.cybermind.core.sandbox.TaskExecutionResult;

import java.io.IOException;

public interface TaskFacade {
    TaskDTO getTask(long id) throws IOException;
    void saveTaskCode(TaskDTO taskDTO) throws IOException;
    TaskExecutionResult startTask(TaskDTO taskDTO) throws IOException;
}
