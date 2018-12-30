package com.os.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.os.pojo.O_Question;
import com.os.service.QuestionService;
import com.os.utils.BootStrapTable;
import com.os.utils.ResultMap;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/questionController")
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;
	
	 @RequestMapping( value = "/addStudentQuestion", method = RequestMethod.POST )
	 @ResponseBody
	public ResultMap addStudentQuestion(HttpServletRequest request,O_Question o_Question) {
		 ResultMap resultMap = questionService.addStudentQuestion(request, o_Question);
		return resultMap;
	}
	 @RequestMapping( value = "/confirmBestResult", method = RequestMethod.POST )
	 @ResponseBody
	public ResultMap confirmBestResult(int qId,int rId) {
		 ResultMap resultMap = questionService.confirmBestResult(qId, rId);
		return resultMap;
	}
	 @RequestMapping( value = "/addTeacherQuestion", method = RequestMethod.POST )
	 @ResponseBody
	public ResultMap addTeacherQuestion(HttpServletRequest request,O_Question o_Question) {
		 ResultMap resultMap = questionService.addTeacherQuestion(request, o_Question);
		return resultMap;
	}
	 @RequestMapping( value = "/deleteQuestionByUser", method = RequestMethod.POST )
	 @ResponseBody
	public ResultMap deleteQuestionByUser(HttpServletRequest request,O_Question o_Question) {
		 ResultMap resultMap = questionService.deleteQuestionByUser(request, o_Question);
		return resultMap;
	}
	 @RequestMapping( value = "/getQuestionData", method = RequestMethod.POST,consumes = "application/json" )
	 @ResponseBody
	 public BootStrapTable getQuestionData(@RequestBody JSONObject json ){
		 BootStrapTable bst = new BootStrapTable();
		 bst.setOffset((json.getInt("offset")));
		 bst.setLimit(json.getInt("limit"));
		 bst.setType(json.getInt("type"));
		 bst.setState(json.getInt("state"));
		 return questionService.getStudentQuestionData(bst);
	 }
	 @RequestMapping( value = "/getQuestionByUser", method = RequestMethod.POST,consumes = "application/json" )
	 @ResponseBody
	 public BootStrapTable getQuestionByUser(@RequestBody JSONObject json,HttpServletRequest request ){
		 BootStrapTable bst = new BootStrapTable();
		 bst.setOffset((json.getInt("offset")));
		 bst.setLimit(json.getInt("limit"));
		 return questionService.getStudentQuestionByUser(bst, request);
	 }
	 @RequestMapping( value = "/getQuestionData1", method = RequestMethod.POST,consumes = "application/json" )
	 @ResponseBody
	 public BootStrapTable getQuestionData1(@RequestBody JSONObject json ){
		 BootStrapTable bst = new BootStrapTable();
		 bst.setOffset((json.getInt("offset")));
		 bst.setLimit(json.getInt("limit"));
		 bst.setType(json.getInt("type"));
		 bst.setState(json.getInt("state"));
		 return questionService.getTeacherQuestionData(bst);
	 }
}
