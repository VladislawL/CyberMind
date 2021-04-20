package com.mrkdiplom.cybermind.core.service;

import com.mrkdiplom.cybermind.core.entity.Chapter;
import com.mrkdiplom.cybermind.core.entity.Learn;

import java.util.List;

public interface LearnService {
    List<Learn> getAll();
    Learn getLearnById(Long id);
    List<Chapter> getChaptersForLearn(Long id);
    Chapter getChapterForLearnById(Long id, Long chapterId);
    Chapter getFirstChapterForLearn(Long id);
}
