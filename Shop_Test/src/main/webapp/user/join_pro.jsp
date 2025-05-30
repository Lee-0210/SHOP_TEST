<!-- 
	회원 가입 처리
 -->
<%@page import="shop.service.UserServiceImpl"%>
<%@page import="shop.service.UserService"%>
<%@page import="shop.dao.UserRepository"%>
<%@page import="shop.dto.User"%>
<%@ include file="/layout/meta.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	UserService userService = new UserServiceImpl();
	
	// 유저의 정보 파라미터
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	// 생일 합치기
	String birth = year + "/" + month + "/" + day; 
	String email1 = request.getParameter("email1");
	String email2 = request.getParameter("email2");
	// 이메일 합치기
	String mail = email1 + "@" + email2;
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	
	User user = User.builder().id(id)
			        .password(pw)
			        .name(name)
			        .gender(gender)
			        .birth(birth)
			        .mail(mail)
			        .address(address)
			        .phone(phone)
			        .build();
	
	int result = userService.insert(user);
	
	if(result != 0) {
		System.out.println("회원가입 완료");
		response.sendRedirect(root + "/user/login.jsp");
	} else {
		response.getWriter().println("<script>alert('로그인이 필요한 서비스입니다');<script>");
		request.getRequestDispatcher(root + "/user/join.jsp").forward(request, response);
	}
	
%>
    
    

    
    
    
    
    
    