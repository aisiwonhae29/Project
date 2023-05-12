package com.KoreaIT.sw.demo.util;

import java.io.IOException;
import java.io.InputStream;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

public class ResourceLoader{
    public static void main(String[] args) {
    	
    	 String absolutePath = "/project/src/main/resources/static/gora.png";
         Resource resource = new ClassPathResource(absolutePath);
         
        try {
            InputStream imageStream = resource.getInputStream();
            // Use the image stream in your code as needed
            
            // Remember to close the input stream when you are done using it
            imageStream.close();
        } catch (IOException e) {
            // Handle the exception
            e.printStackTrace();
        }
    }
}