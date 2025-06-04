package shop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 주문 데이터
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Order {

	private int orderNo;
	private String cartId;
	private String shipName;
	private String zipCode;
	private String country;
	private String address;
	private String date;
	private String userId;
	private int totalPrice;
	private String phone;
	private String orderPw;
}
