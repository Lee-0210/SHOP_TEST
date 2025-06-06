<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="shop.dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/layout/meta.jsp"%>
<%
	ProductRepository productRepository = new ProductRepository();
	Product product = productRepository.getProductById(request.getParameter("id"));
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
		<h1 class="display-5 fw-bold text-body-emphasis">상품 정보</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Shop 쇼핑몰 입니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<a href="./products.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품목록</a>
			</div>
		</div>
	</div>

	<!-- 상품 정보 영역 -->

	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<!-- [NEW] 썸네일 이미지 요청하기 추가 -->
				<img src="img?id=<%=product.getProductId() %>" class="w-100 p-2">
			</div>
			<div class="col-md-6">
				<h3 class="mb-5"><%=product.getName() %></h3>
				<table class="table">
					<colgroup>
						<col width="120px">
						<col>
					</colgroup>
					<tbody>
						<tr>
							<td>상품ID :</td>
							<td><%=product.getProductId() %></td>
						</tr>
						<tr>
							<td>제조사 :</td>
							<td><%=product.getManufacturer() %></td>
						</tr>
						<tr>
							<td>분류 :</td>
							<td><%=product.getCategory() %></td>
						</tr>
						<tr>
							<td>상태 :</td>
							<td><%=product.getCondition() %></td>
						</tr>
						<tr>
							<td>재고 수 :</td>
							<td><%=product.getUnitsInStock() %></td>
						</tr>
						<tr>
							<td>가격 :</td>
							<td><%=product.getUnitPrice() %></td>
						</tr>
					</tbody>
				</table>
				<div class="mt-4">
					<form name="addForm" action="<%=root %>/shop/addCart.jsp" method="post">
						<input type="hidden" name="id" value="<%= product.getProductId()%>">
						<div class="btn-box d-flex justify-content-end ">
							<!-- [NEW] 장바구니 버튼 추가 -->
							<a href="./cart.jsp" class="btn btn-lg btn-warning mx-3">장바구니</a>

							<!-- 페이지 이동 막기 :  href="javascript:;" -->
							<a href="javascript:;" class="btn btn-lg btn-success mx-3"
								onclick="addToCart()">주문하기</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>



	<footer class="container p-5">
		<p class="text-center">Copyright ⓒ ALOHA CLASS. All Rights
			Reserved</p>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
		crossorigin="anonymous"></script>
	<!-- <script src="../static/js/validation.js"></script> -->
	<!-- 상대경로 -->
	<!-- 절대경로 -->
	<script src="/static/js/validation.js"></script>





	<script>
		// 장바구니 추가
		function addToCart() {
			if (confirm("상품을 장바구니에 추가하시겠습니까?")) {
				document.addForm.submit()
			} else {
				document.addForm.reset()
			}
		}
	</script>
	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>