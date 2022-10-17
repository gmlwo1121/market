package com.market.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.common.SuperClass;
import com.market.dao.MemberDao;
import com.market.model.Member;

public class MemberPageController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request, response);
		
		String id = request.getParameter("id");
		
		MemberDao dao =new MemberDao();
		try {
			Member bean = dao.SelectData(id);
			request.setAttribute("bean", bean);
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.Gotopage("/member/mepage.jsp");
	}
}
