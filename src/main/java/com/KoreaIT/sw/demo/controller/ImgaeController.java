package com.KoreaIT.sw.demo.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.core.io.ClassPathResource;
import org.springframework.http.MediaType;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class ImgaeController {

    @RequestMapping(value = "/고라파덕", method = RequestMethod.GET,
            produces = MediaType.IMAGE_JPEG_VALUE)

    public void getImage(HttpServletResponse response) throws IOException {
    	
        var imgFile = new ClassPathResource("static/resource/image/고라파덕.png");
        byte[] bytes = StreamUtils.copyToByteArray(imgFile.getInputStream());
        
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        StreamUtils.copy(imgFile.getInputStream(), response.getOutputStream());
        
    }
    @RequestMapping(value = "/꼬부기", method = RequestMethod.GET,
            produces = MediaType.IMAGE_JPEG_VALUE)

    public void getImage2(HttpServletResponse response) throws IOException {
    	
        var imgFile = new ClassPathResource("static/resource/image/꼬부기.png");
        byte[] bytes = StreamUtils.copyToByteArray(imgFile.getInputStream());
        
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        StreamUtils.copy(imgFile.getInputStream(), response.getOutputStream());
        
    }
    @RequestMapping(value = "/냐옹이", method = RequestMethod.GET,
            produces = MediaType.IMAGE_JPEG_VALUE)

    public void getImage3(HttpServletResponse response) throws IOException {
    	
        var imgFile = new ClassPathResource("static/resource/image/냐옹이.png");
        byte[] bytes = StreamUtils.copyToByteArray(imgFile.getInputStream());
        
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        StreamUtils.copy(imgFile.getInputStream(), response.getOutputStream());
        
    }
    @RequestMapping(value = "/뮤", method = RequestMethod.GET,
            produces = MediaType.IMAGE_JPEG_VALUE)

    public void getImage4(HttpServletResponse response) throws IOException {
    	
        var imgFile = new ClassPathResource("static/resource/image/뮤.png");
        byte[] bytes = StreamUtils.copyToByteArray(imgFile.getInputStream());
        
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        StreamUtils.copy(imgFile.getInputStream(), response.getOutputStream());
        
    }
    @RequestMapping(value = "/브케인", method = RequestMethod.GET,
            produces = MediaType.IMAGE_JPEG_VALUE)

    public void getImage5(HttpServletResponse response) throws IOException {
    	
        var imgFile = new ClassPathResource("static/resource/image/브케인.png");
        byte[] bytes = StreamUtils.copyToByteArray(imgFile.getInputStream());
        
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        StreamUtils.copy(imgFile.getInputStream(), response.getOutputStream());
        
    }
    @RequestMapping(value = "/이브이", method = RequestMethod.GET,
            produces = MediaType.IMAGE_JPEG_VALUE)

    public void getImage6(HttpServletResponse response) throws IOException {
    	
        var imgFile = new ClassPathResource("static/resource/image/이브이.png");
        byte[] bytes = StreamUtils.copyToByteArray(imgFile.getInputStream());
        
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        StreamUtils.copy(imgFile.getInputStream(), response.getOutputStream());
        
    }
    @RequestMapping(value = "/이상해씨", method = RequestMethod.GET,
            produces = MediaType.IMAGE_JPEG_VALUE)

    public void getImage7(HttpServletResponse response) throws IOException {
    	
        var imgFile = new ClassPathResource("static/resource/image/이상해씨.png");
        byte[] bytes = StreamUtils.copyToByteArray(imgFile.getInputStream());
        
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        StreamUtils.copy(imgFile.getInputStream(), response.getOutputStream());
        
    }
    @RequestMapping(value = "/치코리타", method = RequestMethod.GET,
            produces = MediaType.IMAGE_JPEG_VALUE)

    public void getImage8(HttpServletResponse response) throws IOException {
    	
        var imgFile = new ClassPathResource("static/resource/image/치코리타.png");
        byte[] bytes = StreamUtils.copyToByteArray(imgFile.getInputStream());
        
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        StreamUtils.copy(imgFile.getInputStream(), response.getOutputStream());
        
    }
    @RequestMapping(value = "/토게피", method = RequestMethod.GET,
            produces = MediaType.IMAGE_JPEG_VALUE)

    public void getImage9(HttpServletResponse response) throws IOException {
    	
        var imgFile = new ClassPathResource("static/resource/image/토게피.png");
        byte[] bytes = StreamUtils.copyToByteArray(imgFile.getInputStream());
        
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        StreamUtils.copy(imgFile.getInputStream(), response.getOutputStream());
        
    }
    @RequestMapping(value = "/파이리", method = RequestMethod.GET,
            produces = MediaType.IMAGE_JPEG_VALUE)

    public void getImage10(HttpServletResponse response) throws IOException {
    	
        var imgFile = new ClassPathResource("static/resource/image/파이리.png");
        byte[] bytes = StreamUtils.copyToByteArray(imgFile.getInputStream());
        
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        StreamUtils.copy(imgFile.getInputStream(), response.getOutputStream());
        
    }
    @RequestMapping(value = "/푸린", method = RequestMethod.GET,
            produces = MediaType.IMAGE_JPEG_VALUE)

    public void getImage11(HttpServletResponse response) throws IOException {
    	
        var imgFile = new ClassPathResource("static/resource/image/푸린.png");
        byte[] bytes = StreamUtils.copyToByteArray(imgFile.getInputStream());
        
        response.setContentType(MediaType.IMAGE_JPEG_VALUE);
        StreamUtils.copy(imgFile.getInputStream(), response.getOutputStream());
        
    }
    
}