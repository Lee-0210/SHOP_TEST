package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import shop.dto.Product;

public class ProductRepository extends JDBConnection {
	
	/**
	 * 상품 목록
	 * @return
	 */
	public List<Product> list() {
		List<Product> list = new ArrayList<>();
		String sql = "SELECT * FROM product";
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				Product product = Product.builder()
										 .productId(rs.getString(1))
										 .name(rs.getString(2))
										 .unitPrice(rs.getInt(3))
										 .description(rs.getString(4))
										 .manufacturer(rs.getString(5))
										 .category(rs.getString(6))
										 .unitsInStock(rs.getLong(7))
										 .condition(rs.getString(8))
										 .file(rs.getString(9))
										 .quantity(rs.getInt(10))
										 .build();
				list.add(product);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	/**
	 * 상품 목록 검색
	 * @param keyword
	 * @return
	 */
	public List<Product> list(String keyword) {
		List<Product> list = new ArrayList<>();
		String sql = "SELECT * FROM product "
				   + "WHERE name LIKE ? OR description LIKE ? OR manufacturer LIKE ? "
				   + "OR category LIKE ?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, "%" + keyword + "%");
			psmt.setString(2, "%" + keyword + "%");
			psmt.setString(3, "%" + keyword + "%");
			psmt.setString(4, "%" + keyword + "%");
			
			rs = psmt.executeQuery();
			
			while(rs.next()) {
				Product product = Product.builder()
										 .productId(rs.getString(1))
										 .name(rs.getString(2))
										 .unitPrice(rs.getInt(3))
										 .description(rs.getString(4))
										 .manufacturer(rs.getString(5))
										 .category(rs.getString(6))
										 .unitsInStock(rs.getLong(7))
										 .condition(rs.getString(8))
										 .file(rs.getString(9))
										 .quantity(rs.getInt(10))
										 .build();
				list.add(product);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	/**
	 * 상품 조회
	 * @param productId
	 * @return
	 */
	public Product getProductById(String productId) {
		Product product = null;
		String sql = "SELECT * FROM product WHERE product_id = ?"; 
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, productId);
			
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				product = Product.builder()
								 .productId(rs.getString(1))
								 .name(rs.getString(2))
								 .unitPrice(rs.getInt(3))
								 .description(rs.getString(4))
								 .manufacturer(rs.getString(5))
								 .category(rs.getString(6))
								 .unitsInStock(rs.getLong(7))
								 .condition(rs.getString(8))
								 .file(rs.getString(9))
								 .quantity(rs.getInt(10))
								 .build();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return product;
	}
	
	
	/**
	 * 상품 등록
	 * @param product
	 * @return
	 */
	public int insert(Product product) {
		
	}
	
	
	/**
	 * 상품 수정
	 * @param product
	 * @return
	 */
	public int update(Product product) {
		
	}
	
	
	
	/**
	 * 상품 삭제
	 * @param product
	 * @return
	 */
	public int delete(String productId) {
		
	}

}





























