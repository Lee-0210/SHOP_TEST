<%@page import="shop.dao.OrderRepository"%>
<%@page import="shop.dto.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ include file="/layout/meta.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	OrderRepository orderRepository = new OrderRepository(); 	// Dao
	
	
	response.sendRedirect(root + "/shop/products.jsp");
%>