package com.os.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.os.pojo.O_Reply;
import com.os.service.ReplyService;
import com.os.utils.ResultMap;
import com.os.vo.ReplyVo;

@Controller
@RequestMapping("/replyController")
public class ReplyController {
	
	@Autowired
	private ReplyService replyService;
	
	 @RequestMapping( value = "/sendReply", method = RequestMethod.POST )
	 @ResponseBody
	public ResultMap sendReply(HttpServletRequest request,O_Reply reply) {
		ResultMap resultMap = replyService.sendReply(request, reply);
		return resultMap;
	}
	 @RequestMapping( value = "/replyStudent", method = RequestMethod.POST )
	 @ResponseBody
	public ResultMap replyStudent(HttpServletRequest request,O_Reply reply) {
		ResultMap resultMap = replyService.replyStudent(request, reply);
		return resultMap;
	}
	 
	 @RequestMapping( value = "/deleteReply", method = RequestMethod.POST )
	 @ResponseBody
	public ResultMap deleteReply(O_Reply reply) {
		ResultMap resultMap = replyService.deleteReply(reply);
		return resultMap;
	}
	 
	 @RequestMapping( value = "/getReplyData", method = RequestMethod.POST )
	 @ResponseBody
	public List<ReplyVo> getReplyData(O_Reply reply) {
		
		 List<ReplyVo> returnData = replyService.getReplyData(reply);
		return returnData;
	}
	 
	 @RequestMapping( value = "/getReplyDataByUser", method = RequestMethod.POST )
	 @ResponseBody
	public List<ReplyVo> getReplyDataByUser(HttpServletRequest request) {
		
		 List<ReplyVo> returnData = replyService.getReplyDataByUser(request);
		return returnData;
	}
	 
	 @RequestMapping( value = "/getReplyCountByQId", method = RequestMethod.POST )
	 @ResponseBody
	 public int getReplyCountByQId(int qId){
		 
		 return replyService.getReplyCountByQId(qId);
	 }
	 
}
