package com.market.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.market.common.SuperController;
import com.market.utility.Myutility;
import com.oreilly.servlet.MultipartRequest;

@WebServlet(
		urlPatterns = {"/market"},
		initParams = {
				@WebInitParam(name = "configFile", value = "/WEB-INF/todolist.txt")
		})
public class FrontController extends HttpServlet{
	private final String ENCODING = "UTF-8";
	private String uploadedPath = null; // MultipartRequest
	private ServletContext application = null;
	// todolist.txt 파일에 들어있는 모든 컨트롤러들의 객체를 저장하고있는 맵구조
	private Map<String,SuperController> todolist = new HashMap<String,SuperController>();
	
	@Override
	public void init(ServletConfig config) throws ServletException {
		this.application = config.getServletContext();
		
		String configFile = config.getInitParameter("configFile");
		String configFilePath = this.application.getRealPath(configFile);
		
		System.out.println("configFile = "+configFile);
		System.out.println("configFilePath = "+configFilePath);
		//너무길어서 Myutility로 나눔
		this.todolist = Myutility.getActionMapList(configFilePath);
		
		//for File Upload
		this.uploadedPath = this.application.getRealPath("/upload");
		System.out.println("file uploaded path : \n"+this.uploadedPath);
		this.application.setAttribute("uploadedPath", uploadedPath);
		
		//System.out.println("컨트롤 개수"+this.todolist.size());
	}
	
	protected void doprocess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String command = request.getParameter("command");
		
		if(command == null) {
			System.out.println("file upload event invoked");
			
			MultipartRequest multi = Myutility.getMultipartRequest(request,uploadedPath);
			if(multi != null) {
				command = multi.getParameter("command");
				//파일 없로드 오브젝트 request 스코프에 바인딩 
				request.setAttribute("multi", multi);
			}else {
				System.out.println("Muti object is null");
			}
		}
		
		System.out.println("command = "+ command);
		
		SuperController controller = this.todolist.get(command);
		if (controller != null) {
			String method = request.getMethod().toLowerCase();
			if (method.equals("get")) {
				System.out.println(controller.toString()+" get called");
				controller.doGet(request, response);
			}else {
				System.out.println(controller.toString()+" post called");
				controller.doPost(request, response);
			}
		}else {
			System.out.println("request command is not found");
		}
	}
	
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(ENCODING);
		this.doprocess(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding(ENCODING);
		this.doprocess(request, response);
	}
}
