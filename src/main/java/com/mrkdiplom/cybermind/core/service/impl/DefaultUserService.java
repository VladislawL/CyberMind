package com.mrkdiplom.cybermind.core.service.impl;

import com.mrkdiplom.cybermind.core.entity.SolvedTask;
import com.mrkdiplom.cybermind.core.entity.Task;
import com.mrkdiplom.cybermind.core.entity.User;
import com.mrkdiplom.cybermind.core.facade.converter.UserRegistrationDTOConverter;
import com.mrkdiplom.cybermind.core.facade.dto.UserRegistrationDTO;
import com.mrkdiplom.cybermind.core.repository.RoleRepository;
import com.mrkdiplom.cybermind.core.repository.UserRepository;
import com.mrkdiplom.cybermind.core.service.SolvedTaskService;
import com.mrkdiplom.cybermind.core.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.List;

@Service
public class DefaultUserService implements UserService {

    private UserRepository userRepository;
    private UserRegistrationDTOConverter userRegistrationDTOConverter;
    private PasswordEncoder passwordEncoder;
    private RoleRepository roleRepository;
    private SolvedTaskService solvedTaskService;

    @Override
    public void register(UserRegistrationDTO userRegistrationDTO) {
        User user = userRegistrationDTOConverter.convert(userRegistrationDTO);
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(Boolean.TRUE);
        user.setRoles(Arrays.asList(roleRepository.getRoleByName("USER")));
        userRepository.save(user);
    }

    @Override
    public User getUserByUsername(String username) {
        return userRepository.getUserByUsername(username);
    }

    @Override
    public Long getUserPosition(Integer id) {
        return userRepository.getUserPosition(id);
    }

    @Override
    public List<User> getTopNUsers(Long n) {
        return userRepository.getTopUsersByPoints(PageRequest.of(0, n.intValue()));
    }

    @Override
    public void addPoints(User user, Task task) {
        SolvedTask solvedTask = solvedTaskService.getSolvedTaskByUserAndTask(user, task);
        if (solvedTask.getSolved() == Boolean.FALSE) {
            user.setPoints(user.getPoints() + Long.parseLong(task.getLevel()));
            userRepository.save(user);
        }
    }

    @Autowired
    public void setUserRepository(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    @Autowired
    public void setUserRegistrationDTOConverter(UserRegistrationDTOConverter userRegistrationDTOConverter) {
        this.userRegistrationDTOConverter = userRegistrationDTOConverter;
    }

    @Autowired
    public void setPasswordEncoder(PasswordEncoder passwordEncoder) {
        this.passwordEncoder = passwordEncoder;
    }

    @Autowired
    public void setRoleRepository(RoleRepository roleRepository) {
        this.roleRepository = roleRepository;
    }

    @Autowired
    public void setSolvedTaskService(SolvedTaskService solvedTaskService) {
        this.solvedTaskService = solvedTaskService;
    }
}
