package com.kh.fp.model.vo;

public class FoodCategory {
	
	private String title;
	private int star;
	private int reviewCount;
	private int deleveryMinCharge;
	private int deleveryTime;
	
	public FoodCategory() {
		// TODO Auto-generated constructor stub
	}

	public FoodCategory(String title, int star, int reviewCount, int deleveryMinCharge, int deleveryTime) {
		super();
		this.title = title;
		this.star = star;
		this.reviewCount = reviewCount;
		this.deleveryMinCharge = deleveryMinCharge;
		this.deleveryTime = deleveryTime;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public int getStar() {
		return star;
	}

	public void setStar(int star) {
		this.star = star;
	}

	public int getReviewCount() {
		return reviewCount;
	}

	public void setReviewCount(int reviewCount) {
		this.reviewCount = reviewCount;
	}

	public int getDeleveryMinCharge() {
		return deleveryMinCharge;
	}

	public void setDeleveryMinCharge(int deleveryMinCharge) {
		this.deleveryMinCharge = deleveryMinCharge;
	}

	public int getDeleveryTime() {
		return deleveryTime;
	}

	public void setDeleveryTime(int deleveryTime) {
		this.deleveryTime = deleveryTime;
	}

	@Override
	public String toString() {
		return "FoodCategory [title=" + title + ", star=" + star + ", reviewCount=" + reviewCount
				+ ", deleveryMinCharge=" + deleveryMinCharge + ", deleveryTime=" + deleveryTime + "]";
	}

	
	
	
}
