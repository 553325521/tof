package top.tsep.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import top.tsep.pojo.ChatEntity;
import top.tsep.service.ChatService;
import top.tsep.utils.ResultMap;

@Controller
@RequestMapping("/chat")
public class ChatController {

	@Autowired
	private ChatService chatService;
	
	@RequestMapping(value = "/saveChatMsg", method = RequestMethod.POST)
	@ResponseBody
	public ResultMap saveChatMsg(HttpServletRequest request,String msgContent) {
		ResultMap r = chatService.saveChatMsg(request, msgContent);
		return r;
	}
	
	@RequestMapping(value = "/loadMsgList", method = RequestMethod.POST)
	@ResponseBody
	public List<ChatEntity> loadMsgList(HttpServletRequest request) {
		return chatService.loadMsgList(request);
	}
	
}
