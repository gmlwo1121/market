package com.market.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.common.SuperClass;
import com.market.dao.MemberDao;
import com.market.model.Member;

public class MemberInsertController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request, response);
		super.Gotopage("/member/meinsert.jsp");
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request, response);
		
		Member bean = new Member();
		bean.setId(request.getParameter("id"));
		bean.setName(request.getParameter("name"));
		bean.setPassword(request.getParameter("password"));
		
		System.out.println(bean.toString());
		
		MemberDao dao = new MemberDao();
		int cnt = -99999;
		
		try {
			cnt = dao.InsertData(bean);
			new MemberLoginController().doGet(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			new MemberInsertController().doGet(request, response);
		}
	}

}
