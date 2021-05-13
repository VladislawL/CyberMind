package com.mrkdiplom.cybermind.core.facade.converter;

import com.mrkdiplom.cybermind.core.entity.SolvedTask;
import com.mrkdiplom.cybermind.core.entity.User;
import com.mrkdiplom.cybermind.core.facade.dto.UserProfileDTO;
import com.mrkdiplom.cybermind.core.service.SolvedTaskService;
import com.mrkdiplom.cybermind.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Component
public class UserProfileConverter implements GenericConverter<User, UserProfileDTO> {

    @Autowired
    private UserService userService;

    @Autowired
    private TaskConverter taskConverter;

    @Autowired
    private SolvedTaskService solvedTaskService;

    @Override
    public UserProfileDTO apply(User user) {
        UserProfileDTO userProfileDTO = new UserProfileDTO();
        List<SolvedTask> solvedTasks = solvedTaskService.getSolvedTasksForUser(user);

        userProfileDTO.setUsername(user.getUsername());
        userProfileDTO.setPoints(user.getPoints());
        userProfileDTO.setLevel();
        userProfileDTO.setLeaderBoardPosition(userService.getUserPosition(user.getId()));
        userProfileDTO.setNumberOfSolvedTasks(getNumberOfSolvedTasks(solvedTasks));
        userProfileDTO.setTasks(taskConverter.convert(solvedTasks.stream()
                .map(SolvedTask::getTask)
                .collect(Collectors.toList())));
        userProfileDTO.setSolvedTasks(taskConverter.convert(solvedTasks.stream()
                .filter(SolvedTask::getSolved)
                .map(SolvedTask::getTask)
                .collect(Collectors.toList())));
        userProfileDTO.setAttemptedTasks(taskConverter.convert(solvedTasks.stream()
                .filter(solvedTask -> !solvedTask.getSolved())
                .map(SolvedTask::getTask)
                .collect(Collectors.toList())));

        return userProfileDTO;
    }

    private Map<Long, Long> getNumberOfSolvedTasks(List<SolvedTask> solvedTasks) {
        Map<Long, Long> numberOfSolvedTasks = new HashMap<>();

        for (SolvedTask solvedTask: solvedTasks) {
            numberOfSolvedTasks.put(Long.valueOf(solvedTask.getTask().getLevel()),
                    numberOfSolvedTasks.getOrDefault(Long.valueOf(solvedTask.getTask().getLevel()), (long) 0) + 1);
        }

        return numberOfSolvedTasks;
    }
}
