<%@page import="shop.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/meta.jsp" %>
<jsp:useBean id="userDAO" class="shop.dao.UserRepository" />

<%

	// 회원 정보 수정 처리
	
	// 유저의 정보 파라미터
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String year = request.getParameter("year");
	String month = request.getParameter("month");
	String day = request.getParameter("day");
	// 생일 합치기
	String birth = year + "-" + month + "-" + day; 
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
							  .phone(phone)
							  .address(address)
							  .build();
	
    int result = userDAO.update(user);
    if (result != 0 ){
        response.sendRedirect("complete.jsp?msg=2");
    } else {
        response.sendRedirect("update.jsp");
    }

%>
