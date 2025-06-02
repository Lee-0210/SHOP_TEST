<%@page import="shop.dto.Product"%>
<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.util.ArrayList"%>
<%@page import="shop.dto.Cart"%>
<%@page import="java.util.List"%>
<%@ include file="/layout/meta.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ProductRepository productRepository = new ProductRepository(); 	// Dao
	String id = request.getParameter("id");							// 넘겨받은 id 파라미터
	System.out.println(id);
	Product product = productRepository.getProductById(id);			// 해당 id의 제품 DB 에서 꺼내기
	String name = product.getName();								// 해당 제품 이름
	int price = product.getUnitPrice();								// 해당 제품 가격
	List<Cart> list = (List)session.getAttribute("cartList");
	Cart newCart = Cart.builder().id(id).price(price).totalUnit(1).name(name).build();	
	
	boolean isExists = false;
	
	if(list == null) { 
		list = new ArrayList<>();
		list.add(newCart);
		session.setAttribute("cartList", list);
	} else {
		for(Cart item : list) {
			if(item.getId().equals(id)) {
				System.out.println("제품 수 증가");
				item.setTotalUnit(item.getTotalUnit() + 1);
				isExists = true;
			} 
		}
		if(!isExists) {
			System.out.println("장바구니 추가됨");
			list.add(newCart);
		}
	}
	
	response.sendRedirect(root + "/shop/products.jsp");
%>