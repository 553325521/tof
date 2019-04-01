package top.tsep.websocket;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class Message {
	private String welcome;
	
	private List<String> username; //存放用户集合
	
	private String context;
	
	private String userId;
	
	private String userTx;
	
	private String msgTime;
	
	private String msgType;
	
	private String currentUser;
	
	
	public String getUserTx() {
		return userTx;
	}
	public void setUserTx(String userTx) {
		this.userTx = userTx;
	}
	
	public String getMsgType() {
		return msgType;
	}
	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}
	public String getCurrentUser() {
		return currentUser;
	}
	public void setCurrentUser(String currentUser) {
		this.currentUser = currentUser;
	}
	public String getWelcome() {
		return welcome;
	}
	public String getMsgTime() {
		return msgTime;
	}
	public void setMsgTime(String msgTime) {
		this.msgTime = msgTime;
	}
	public void setWelcome(String welcome) {
		this.welcome = welcome;
	}
	public List<String> getUsername() {
		return username;
	}
	public void setUsername(List<String> username) {
		this.username = username;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	
	public void setContext(String name,String msg) {
		/*this.context = name +" 在"
				+ new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(new Date()) + "说<br>"
				+ msg + "<br>" ;*/
		this.context = msg;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
}

