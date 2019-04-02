package top.tsep.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	@RequestMapping("/getVideoSrc")
    public void getVideoBlob_V(HttpServletRequest httpServletRequest,
                                        HttpServletResponse httpServletResponse) {

        String httpUrl = "http://kjdl.nnjjtgs.com/kj/study/org/20190305/080756_519.mp4";
        // 1.下载网络文件
        URL url = null;
        try {
            url = new URL(httpUrl);
        } catch (MalformedURLException e1) {
            e1.printStackTrace();
        }

        InputStream inStream = null;
        OutputStream outputStream = null;
        try {

            //2.获取链接
            URLConnection conn = url.openConnection();
            //3.输入流
            inStream = conn.getInputStream();
            httpServletResponse.reset();
            httpServletResponse.addHeader("Content-Disposition", "attachment;filename=" + httpUrl);
            //6.设置response编码
            httpServletResponse.setCharacterEncoding("UTF-8");
            httpServletResponse.addHeader("Content-Length", "" + 47514017);

            //设置输出文件类型
            httpServletResponse.setContentType("video/mpeg4");
            //7.获取response输出流
            outputStream = httpServletResponse.getOutputStream();
            int byteRead;
            while ((byteRead = inStream.read()) != -1) {
                outputStream.write(byteRead);
            }
            
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println(e);
        } finally {

            try {
                inStream.close();
                outputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

       /* return outputStream;*/
    }
}
