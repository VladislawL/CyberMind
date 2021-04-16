package com.mrkdiplom.cybermind.core.facade.converter.task;

import com.mrkdiplom.cybermind.core.entity.Task;
import com.mrkdiplom.cybermind.core.facade.converter.GenericConverter;
import com.mrkdiplom.cybermind.core.facade.dto.task.TaskDTO;
import org.springframework.stereotype.Component;

@Component
public class TaskConverter implements GenericConverter<Task, TaskDTO> {
    @Override
    public TaskDTO apply(Task task) {
        TaskDTO taskDTO = new TaskDTO();
        taskDTO.setName(task.getName());
        taskDTO.setDescription(task.getDescription());
        return taskDTO;
    }
}
