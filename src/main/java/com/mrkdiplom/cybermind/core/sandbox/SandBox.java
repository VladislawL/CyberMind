package com.mrkdiplom.cybermind.core.sandbox;

import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

@Component
public class SandBox {

    public static TaskExecutionResult start(String path) throws IOException, InterruptedException {
        Process process = new ProcessBuilder("java.exe", path).start();
        InputStream stdout = process.getInputStream();
        InputStream stderr = process.getErrorStream();

        String line = "";
        String out = "";
        String error = "";

        Thread.sleep(2000);
        if(process.isAlive()){
            process.destroy();
            error += "Request time out! Your code is running too long. Change it and try again!";
        }

        BufferedReader outReader = new BufferedReader(new InputStreamReader(stdout));
        while ((line = outReader.readLine()) != null) { //считываем поток выхода
            out += line + "\n";
        }
        outReader.close();

        BufferedReader errReader = new BufferedReader(new InputStreamReader(stderr));
        while ((line = errReader.readLine()) != null) { //считываем поток ошибок
            if(line.contains("error")){
                line = line.substring(line.lastIndexOf("error"));
            }
            if(line.startsWith("Note"))
                continue;
            error += line + "\n";
            if (line.contains("Exception in thread \"main\"")) {
                break;
            }
        }
        errReader.close();

        return new TaskExecutionResult(out, error, process.exitValue());
    }
}
