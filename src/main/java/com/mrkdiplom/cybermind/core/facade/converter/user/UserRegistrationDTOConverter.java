package com.mrkdiplom.cybermind.core.facade.converter.user;

import com.mrkdiplom.cybermind.core.entity.User;
import com.mrkdiplom.cybermind.core.facade.converter.GenericConverter;
import com.mrkdiplom.cybermind.core.facade.dto.user.UserRegistrationDTO;
import org.springframework.stereotype.Component;

@Component
public class UserRegistrationDTOConverter implements GenericConverter<UserRegistrationDTO, User> {

    @Override
    public User apply(UserRegistrationDTO userRegistrationDTO) {
        User user = new User();
        user.setUsername(userRegistrationDTO.getUsername());
        user.setPassword(userRegistrationDTO.getPassword());
        return user;
    }

}
