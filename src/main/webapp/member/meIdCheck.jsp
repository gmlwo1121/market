<%@page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	JSONObject jsobj = (JSONObject)request.getAttribute("jsobj");
%>

<%=jsobj.toString()%>
