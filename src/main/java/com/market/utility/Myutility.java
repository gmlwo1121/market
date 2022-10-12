package com.market.utility;

import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import com.market.common.SuperController;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class Myutility {// 유틸리티 용도롤 사용

	public static Map<String,SuperController> getActionMapList(String configFilePath) {
		//todolist.txt 파일을 이용하여 Map 구조에 채워 넣어 줌니다.
		Map<String,SuperController> mapdata = new HashMap<String,SuperController>();
		
		FileInputStream fis = null;
		Properties prop =null;
		
		try {
			fis = new FileInputStream(configFilePath);
			
			prop = new Properties();
			prop.load(fis);
			
			System.out.println("prop.toString()");
			System.out.println(prop.toString());
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(fis != null){fis.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		Enumeration<Object> enuTodo = prop.keys();
		while(enuTodo.hasMoreElements()) {
			String command = enuTodo.nextElement().toString();
			String className =prop.getProperty(command);
			
			try {
				Class<?> handleClass = Class.forName(className);
						
				SuperController instance = (SuperController)handleClass.newInstance();
				
				mapdata.put(command, instance);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		System.out.println(mapdata.toString());
		return mapdata;
	}
	
	public static MultipartRequest getMultipartRequest(HttpServletRequest request, String uploadedPath) {
		// 파일 업로드를 위한 MultipartRequest 객체를 반환해주는 메소드입니다.
		MultipartRequest multi = null ; // 파일 업로드 객체
		final String ENCODING = "UTF-8" ; // 인코딩 문자열
		int maxPostSize = 10 * 1024 * 1024 ; //업로드 허용 최대 사이즈
		
			try {
				multi = new MultipartRequest(
						request, 
						uploadedPath,
						maxPostSize,
						ENCODING,
						new DefaultFileRenamePolicy());
			} catch (Exception e) {
				e.printStackTrace();
			}
		return multi;
	}

	public static String getCurrentTime() {
		// 현재시각을 문자열로 만들어 반환
		return new SimpleDateFormat("yyyy년 MM월 dd일 hh시 mm분 ss초").format(new Date());
	}
}
