package com.mrkdiplom.cybermind.core.facade.converter;

import com.mrkdiplom.cybermind.core.entity.Task;
import com.mrkdiplom.cybermind.core.facade.dto.TaskDTO;
import org.springframework.stereotype.Component;

@Component
public class TaskConverter implements GenericConverter<Task, TaskDTO> {
    @Override
    public TaskDTO apply(Task task) {
        TaskDTO taskDTO = new TaskDTO();
        taskDTO.setId(task.getId());
        taskDTO.setName(task.getName());
        taskDTO.setDescription(task.getDescription());
        taskDTO.setViews((long) task.getSolvedTasks().size());
        taskDTO.setSolutions(task.getSolvedTasks().stream()
                .filter(solvedTask -> solvedTask.getSolved() == Boolean.TRUE)
                .count());
        return taskDTO;
    }
}
