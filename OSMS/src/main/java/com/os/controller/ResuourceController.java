package com.os.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.os.pojo.O_Resource;
import com.os.service.ResourceService;
import com.os.utils.BootStrapTable;
import com.os.utils.ResultMap;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/resourceController")
public class ResuourceController {

    @Autowired
    private ResourceService resourceService;

    @ResponseBody
    @RequestMapping(value = "/upLoad", method = RequestMethod.POST)
    public Map upLoad(HttpServletRequest request)
            throws Exception {
        MultipartHttpServletRequest multipart = (MultipartHttpServletRequest) request;
        MultipartFile file = multipart.getFile("file");
        String path = request.getSession().getServletContext().getRealPath("file");
        String fileName = new Date().getTime() + file.getOriginalFilename();
        File filepath = new File(path, fileName);
        //判断路径是否存在，如果不存在就创建一个
        if (!filepath.getParentFile().exists()) {
            filepath.getParentFile().mkdirs();
        }
        //将上传文件保存到一个目标文件当中
        file.transferTo(filepath);
        Map<String, String> map = new HashMap<String, String>();
        map.put("filePath", path + new Date().getTime() + file.getOriginalFilename());
        map.put("fileName", file.getOriginalFilename());
        return map;
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public ResultMap add(O_Resource r) {
        return resourceService.add(r);
    }

    @RequestMapping(value = "/getResourceData", method = RequestMethod.POST, consumes = "application/json")
    @ResponseBody
    public BootStrapTable getResourceData(@RequestBody JSONObject json) {
        BootStrapTable bst = new BootStrapTable();
        bst.setOffset((json.getInt("offset")));
        bst.setLimit(json.getInt("limit"));
        return resourceService.getResourceData(bst);
    }

    @RequestMapping(value = "/deleteResource", method = RequestMethod.POST)
    @ResponseBody
    public ResultMap deleteResource(String ids) {
        ResultMap resultMap = resourceService.deletes(ids);
        return resultMap;
    }

    @RequestMapping("/download")
    public ResponseEntity<byte[]> download(HttpServletRequest request, String resourceUrl) throws IOException {
        StringBuilder path = new StringBuilder(resourceUrl);
        path.insert(resourceUrl.indexOf("file") + 4, "/");
        File file = new File(path.toString());
        byte[] body = null;
        InputStream is = new FileInputStream(file);
        body = new byte[is.available()];
        is.read(body);
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Disposition", "attchement;filename=" + file.getName());
        HttpStatus statusCode = HttpStatus.OK;
        ResponseEntity<byte[]> entity = new ResponseEntity<byte[]>(body, headers, statusCode);
        return entity;
    }

    public static void main(String[] args) {
        String url = "D:/tomcat/apache-tomcat-9.0.0.M1/webapps/OSMS/filea.txt";
        StringBuilder path = new StringBuilder(url);
        path.insert(url.indexOf("file") + 4, "/");
        File file = new File(path.toString());
        try {
            InputStream is = new FileInputStream(file);
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        System.out.println(path);
    }

}
