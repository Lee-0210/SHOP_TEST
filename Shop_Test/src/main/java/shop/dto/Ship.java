package shop.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Ship {
	
	private String cartId;
	private String shipName;
	private String date;
	private String country;
	private String zipCode;
	private String address;
	private String phone;
	
}
