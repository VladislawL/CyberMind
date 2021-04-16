package com.mrkdiplom.cybermind.utils;

import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.FileSystems;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.stream.Collectors;

public class FileUtils {
    public static String readFile(String path) throws IOException {
        Path p = Paths.get(path);
        if (p.toFile().exists()) {
            return Files.lines(p)
                    .collect(Collectors.joining("\n"));
        } else {
            return "";
        }
    }

    public static void saveFile(String path, String fileName, String text) throws IOException {
        Path p = Paths.get(path);

        if (!Files.exists(p)) {
            Files.createDirectories(p);
        }

        try (InputStream in = new BufferedInputStream(new ByteArrayInputStream(text.getBytes()))) {
            Path newFilePath = p.resolve(fileName);
            Files.copy(in, newFilePath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            throw new IOException("Could not save file: " + fileName, e);
        }
    }

    public static boolean fileExists(String path) {
        return Files.exists(Paths.get(path));
    }

    public static String getFileDelimiter() {
        return FileSystems.getDefault().getSeparator();
    }
}
