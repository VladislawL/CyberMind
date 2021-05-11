package com.mrkdiplom.cybermind.core.service;

import com.mrkdiplom.cybermind.core.entity.Task;
import com.mrkdiplom.cybermind.core.entity.User;
import com.mrkdiplom.cybermind.core.facade.dto.UserRegistrationDTO;

import java.util.List;

public interface UserService {
    void register(UserRegistrationDTO userRegistrationDTO);
    User getUserByUsername(String username);
    Long getUserPosition(Integer id);
    List<User> getTopNUsers(Long n);
    void addPoints(User user, Task task);
}
