package com.mrkdiplom.cybermind.core.service.impl;

import com.mrkdiplom.cybermind.core.entity.Chapter;
import com.mrkdiplom.cybermind.core.entity.Learn;
import com.mrkdiplom.cybermind.core.repository.ChapterRepository;
import com.mrkdiplom.cybermind.core.repository.LearnRepository;
import com.mrkdiplom.cybermind.core.service.LearnService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class DefaultLearnService implements LearnService {

    @Autowired
    private LearnRepository learnRepository;

    @Autowired
    private ChapterRepository chapterRepository;

    @Override
    public List<Learn> getAll() {
        return learnRepository.findAll();
    }

    @Override
    public Learn getLearnById(Long id) {
        return learnRepository.findById(id).orElse(null);
    }

    @Override
    public List<Chapter> getChaptersForLearn(Long id) {
        return chapterRepository.findAllByLearn(learnRepository.findById(id).get());
    }

    @Override
    public Chapter getChapterForLearnById(Long id, Long chapterId) {
        return chapterRepository.findByLearnAndId(learnRepository.findById(id).get(), chapterId);
    }

    @Override
    public Chapter getFirstChapterForLearn(Long id) {
        return chapterRepository.findFirstByLearn(learnRepository.findById(id).get());
    }

    @Override
    public Learn saveLearn(Learn learn) {
        return learnRepository.save(learn);
    }

    @Override
    public Chapter saveChapter(Chapter chapter) {
        return chapterRepository.save(chapter);
    }
}
