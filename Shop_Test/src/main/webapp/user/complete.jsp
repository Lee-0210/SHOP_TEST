<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Shop</title>
	<jsp:include page="/layout/meta.jsp" /> <jsp:include page="/layout/link.jsp" />
</head>
<body>   
	<% String root = request.getContextPath(); %>
	<% int msg = Integer.parseInt(request.getParameter("msg")); %>
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">
			<%= msg == 2 ? "회원 정보가 수정되었습니다." : msg == 3 ? "회원 정보가 삭제되었습니다." : "" %>
		</h1>
		
	</div>
	<!-- 회원 가입/수정/탈퇴 완료 -->
	<div class="container mb-5" style="display: flex; justify-content: center;">
		<a class="btn btn-primary" href="<%=root%>/user/index.jsp">메인 화면</a>
	</div>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>







