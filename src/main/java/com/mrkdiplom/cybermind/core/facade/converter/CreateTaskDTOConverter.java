package com.mrkdiplom.cybermind.core.facade.converter;

import com.mrkdiplom.cybermind.core.entity.Task;
import com.mrkdiplom.cybermind.core.facade.dto.CreateTaskDTO;
import org.springframework.stereotype.Component;

@Component
public class CreateTaskDTOConverter implements GenericConverter<CreateTaskDTO, Task> {

    @Override
    public Task apply(CreateTaskDTO createTaskDTO) {
        Task task = new Task();

        task.setId(createTaskDTO.getId());
        task.setName(createTaskDTO.getName());
        task.setDescription(createTaskDTO.getDescription());
        task.setLevel(createTaskDTO.getLevel());

        return task;
    }
}
