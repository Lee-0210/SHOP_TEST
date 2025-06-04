<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="shop.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/layout/meta.jsp"%>
<!DOCTYPE html>
<%
	ProductRepository productRepository = new ProductRepository();
	List<Product> list = productRepository.list();
	String id = request.getParameter("id");
	int result = productRepository.delete(id);
	
	if(result != 0) {
		System.out.println("상품 삭제 완료!");
		response.sendRedirect(root + "/shop/editProducts.jsp");
	}
	else {
		response.getWriter().println("<script>alert('상품 삭제 실패');<script>");
		request.getRequestDispatcher(root + "/shop/products.jsp").forward(request, response);
	}

%>