<%@page import="shop.dto.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/layout/meta.jsp"%>
<%
	List<Cart> list = (List)session.getAttribute("cartList");
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
		<h1 class="display-5 fw-bold text-body-emphasis">장바구니</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">장바구니 목록 입니다.</p>
		</div>
	</div>

	<!-- 장바구니 영역 -->
	<div class="container order">
		<!-- 장바구니 목록 -->
		<table
			class="table table-striped table-hover table-bordered text-center align-middle">
			<thead>
				<tr class="table-primary">
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
			<% if(list != null ) {
				for(Cart cart : list) {%>
			
				<tr>
					<td><%=cart.getName() %></td>			
					<td><%=cart.getPrice() %></td>			
					<td><%=cart.getTotalUnit() %></td>			
					<td><%=cart.getTotalPrice() %></td>			
					<td><a href="deleteCart.jsp?id=<%=cart.getId() %>" class="btn btn-sm btn-danger">삭제</a></td>			
				</tr>
			<%
				}
			}
			%>
			</tbody>
			<%if(list == null || list.size() == 0) {%>
			<tfoot>
				<tr>
					<td colspan="5">추가된 상품이 없습니다.</td>
				</tr>
			</tfoot>
			<%}%>
		</table>

		<!-- 버튼 영역 -->
		<div class="d-flex justify-content-between align-items-center p-3">
			<a href="deleteCart.jsp?all=1"
				class="btn btn-lg btn-danger ">전체삭제</a> <a href="javascript:;"
				class="btn btn-lg btn-primary" onclick="order()">주문하기</a>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<!-- <script src="../static/js/validation.js"></script> -->
	<!-- 상대경로 -->
	<!-- 절대경로 -->
	<script src="/static/js/validation.js"></script>






	<script>
		let cartId = 'E9F03E624FF6F050C72CBB067E2F4BB7'
		let cartCount = '0'
		let cartSum = document.getElementById('cart-sum')
		
		function order() {
			if( cartCount == 0 ) {
				alert('장바구니에 담긴 상품이 없습니다.')
				return
			}
			let msg = '총 ' + cartCount + '개의 상품을 주문합니다. \n총 주문금액 : ' + cartSum.textContent
			let check = confirm(msg)
			if( check ) {
				location.href = 'ship.jsp?cartId=' + cartId
			}
		}
		
		// 단일 삭제 요청
		function delOne() {
			
		}
		
		// 전체 삭제 요청
		
	
	</script>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>