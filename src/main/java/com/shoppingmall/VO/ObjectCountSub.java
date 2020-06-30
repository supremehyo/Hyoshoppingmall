package com.shoppingmall.VO;

import org.springframework.stereotype.Component;

@Component
public class ObjectCountSub {

	// 동적쿼리를 사용할때 파라미터로 들어가는 클래스에서 getter 로
	//동적쿼리에 들어가는 변수를 뽑아오기 때문에
	// 카테고리 코드만 필요해서 만들어줬다.
	int cateCode1;
	public int getCateCode1() {
		return cateCode1;
	}
	public void setCateCode1(int cateCode1) {
		this.cateCode1 = cateCode1;
	}
}
