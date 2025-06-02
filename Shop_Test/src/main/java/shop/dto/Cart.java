package shop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Cart {

	private String id;
	private int price;
	private int totalUnit;
	private int totalPrice;
	
	public int getTotalPrice() {
		return price * totalUnit;
	}
}
