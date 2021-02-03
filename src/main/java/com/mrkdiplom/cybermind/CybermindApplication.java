package com.mrkdiplom.cybermind;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@EnableJpaRepositories(basePackages = "com.mrkdiplom.cybermind.core.repository")
@SpringBootApplication
public class CybermindApplication {

    public static void main(String[] args) {
        SpringApplication.run(CybermindApplication.class, args);
    }

}
