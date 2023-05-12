package com.KoreaIT.sw.demo.service;

import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Component;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

@Component
public class MyResourceLoader {
    private final ResourceLoader resourceLoader;
    @Autowired
    public MyResourceLoader(ResourceLoader resourceLoader) {
        this.resourceLoader = resourceLoader;
    }
    public void loadResource() {
        Resource resource = resourceLoader.getResource("classpath:static/gora.png");
        try {
            Path imagePath = resource.getFile().toPath();
            // Use the image file as needed
            // For example, you can copy it to another location
            Path targetPath = Path.of("target/gora.png");
            Files.copy(imagePath, targetPath, StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            // Handle the exception
            e.printStackTrace();
        }
    }
}