package com.jade.swp.handler;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class ReplyEchoHandler extends TextWebSocketHandler {

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//connection�� ��������
		System.out.println("afterConnectionClosed : "+session + " : " + status);
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		//connection�� ���������
		System.out.println("afterConnectionEstablished : "+session);
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		//socket�� �޽����� ��������
		System.out.println("handleTextMessage : "+session + " : " + message);
	}

}
