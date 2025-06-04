package shop.dao;

import java.util.ArrayList;
import java.util.List;

import shop.dto.Order;
import shop.dto.Product;

public class OrderRepository extends JDBConnection {
	
	/**
	 * 주문 등록
	 * @param user
	 * @return
	 */
	public int insert(Order order) {
		String sql = "INSERT INTO `order` (ship_name, zip_code, country, address, date, order_pw, user_id, total_price, phone) "
				       + "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		int result = 0;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, order.getShipName());
			psmt.setString(2, order.getZipCode());
			psmt.setString(3, order.getCountry());
			psmt.setString(4, order.getAddress());
			psmt.setString(5, order.getDate());
			psmt.setString(6, order.getOrderPw());
			psmt.setString(7, order.getUserId());
			psmt.setInt(8, order.getTotalPrice());
			psmt.setString(9, order.getPhone());
			
			result = psmt.executeUpdate();
			
			System.out.println("주문 처리됨.");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	/**
	 * 최근 등록한 orderNo 
	 * @return
	 */
	public int lastOrderNo(String userId) {
		String sql = "SELECT order_no FROM `order`"
					     + "WHERE user_id = ? "
					     + "ORDER BY order_no DESC LIMIT 1";
		int orderNo = 0;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				orderNo = rs.getInt("order_no");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return orderNo;
	}
	
	public int lastOrderNo(String phone, String password) {
		String sql = "SELECT order_no FROM `order` "
					     + "WHERE phone = ? AND order_pw = ? "
					     + "ORDER BY order_no DESC LIMIT 1";
		int orderNo = 0;
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, phone);
			psmt.setString(2, password);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				orderNo = rs.getInt("order_no");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return orderNo;
	}

	
	/**
	 * 주문 내역 조회 - 회원
	 * @param userId
	 * @return
	 */
	public List<Product> list(String userId) {
		List<Product> list = new ArrayList<>();
		String sql = "SELECT pi.order_no, pi.product_id, p.name, pi.amount, " 
				       + "pi.amount * p.unit_price AS total_price " 
				       + "FROM product_io pi " 
				       + "INNER JOIN product p ON p.product_id = pi.product_id " 
				       + "WHERE order_no IN ( " 
				       + "SELECT order_no FROM `order` " 
				       + "WHERE user_id = ?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, userId);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				Product product = Product.builder()
													       .orderNo(rs.getInt(1))
													       .productId(rs.getString(2))
													       .name(rs.getString(3))
													       .quantity(rs.getInt(4))
													       .unitPrice(rs.getInt(5))
													       .build();
				
				list.add(product);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * 주문 내역 조회 - 비회원
	 * @param phone
	 * @param orderPw
	 * @return
	 */
	public List<Product> list(String phone, String orderPw) {
		List<Product> list = new ArrayList<>();
		String sql = "SELECT pi.order_no, pi.product_id, p.name, pi.amount, " 
				       + "pi.amount * p.unit_price AS total_price " 
				       + "FROM product_io pi " 
				       + "INNER JOIN product p ON p.product_id = pi.product_id " 
				       + "WHERE order_no IN ( " 
				       + "SELECT order_no FROM `order` " 
				       + "WHERE phone = ? AND order_pw = ?)";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, phone);
			psmt.setString(2, orderPw);
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				Product product = Product.builder()
													       .orderNo(rs.getInt(1))
													       .productId(rs.getString(2))
													       .name(rs.getString(3))
													       .quantity(rs.getInt(4))
													       .unitPrice(rs.getInt(5))
													       .build();
				
				list.add(product);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}






























