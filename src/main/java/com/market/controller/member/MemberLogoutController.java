package com.market.controller.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.common.SuperClass;

public class MemberLogoutController extends SuperClass{
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request, response);
//		try {
//			//장바구니에 담아놀은 정보가 있다면, 임시테이블(ShoppingBaskets)에 저장후 로그아웃
//			MycartList mycart = (MycartList)super.session.getAttribute("mycart");
//			if(mycart != null) {
//				//if(mycart.getMapSize() != 0) {
//					Map<Integer, Integer> orderMap = mycart.GetAllOrderLists();
//					
//					MallDao madao = new MallDao();
//					madao.InsertShoppingBaskets(super.loginfo.getId(),orderMap);
//				//}
//			}
//			//세션 영역 모든 정보를 휘발시키고 빠져나가기
//			super.session.invalidate();
//			super.Gotopage("/member/melogin.jsp");
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		super.session.invalidate();
		super.Gotopage("/Home/home.jsp");
	}
}
