package com.mrkdiplom.cybermind.core.sandbox;

public class TaskExecutionResult {
    private String out;
    private String error;
    private int codeResult;

    public TaskExecutionResult() {
    }

    public TaskExecutionResult(String out, String error, int codeResult) {
        this.out = out;
        this.error = error;
        this.codeResult = codeResult;
    }

    public String getOut() {
        return out;
    }

    public void setOut(String out) {
        this.out = out;
    }

    public String getError() {
        return error;
    }

    public void setError(String error) {
        this.error = error;
    }

    public int getCodeResult() {
        return codeResult;
    }

    public void setCodeResult(int codeResult) {
        this.codeResult = codeResult;
    }
}
