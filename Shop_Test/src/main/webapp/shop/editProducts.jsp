<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/layout/meta.jsp"%>
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
	<nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary"
		data-bs-theme="dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="/">Home</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="/shop/products.jsp">Product</a></li>
				</ul>
				<ul class="navbar-nav d-flex align-items-center px-3">

					<!-- 비로그인 시 -->
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="/user/login.jsp">로그인</a></li>
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="/user/join.jsp">회원가입</a></li>
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="/user/order.jsp">주문내역</a></li>

					<li class="nav-item"><a class="nav-link position-relative"
						aria-current="page" href="/shop/cart.jsp"> <i
							class="material-symbols-outlined">shopping_bag</i> <span
							class="cart-count">0</span>
					</a></li>
				</ul>
				<form class="d-flex" role="search" action="/shop/products.jsp"
					method="get">
					<input class="form-control me-2" type="search" name="keyword"
						placeholder="Search" aria-label="Search" value="">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</div>
	</nav>





	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">상품 편집</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">쇼핑몰 상품 목록 입니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">

				<a href="add.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품
					등록</a>
				<!-- [NEW] 상품 편집 버튼 추가 -->
				<a href="products.jsp" class="btn btn-success btn-lg px-4 gap-3">상품
					목록</a>

			</div>
		</div>
	</div>

	<div class="container mb-5">
		<div class="row gy-4">

			<div class="col-md-6 col-xl-4 col-xxl-3">
				<div class="card p-3">
					<!-- 이미지 영역 -->
					<div class="img-content">
						<img src="img?id=P100001" class="w-100 p-2">
					</div>
					<!-- 컨텐츠 영역 -->
					<div class="content">
						<h3 class="text-center">자바 프로그래밍</h3>
						<p>안녕하세요 자바프로그래밍 강의입니다.</p>
						<p class="text-end price">₩ 50000</p>
						<p class="d-flex justify-content-end">
							<!-- [NEW] 수정 버튼으로 변경 -->
							<a href="./update.jsp?id=P100001" class="btn btn-primary mx-2">수정</a>
							<!-- [NEW] 삭제 버튼 추가 -->

							<a href="javascript:;" class="btn btn-danger mx-2"
								onclick="deleteProduct('P100001')">삭제</a>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-xl-4 col-xxl-3">
				<div class="card p-3">
					<!-- 이미지 영역 -->
					<div class="img-content">
						<img src="img?id=P100002" class="w-100 p-2">
					</div>
					<!-- 컨텐츠 영역 -->
					<div class="content">
						<h3 class="text-center">오라클 데이터베이스</h3>
						<p>오라클 데이터베이스 입니다.</p>
						<p class="text-end price">₩ 20000</p>
						<p class="d-flex justify-content-end">
							<!-- [NEW] 수정 버튼으로 변경 -->
							<a href="./update.jsp?id=P100002" class="btn btn-primary mx-2">수정</a>
							<!-- [NEW] 삭제 버튼 추가 -->

							<a href="javascript:;" class="btn btn-danger mx-2"
								onclick="deleteProduct('P100002')">삭제</a>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-xl-4 col-xxl-3">
				<div class="card p-3">
					<!-- 이미지 영역 -->
					<div class="img-content">
						<img src="img?id=P100003" class="w-100 p-2">
					</div>
					<!-- 컨텐츠 영역 -->
					<div class="content">
						<h3 class="text-center">HTML CSS JAVASCRIPT</h3>
						<p>웹 기초 강의입니다.</p>
						<p class="text-end price">₩ 15000</p>
						<p class="d-flex justify-content-end">
							<!-- [NEW] 수정 버튼으로 변경 -->
							<a href="./update.jsp?id=P100003" class="btn btn-primary mx-2">수정</a>
							<!-- [NEW] 삭제 버튼 추가 -->

							<a href="javascript:;" class="btn btn-danger mx-2"
								onclick="deleteProduct('P100003')">삭제</a>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-xl-4 col-xxl-3">
				<div class="card p-3">
					<!-- 이미지 영역 -->
					<div class="img-content">
						<img src="img?id=P100004" class="w-100 p-2">
					</div>
					<!-- 컨텐츠 영역 -->
					<div class="content">
						<h3 class="text-center">JSP</h3>
						<p>JSP 강의입니다.</p>
						<p class="text-end price">₩ 80000</p>
						<p class="d-flex justify-content-end">
							<!-- [NEW] 수정 버튼으로 변경 -->
							<a href="./update.jsp?id=P100004" class="btn btn-primary mx-2">수정</a>
							<!-- [NEW] 삭제 버튼 추가 -->

							<a href="javascript:;" class="btn btn-danger mx-2"
								onclick="deleteProduct('P100004')">삭제</a>
						</p>
					</div>
				</div>
			</div>

			<div class="col-md-6 col-xl-4 col-xxl-3">
				<div class="card p-3">
					<!-- 이미지 영역 -->
					<div class="img-content">
						<img src="img?id=P123123" class="w-100 p-2">
					</div>
					<!-- 컨텐츠 영역 -->
					<div class="content">
						<h3 class="text-center">고지민</h3>
						<p>고지민</p>
						<p class="text-end price">₩ 2000000</p>
						<p class="d-flex justify-content-end">
							<!-- [NEW] 수정 버튼으로 변경 -->
							<a href="./update.jsp?id=P123123" class="btn btn-primary mx-2">수정</a>
							<!-- [NEW] 삭제 버튼 추가 -->

							<a href="javascript:;" class="btn btn-danger mx-2"
								onclick="deleteProduct('P123123')">삭제</a>
						</p>
					</div>
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
		function deleteProduct(productId) {
			// alert(productId)
			let check = confirm('정말로 삭제하시겠습니까?')
			if (check) {
				location.href = 'delete_pro.jsp?id=' + productId
			}
		}
	</script>

	<%-- [Contents] ######################################################### --%>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>