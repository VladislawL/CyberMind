INSERT INTO `cybermind`.`user` (`id`, `username`, `password`, `enabled`)
    VALUES ('1', 'user1', '$2a$10$JJdewR3oK93pdv0fGmazGOWsAZlJhWoVTTt.VmPtmFWOLxMa27.Q6', '1');

INSERT INTO `cybermind`.`role` (`id`, `name`) VALUES ('1', 'USER');
INSERT INTO `cybermind`.`role` (`id`, `name`) VALUES ('2', 'ADMIN');

INSERT INTO `cybermind`.`users_roles` (`role_id`, `user_id`) VALUES ('1', '1');

INSERT INTO `cybermind`.`task` (`id`, `name`, `description`, `solution`)
    VALUES ('1', 'Riceboard', 'In th eSOLAR Laboratory,the Reply Social Lab,students and Replyers like stop lay table games while', '1234');

