<%@page import="shop.dao.ProductIORepository"%>
<%@page import="shop.dto.Product"%>
<%@page import="shop.dao.ProductRepository"%>
<%@page import="shop.dao.OrderRepository"%>
<%@page import="shop.dto.Cart"%>
<%@page import="java.util.List"%>
<%@page import="shop.dto.Ship"%>
<%@page import="java.util.UUID"%>
<%@page import="shop.dto.Order"%>
<%@ include file="/layout/meta.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
	List<Cart> list = (List)session.getAttribute("cartList");
	int cartSum = list != null ? list.stream().map(e -> e.getTotalPrice()).reduce(0, (a,b) -> a + b) : 0;
	Ship ship = (Ship)session.getAttribute("ship");
	String cartId = UUID.randomUUID().toString();
	
	OrderRepository orderRepository = new OrderRepository();
	ProductRepository productRepository = new ProductRepository();
	ProductIORepository productIoRepository = new ProductIORepository();
	
	Order order = null;
	String orderPw = request.getParameter("orderPw") != null ? request.getParameter("orderPw") : null;
	// 비회원일 경우
	if(orderPw != null && !orderPw.equals("")) {
		order = Order.builder().cartId(cartId)
							   .shipName(ship.getShipName())
							   .zipCode(ship.getZipCode())
							   .country(ship.getCountry())
							   .address(ship.getAddress())
							   .date(ship.getAddress())
							   .totalPrice(cartSum)
							   .phone(ship.getPhone())
							   .orderPw(orderPw)
							   .build();
							   
		orderRepository.insert(order);
		
		int orderNo = orderRepository.lastOrderNo(ship.getPhone(), orderPw);
		for(Cart cart : list) {
			Product product = Product.builder()
									 .productId(cart.getId())
									 .orderNo(orderNo)
									 .quantity(cart.getTotalUnit())
									 .type("출고") 
									 .userId((String)session.getAttribute("loginId"))
									 .build();
				
			productIoRepository.insert(product);
		}
	}
	// 회원일 경우
	else {
		order = Order.builder().cartId(cartId)
							   .shipName(ship.getShipName())
							   .zipCode(ship.getZipCode())
							   .country(ship.getCountry())
							   .address(ship.getAddress())
							   .date(ship.getAddress())
							   .totalPrice(cartSum)
							   .userId((String)session.getAttribute("loginId"))
							   .build();
		
		orderRepository.insert(order);
		
		int orderNo = orderRepository.lastOrderNo((String)session.getAttribute("loginId"));
		if(orderNo > 0) {		
			for(Cart cart : list) {
				Product product = Product.builder()
										 .productId(cart.getId())
										 .orderNo(orderNo)
										 .quantity(cart.getTotalUnit())
										 .type("출고") 
										 .userId((String)session.getAttribute("loginId"))
										 .build();
					
				productIoRepository.insert(product);
			}
		}
	}
	list.clear();
	
%>
<!DOCTYPE html>
<html>
<head>
	<title>project💻 - ALOHA CLASS🌴</title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
</head>
<body>
	<jsp:include page="/layout/header.jsp" />
	<%-- [Contents] ######################################################### --%>

	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">주문 완료</h1>
	</div>
	
	<!-- 주문 완료 확인 -->
	
	<div class="container order mb-5 p-5">
		
		<h2 class="text-center">주문이 완료되었습니다.</h2>
		<!-- 주문정보 -->
		<div class="ship-box">
			<table class="table ">
				<tbody><tr>
					<td>주문번호 :</td>
					<td><%=cartId %></td>
				</tr>
				<tr>
					<td>배송지 :</td>
					<td><%=ship.getAddress() %></td>
				</tr>
			</tbody></table>
			
			<div class="btn-box d-flex justify-content-center">
				<a href="<%=root %>/user/order.jsp" class="btn btn-primary btn-lg px-4 gap-3">주문내역</a>
			</div>
		</div>
	</div>
	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<!-- <script src="../static/js/validation.js"></script> -->			<!-- 상대경로 -->
	<!-- 절대경로 -->
<script src="/static/js/validation.js"></script>
	
	
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>