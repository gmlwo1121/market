package com.market.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.common.SuperClass;
import com.market.controller.HomeController;
import com.market.dao.MemberDao;
import com.market.model.Member;

public class MemberLoginController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request, response);
		super.Gotopage("/member/melogin.jsp");
	}
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request, response);
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberDao dao = new MemberDao();
		Member bean = null;
		try {
			bean = dao.SelectData(id,password);
		} catch (Exception e) {
			e.printStackTrace();
		}
		super.doProcess(request, response);
		
		if(bean == null) {
			super.setAlertMessage("아이디/비번이 잘못되었습니다.");
			super.Gotopage("/member/melogin.jsp");
		}else {
//			try {
				super.session.setAttribute("loginfo", bean);
//				
//				MallDao madao = new MallDao();
//				
//				List<CartItem> lists = madao.GetCartItemList(bean.getId());
//				
//				if(lists.size() > 0) {
//					MycartList mycart = new MycartList();
//					
//					for(CartItem item:lists) {
//						mycart.AddOrder(item.getPnum(), item.getQty());
//					}
//					super.session.setAttribute("mycart", mycart);
//				}
//				
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
			new HomeController().doGet(request, response);
		}
	}
}
