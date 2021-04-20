package com.mrkdiplom.cybermind.core.repository.impl;

import com.mrkdiplom.cybermind.core.repository.UserRepositoryCustom;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import java.math.BigInteger;

@Transactional
public class UserRepositoryCustomImpl implements UserRepositoryCustom {

    @Autowired
    private EntityManagerFactory entityManagerFactory;

    private static final String GET_USER_POSITION = "select rank() over (order by points desc) as globalRank " +
            "from user where user.id = :id";

    @Override
    public Long getUserPosition(Integer id) {
        EntityManager entityManager = entityManagerFactory.createEntityManager();

        Query query = entityManager.createNativeQuery(GET_USER_POSITION);
        query.setParameter("id", id);
        Long position = ((BigInteger) query.getSingleResult()).longValue();

        entityManager.close();

        return position;
    }
}
