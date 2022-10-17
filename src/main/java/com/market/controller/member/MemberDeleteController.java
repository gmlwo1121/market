package com.market.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.common.SuperClass;
import com.market.controller.HomeController;
import com.market.dao.MemberDao;

public class MemberDeleteController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request, response);
		
		String id =request.getParameter("id");
		MemberDao dao = new MemberDao();
		int cnt=-999999;
		try {
			cnt = dao.DeleteData(id);
			super.session.invalidate();
			new MemberInsertController().doGet(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			new HomeController().doGet(request, response);
		}
	}
}
