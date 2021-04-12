package com.mrkdiplom.cybermind.web.pagedata;

public class PaginationData {
    private int pageSize;
    private int currentPage;
    private long numberOfPages;
    private int numberOfPagesToShow;

    public PaginationData() {
    }

    public PaginationData(int pageSize, int currentPage, long numberOfPages, int numberOfPagesToShow) {
        this.pageSize = pageSize;
        this.currentPage = currentPage;
        this.numberOfPages = numberOfPages;
        this.numberOfPagesToShow = numberOfPagesToShow;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public long getNumberOfPages() {
        return numberOfPages;
    }

    public void setNumberOfPages(long numberOfPages) {
        this.numberOfPages = numberOfPages;
    }

    public int getNumberOfPagesToShow() {
        return numberOfPagesToShow;
    }

    public void setNumberOfPagesToShow(int numberOfPagesToShow) {
        this.numberOfPagesToShow = numberOfPagesToShow;
    }
}
