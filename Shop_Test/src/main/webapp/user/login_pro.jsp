<!-- 로그인 처리 -->
<%@page import="shop.dao.UserRepository"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="shop.dto.User"%>
<%@ include file="/layout/meta.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	UserRepository userRepository = new UserRepository();
	User loginUser = userRepository.login(id, pw);
	
	// 로그인 실패
	if(loginUser == null) {
		response.sendRedirect(root + "/user/login.jsp?error=0");	
		return;
	} 
	// 로그인 성공
	else {
		// - 세션에 아이디 등록
		session.setAttribute("loginId", loginUser.getId());
	}
	
	// 아이디 저장
	String rememberId = request.getParameter("remember-id");
	if(rememberId != null && rememberId.equals("on")) {
		Cookie cookieId = new Cookie("rememberId", loginUser.getId());
		cookieId.setPath("/");                
		cookieId.setMaxAge(60 * 60 * 24 * 7);
		
		// 쿠키 전달
		response.addCookie(cookieId);
	}
	
	// 자동 로그인
	String rememberMe = request.getParameter("remember-me");
	if(rememberMe != null && rememberMe.equals("on")) {
		String token = userRepository.refreshToken(loginUser.getId());
		
		Cookie cookieToken = new Cookie("token", token);
		Cookie cookieRemember = new Cookie("rememberMe", "1");
		
		cookieToken.setPath("/");
		cookieToken.setMaxAge(60 * 60 * 24 * 7);
		cookieRemember.setPath("/");
		cookieRemember.setMaxAge(60 * 60 * 24 * 7);
		
		System.out.println("자동 로그인 쿠키 저장");
		// 쿠키 전달
		response.addCookie(cookieToken);
		response.addCookie(cookieRemember);
	}
	
	// 로그인 성공 페이지로 이동
	response.sendRedirect(root + "/user/complete.jsp?msg=0");
%>





