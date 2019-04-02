package top.tsep.websocket;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.alibaba.fastjson.JSONObject;

@ServerEndpoint("/chat")
public class ChatServer {
	private String username;// 当前用户

	private String id;
	
	private String userTx;
	
	// 所用用户通信管道
	private static List<Session> sessions = Collections.synchronizedList(new ArrayList());
	// 所有用户列表
	private static List<String> users = Collections.synchronizedList(new ArrayList());

	/**
	 * @Onopen 就是建立连接时触发的事件 获取登录信息 并且把用户添加到用户列表中
	 */

	public static String getURLDecoderString(String str) {
		String result = "";
		if (null == str) {
			return "";
		}
		try {
			result = URLDecoder.decode(str, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	}

	@OnOpen
	public void open(Session session) {
		String query = session.getQueryString();
		/*String query = ChatServer.getURLDecoderString(queryEncode);*/
		username =ChatServer.getURLDecoderString((query.split("=")[1]).split("-")[1]);
		id = (query.split("=")[1]).split("-")[0];
		//userTx = (query.split("=")[1]).split("-")[2];
		//System.out.println(userTx);
		// 把每个session添加到用户通信管道里面去
		sessions.add(session);
		users.add(id);
		String msg = "欢迎" + username + "来到聊天室!";
		System.out.println(msg);
		System.out.println("在线人数1:" + users.size());
		System.out.println("在线人数2:" + sessions.size());
		// toMessage(session,"发给我自己");
		Message message = new Message();
		message.setUsername(users);
		message.setCurrentUser(username);
		message.setMsgType("self");
		message.setMsgTime(new SimpleDateFormat("yyyy年MM月dd日-hh:mm:ss").format(new Date()));
		message.setContext(username, "进入聊天室通知");
		toMessage(session, JSONObject.toJSONString(message));
		// 通知在线所有人更新好友列表
		try {
			Thread.sleep(300);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		message.setUsername(users);
		message.setCurrentUser(username);
		message.setMsgType("update_friend_list");
		message.setMsgTime(new SimpleDateFormat("yyyy年MM月dd日-hh:mm:ss").format(new Date()));
		message.setContext(username, "更新好友列表");
		broadcast(sessions, JSONObject.toJSONString(message));
	}

	/**
	 * 发送广播
	 */
	public void broadcast(List<Session> boradcast, String msg) {
		try {
			if (sessions.size() != 0) {
				for (Session s : sessions) {
					if (s != null) {
						s.getBasicRemote().sendText(msg);
					}
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void toMessage(Session currentUser, String msg) {
		try {
			if (currentUser != null) {
				currentUser.getBasicRemote().sendText(msg);
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 接收前端传来的消息/发送消息
	 */
	@OnMessage
	public void onMessage(String msg, Session session) {
		System.out.println("前端发送的消息为：" + msg);
		JSONObject msgObj = JSONObject.parseObject(msg);
		String msgType = msgObj.getString("msgType");
		String msgContent = msgObj.getString("msgContent");
		Message message = new Message();
		if (msgType.equals("update_friend_list")) {
			message.setMsgType("update_friend_list");
			message.setContext(username, "更新好友列表");
			message.setUsername(users);
			message.setCurrentUser(username);
			message.setMsgTime(new SimpleDateFormat("yyyy年MM月dd日-hh:mm:ss").format(new Date()));
			broadcast(sessions, JSONObject.toJSONString(message));
		}else if(msgType.equals("set_tx")){
			userTx = msgContent;
		} else {
			message.setUserTx(userTx);
			message.setUsername(users);
			message.setContext(username, msgContent);
			message.setCurrentUser(username);
			message.setMsgTime(new SimpleDateFormat("yyyy年MM月dd日-hh:mm:ss").format(new Date()));
			broadcast(sessions, JSONObject.toJSONString(message));
		}

	}

	/*
	 * 客户端断开链接后将其从线程安全的集合中移除
	 */
	@OnClose
	public void onClose(Session session) {
		System.out.println(username + "退出聊天室");
		sessions.remove(session);
		users.remove(id);
		System.out.println("在线人数1:" + users.size());
		System.out.println("在线人数2:" + sessions.size());
	}

	@OnError
	public void onError(Session session, Throwable error) {
		users.remove(id);
		sessions.remove(session);
	}
}
