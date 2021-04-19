package com.mrkdiplom.cybermind.core.service.user;

import com.mrkdiplom.cybermind.core.entity.User;
import com.mrkdiplom.cybermind.core.facade.dto.user.UserRegistrationDTO;

public interface UserService {
    void register(UserRegistrationDTO userRegistrationDTO);
    User getUserByUsername(String username);
}
