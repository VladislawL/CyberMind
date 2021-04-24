package com.mrkdiplom.cybermind.core.repository;

import com.mrkdiplom.cybermind.core.entity.User;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserRepository extends CrudRepository<User, Long>, UserRepositoryCustom {

    @Query("SELECT u FROM User u WHERE u.username = :username")
    User getUserByUsername(@Param("username") String username);

    @Query("select u from User u order by u.points desc")
    List<User> getTopUsersByPoints(Pageable pageable);

}
