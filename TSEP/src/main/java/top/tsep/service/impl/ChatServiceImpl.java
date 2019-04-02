package top.tsep.service.impl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.tsep.dao.ChatDao;
import top.tsep.dao.LogDao;
import top.tsep.pojo.ChatEntity;
import top.tsep.pojo.LogEntity;
import top.tsep.pojo.UserEntity;
import top.tsep.service.ChatService;
import top.tsep.utils.CheckLoginStatus;
import top.tsep.utils.DateConvert;
import top.tsep.utils.ResultMap;

@Service("chatService")
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatDao chatDao;
	
	@Autowired
	private LogDao logDao;
	
	@Override
	public ResultMap saveChatMsg(HttpServletRequest request, String msgContent) {
		CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
		UserEntity currentUser = checkLoginStatus.getUsers();
		ChatEntity msg = new ChatEntity();
		msg.setUserId(currentUser.getId());
		msg.setSendTime(DateConvert.dateToString(new Date()));
		msg.setContent(msgContent);
		msg.setSubjectId(Integer.parseInt(currentUser.getAttribute2()));
		int insertChatMsgResult = chatDao.insertSelective(msg);
		LogEntity log = new LogEntity();
		log.setUserId(currentUser.getId());
		log.setSubjectId(Integer.parseInt(currentUser.getAttribute2()));
		log.setOperationType("讨论");
		log.setOperationTime(DateConvert.dateToString(new Date()));
		log.setOperationName(msgContent);
		int insertLogResult = logDao.insertSelective(log);
		ResultMap resultMap = new ResultMap();
		if(insertChatMsgResult > 0 && insertLogResult > 0){
			resultMap.setResultType("0000");
			resultMap.setResultContent("保存聊天记录成功");
		}else{
			resultMap.setResultType("9999");
			resultMap.setResultContent("保存聊天记录失败");
		}
		return resultMap;
	}

	/* （非 Javadoc）
	* <p>Title: loadMsgList</p>
	* <p>Description:加载历史消息 </p>
	* @param request
	* @return
	* @see top.tsep.service.ChatService#loadMsgList(javax.servlet.http.HttpServletRequest)
	*/
	@Override
	public List<ChatEntity> loadMsgList(HttpServletRequest request) {
		CheckLoginStatus checkLoginStatus = new CheckLoginStatus(request);
		UserEntity currentUser = checkLoginStatus.getUsers();
		return chatDao.loadMsgList(Integer.parseInt(currentUser.getAttribute2()));
	}

}
