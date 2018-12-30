package com.os.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.os.pojo.O_Reply;
import com.os.utils.ResultMap;
import com.os.vo.ReplyVo;

public interface ReplyService {
	
	public ResultMap sendReply(HttpServletRequest request,O_Reply reply);
	
	public ResultMap replyStudent(HttpServletRequest request,O_Reply reply);
	
	public List<ReplyVo> getReplyData(O_Reply reply);
	
	public int getReplyCountByQId(int qId);
	
	public List<ReplyVo> getReplyDataByUser(HttpServletRequest request);
	
	public ResultMap deleteReply(O_Reply reply);
	
}
