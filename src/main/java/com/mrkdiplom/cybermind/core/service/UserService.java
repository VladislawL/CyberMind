package com.mrkdiplom.cybermind.core.service;

import com.mrkdiplom.cybermind.core.entity.User;
import com.mrkdiplom.cybermind.core.facade.dto.UserRegistrationDTO;

public interface UserService {
    void register(UserRegistrationDTO userRegistrationDTO);
    User getUserByUsername(String username);
}
