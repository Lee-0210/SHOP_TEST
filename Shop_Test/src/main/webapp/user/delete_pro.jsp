<%@page import="shop.service.UserService"%>
<%@page import="shop.service.UserServiceImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/meta.jsp" %>
<jsp:useBean id="userDAO" class="shop.dao.UserRepository" />

<%
	UserService userService = new UserServiceImpl();
    String id =	(String)session.getAttribute("loginId");
    
	int result = userService.delete(id);
	if(result != 0) {
		
		// 쿠키 삭제
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
		    for (Cookie cookie : cookies) {
		        cookie.setValue("");
		        cookie.setMaxAge(0);      
		        cookie.setPath("/");      
		        response.addCookie(cookie);
		    }
		}
		
		// 세션 삭제
		session.invalidate();
		
		response.sendRedirect(root + "/user/complete.jsp?msg=3");
	} else {
		response.sendRedirect(root + "/user/update.jsp");
	}
%>
