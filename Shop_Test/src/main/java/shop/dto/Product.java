package shop.dto;

import java.io.Serializable;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * Product 자바빈즈
 * - 상품 아이디
 * - 상품 명
 * - 상품 가격
 * - 상품 설명
 * - 제조사
 * - 분류
 * - 재고 수
 * - 상태(condition)
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String productId;		// 상품ID
	private String name;			// 상품명
	private Integer unitPrice;		// 가격(단가)
	private String description;		// 설명
	private String manufacturer;	// 제조 업체
	private String category;		// 카테고리
	private long unitsInStock;		// 재고 수
	private String condition;		// 상태
	private String file;			// 파일 경로 변수 추가
	private int quantity;			// 장바구니 개수 

	// 
	private String userId;			// 회원ID
	private int orderNo;			// 주문번호
	private String type;			// 입출고 타입
	
}
