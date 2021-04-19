package com.mrkdiplom.cybermind.core.facade;

import com.mrkdiplom.cybermind.core.entity.Tag;
import com.mrkdiplom.cybermind.core.facade.dto.TaskDTO;
import com.mrkdiplom.cybermind.core.sandbox.TaskExecutionResult;
import com.mrkdiplom.cybermind.web.pagedata.PaginationData;

import java.io.IOException;
import java.util.List;

public interface TaskFacade {
    TaskDTO getTask(long id) throws IOException;
    List<TaskDTO> getTasks(String query, List<Tag> tags, PaginationData paginationData);
    void saveTaskCode(TaskDTO taskDTO) throws IOException;
    TaskExecutionResult startTask(TaskDTO taskDTO) throws IOException;
    void viewTask(TaskDTO taskDTO);
}
