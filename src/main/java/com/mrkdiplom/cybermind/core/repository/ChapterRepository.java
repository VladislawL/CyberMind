package com.mrkdiplom.cybermind.core.repository;

import com.mrkdiplom.cybermind.core.entity.Chapter;
import com.mrkdiplom.cybermind.core.entity.Learn;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface ChapterRepository extends JpaRepository<Chapter, Long> {

//    @Query("select c from Chapter c where c.learn.id = :learnId")
    List<Chapter> findAllByLearn(Learn learn);

    Chapter findByLearnAndId(Learn learn, Long id);

    Chapter findFirstByLearn(Learn learn);

}
