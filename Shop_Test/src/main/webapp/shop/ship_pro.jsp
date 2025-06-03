<%@page import="shop.dto.Ship"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/meta.jsp"%>
<%
	String name = request.getParameter("name");
	String shippingDate = request.getParameter("shippingDate");
	String country = request.getParameter("country");
	String zipCode = request.getParameter("zipCode");
	String addressName = request.getParameter("addressName");
	String phone = request.getParameter("phone");
	
	Ship ship = Ship.builder().shipName(name)
							  .date(shippingDate)
							  .country(country)
							  .zipCode(zipCode)
							  .address(addressName)
							  .phone(phone)
							  .build();
	
	session.setAttribute("ship", ship);
	response.sendRedirect(root + "/shop/order.jsp");
%>