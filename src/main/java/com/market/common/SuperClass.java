package com.market.common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.market.model.Member;

public class SuperClass implements SuperController{
	private HttpServletRequest request = null;
	private HttpServletResponse response = null;
	protected HttpSession session = null;
	protected Member loginfo = null;
	
	public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.request = request;
		this.response = response;
		this.session = request.getSession();
		this.loginfo = (Member)this.session.getAttribute("loginfo");
	}
	
	public void Gotopage(String gotopage) {
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
		this.request.setAttribute("alertMsg", message);
	}
}
