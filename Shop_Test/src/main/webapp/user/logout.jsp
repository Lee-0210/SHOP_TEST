<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/meta.jsp"%>
<%	
	// 자동 로그인, 토큰 쿠키 삭제
	Cookie cookieMe = new Cookie("rememberMe", "");
	Cookie cookieId = new Cookie("rememberId", "");
	Cookie cookieToken = new Cookie("token", "");
	
	cookieId.setPath("/");
	cookieId.setMaxAge(0);
	cookieMe.setPath("/");
	cookieMe.setMaxAge(0);
	cookieToken.setPath("/");
	cookieToken.setMaxAge(0);

	// 세션 무효화
	session.invalidate();
	
	// 쿠키 전달
	response.addCookie(cookieId);
	response.addCookie(cookieMe);
	response.addCookie(cookieToken);
	
	// index 페이지로 이동
	response.sendRedirect(root);
%>