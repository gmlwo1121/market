package com.market.common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//import com.market.model.Member;

//하위 컨트롤러들이 공통적으로 사용하는 기능들은 여기에 작성합니다.
public class SuperClass implements SuperController{
	private HttpServletRequest request = null;
	private HttpServletResponse response = null;
	protected HttpSession session = null;
//	protected Member loginfo = null;
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.request = request;
		this.response = response;
		this.session = request.getSession();
//		this.loginfo = (Member)this.session.getAttribute("loginfo");//(Member)강등
	}
	
	public void Gotopage(String gotopage) {
		//요청한 페이지로 이동
		RequestDispatcher dispatcher = this.request.getRequestDispatcher(gotopage);
		try {
			dispatcher.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	public void setAlertMessage(String message) {
		// request 영역에 "alertMsg"라는 이름으로 사용자에게 경고창을 띄워줌
		this.request.setAttribute("alertMsg", message);
	}

	
}
