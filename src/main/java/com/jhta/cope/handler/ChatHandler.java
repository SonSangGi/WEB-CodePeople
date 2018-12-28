package com.jhta.cope.handler;

import java.util.HashMap;
import java.util.Map;

import org.springframework.util.StringUtils;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.jhta.cope.vo.User;

public class ChatHandler extends TextWebSocketHandler{
	
	private static final Map<String, WebSocketSession> sessionMap = new HashMap<String,WebSocketSession>();
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		String payLoad = message.getPayload();
		String payLoadItem[] = payLoad.split(":");
		String protocol = payLoadItem[0];
		System.out.println(protocol);
		if("QNA".equals(protocol)) {
			String msg = payLoadItem[1];
			String json = new ObjectMapper().writeValueAsString(this.getSessionUser(session));
			System.out.println(json);
			for (String key : sessionMap.keySet()) {
				WebSocketSession ws = sessionMap.get(key);
				User user = getSessionUser(ws);
				if(user.getAuthStatus() == 9) {
				ws.sendMessage(new TextMessage("ANSWER/ADMIN/"+json+"/"+msg));
				}
			}
		}
		
	}
	
	//연결시
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		User user= this.getSessionUser(session);
		System.out.println("[서버 연결됨]"+user.getId()+": "+session.getRemoteAddress().getAddress().getHostAddress());
		sessionMap.put(user.getId(),session);
		System.out.println(this.getAllOnUserId());
	}
	//해제시
		@Override
		public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionMap.remove(this.getSessionUser(session).getId());
		System.out.println("[서버 연결 끊김]"+this.getSessionUser(session).getId()+": "+session.getRemoteAddress().getAddress().getHostAddress());
	}
	//오류시
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
	}
	private User getSessionUser(WebSocketSession session) {
		Map<String, Object> attr = session.getAttributes();
		return (User) attr.get("LOGIN_USER");
	}
	private String getAllOnUserId() {
		return StringUtils.collectionToDelimitedString(sessionMap.keySet(), ",");
	}
}
