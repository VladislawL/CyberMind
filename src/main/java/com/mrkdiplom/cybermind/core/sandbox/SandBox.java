package com.mrkdiplom.cybermind.core.sandbox;

import org.springframework.stereotype.Component;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;

@Component
public class SandBox {

    public static void start(String path) throws IOException {
        Process process = Runtime.getRuntime().exec("java.exe " + path);

        InputStream stdout = process.getInputStream();
        InputStream stderr = process.getErrorStream();

        String line = "";

        BufferedReader outReader = new BufferedReader(new InputStreamReader(stdout));
        while ((line = outReader.readLine()) != null) { //считываем поток выхода
            System.out.println(line);
        }
        outReader.close();

        BufferedReader errReader = new BufferedReader(new InputStreamReader(stderr));
        while ((line = errReader.readLine()) != null) { //считываем поток ошибок
            System.out.println(line);
            if (line.contains("Exception in thread")) {
                break;
            }
        }
        errReader.close();

        System.out.println(process.exitValue());
    }
}
