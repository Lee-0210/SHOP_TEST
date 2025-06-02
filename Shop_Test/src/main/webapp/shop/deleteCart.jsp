<%@page import="shop.dto.Cart"%>
<%@page import="java.util.List"%>
<%@ include file="/layout/meta.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String delOneId = request.getParameter("id");
	String allDelOrder = request.getParameter("all");
	List<Cart> list = (List)session.getAttribute("cartList");
	
	// 상품 단일 삭제
	if(delOneId != null && list != null) {
		for(Cart cart : list){
			if(cart.getId().equals(delOneId)) {
				list.remove(cart);
				break;
			}
		}
	}
	
	// 상품 전체 삭제
	if(allDelOrder != null && list != null) {
		list.clear();
	}
	
	response.sendRedirect(root + "/shop/cart.jsp");
%>