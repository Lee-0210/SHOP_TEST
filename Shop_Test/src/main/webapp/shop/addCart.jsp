<%@page import="shop.dto.Product"%>
<%@page import="shop.dao.ProductRepository"%>
<%@page import="shop.dto.Cart"%>
<%
	ProductRepository productRepository = new ProductRepository();
	String id = request.getParameter("id");
	Product product = productRepository.getProductById(id);
	int price = product.getUnitPrice();
	
	Cart cart = Cart.builder().id(id).price(price).totalUnit(1).build();	
	
	if(session.getAttribute(id) == null) {
		session.setAttribute(id, cart);
	} else {
		Cart originCart = (Cart)session.getAttribute(id);
		originCart.setTotalUnit(originCart.getTotalUnit() + 1);
	}
	
	request.getRequestDispatcher("/shop/product.jsp?id=" + id).forward(request, response);
%>