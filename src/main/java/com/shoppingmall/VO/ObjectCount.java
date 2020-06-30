package com.shoppingmall.VO;

import org.springframework.stereotype.Component;

@Component
public class ObjectCount {
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public int getGdsNum() {
		return gdsNum;
	}
	public void setGdsNum(int gdsNum) {
		this.gdsNum = gdsNum;
	}

	int amount;
	int gdsNum;
	int cateCode1;
	public int getCateCode1() {
		return cateCode1;
	}
	public void setCateCode1(int cateCode1) {
		this.cateCode1 = cateCode1;
	}
}
