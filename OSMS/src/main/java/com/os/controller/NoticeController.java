package com.os.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.os.pojo.O_Notice;
import com.os.service.NoticeService;
import com.os.utils.BootStrapTable;
import com.os.utils.ResultMap;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/noticeController")
public class NoticeController {
     
	@Autowired
	private NoticeService noticeService;
	
	 @RequestMapping( value = "/getNoticeData", method = RequestMethod.POST,consumes = "application/json" )
	 @ResponseBody
	 public BootStrapTable getNoticeData(@RequestBody JSONObject json ){
		 BootStrapTable bst = new BootStrapTable();
		 bst.setOffset((json.getInt("offset")));
		 bst.setLimit(json.getInt("limit"));
		 return noticeService.getNoticeData(bst);
	 }
	 @RequestMapping( value = "/getLastNoticeData", method = RequestMethod.POST,consumes = "application/json" )
	 @ResponseBody
	 public BootStrapTable getLastNoticeData(){
		 return noticeService.getLastNoticeData();
	 }
	 @RequestMapping( value = "/addNotice", method = RequestMethod.POST)
	 @ResponseBody
	 public ResultMap addNotice(O_Notice n){
		 ResultMap resultMap = noticeService.addNotice(n);
		 return resultMap;
	 }
	 @RequestMapping( value = "/updateNotice", method = RequestMethod.POST)
	 @ResponseBody
	 public ResultMap updateNotice(O_Notice n){
		 ResultMap resultMap = noticeService.updateNotice(n);
		 return resultMap;
	 }
	 @RequestMapping( value = "/deleteNotices", method = RequestMethod.POST)
	 @ResponseBody
	 public ResultMap deleteNotices(String ids){
		 ResultMap resultMap = noticeService.deleteNotices(ids);
		 return resultMap;
	 }
	
}
