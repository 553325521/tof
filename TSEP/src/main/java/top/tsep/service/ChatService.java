
package top.tsep.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import top.tsep.pojo.ChatEntity;
import top.tsep.utils.ResultMap;

public interface ChatService {
	
	public ResultMap saveChatMsg(HttpServletRequest request,String msgContent);
	
	public List<ChatEntity> loadMsgList(HttpServletRequest request);
	
}
