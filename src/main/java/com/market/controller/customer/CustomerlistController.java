package com.market.controller.customer;

import com.market.common.SuperClass;

public class CustomerlistController extends SuperClass{
	BoardDao dao =null;
	
	public BoardlistController() {
		this.dao = new BoardDao();
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doProcess(request, response);
		
		String pageNumber = request.getParameter("pageNumber");
		String pageSize = request.getParameter("pageSize");
		String mode = request.getParameter("mode");
		String keyword = request.getParameter("keyword");
		
		// FlowParameters에서 넘어오는 페이징 정보를 이용하여 정보를 넘겨줌 
		FlowParameters parameter =new FlowParameters(pageNumber,pageSize,mode,keyword); 
		System.out.println(parameter.toString());
				
		try {
			
			int totalCount = this.dao.GetTotalCount(parameter.getMode(),parameter.getKeyword());
			String url = request.getContextPath() + "/Shopping?command=bolist";
			Paging pageInfo = new Paging(
					parameter.getPageNumber(),
					parameter.getPageSize(),
					totalCount,
					url,
					parameter.getMode(),
					parameter.getKeyword()
					);
			
			//List<Board> lists = this.dao.SelectDataList();
			List<Board> lists = this.dao.SelectDataList(pageInfo.getBeginRow(),pageInfo.getEndRow(),parameter.getMode(),parameter.getKeyword());
			
			//System.out.println(lists.size());
			request.setAttribute("lists", lists);
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("parameter", parameter.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		super.Gotopage("/board/bolist.jsp");
	}
}
