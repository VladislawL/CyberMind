package com.mrkdiplom.cybermind.web.siteconfig;

import com.mrkdiplom.cybermind.utils.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class SiteConfig {

    @Value("${pagination.pageSize}")
    private int pageSize;

    @Value("${pagination.numberOfPagesToShow}")
    private int numberOfPagesToShow;

    @Value("${upload.dir}")
    private String uploadDir;

    @Value("${top}")
    private Long top;

    public int getPageSize() {
        return pageSize;
    }

    public int getNumberOfPagesToShow() {
        return numberOfPagesToShow;
    }

    public String getUploadDir() {
        return uploadDir;
    }

    public Long getTop() {
        return top;
    }
}
