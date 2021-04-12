package com.mrkdiplom.cybermind.web.siteconfig;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class SiteConfig {

    @Value("${pagination.pageSize}")
    private int pageSize;

    @Value("${pagination.numberOfPagesToShow}")
    private int numberOfPagesToShow;

    public int getPageSize() {
        return pageSize;
    }

    public int getNumberOfPagesToShow() {
        return numberOfPagesToShow;
    }
}
