<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="shop.dao.OrderRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/meta.jsp"%>
<%
	
	// 비회원 주문 내역 세션에 등록 처리
	String phone = request.getParameter("phone"); 
	String orderPw = request.getParameter("orderPw"); 
	OrderRepository orderRepository = new OrderRepository();
	
	List<Product> list = orderRepository.list(phone, orderPw);
	request.setAttribute("phone", phone);
	session.setAttribute("notLoginList", list);		
	
	request.getRequestDispatcher("/user/order.jsp").forward(request, response);
%>