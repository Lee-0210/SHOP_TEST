<!-- 로그인 처리 -->
<%@page import="shop.service.UserServiceImpl"%>
<%@page import="shop.service.UserService"%>
<%@page import="java.util.UUID"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="shop.dto.User"%>
<%@ include file="/layout/meta.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	UserServiceImpl userService = new UserServiceImpl();
	User loginUser = userService.login(id, pw);
	
	// 로그인 실패
	if(loginUser == null) {
		response.sendRedirect(root + "/user/login.jsp?error=0");	
	} 
	// 로그인 성공
	if(loginUser != null) {
		session.setAttribute("loginId", loginUser.getId());
		response.sendRedirect(root + "/index.jsp");
	}
	// - 세션에 아이디 등록
	
	// 아이디 저장
	
	// 자동 로그인
	
	// 쿠키 전달
	
	// 로그인 성공 페이지로 이동
%>





