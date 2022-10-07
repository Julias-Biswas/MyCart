package com.mycart.entities;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {
	@Id
	// @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int categoryId;
	@Column(length = 255, nullable = false, unique = true)
	private String categoryTitle;
	@Column(length = 12000)
	private String categoryDescription;
	
	@OneToMany(mappedBy = "category")
	@Column(nullable = false)
	private List<Product> products = new ArrayList<Product>();

	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Category(String categoryTitle, String categoryDescription) {
		super();
		this.categoryId = new Random().nextInt(1999999999);
		this.categoryTitle = categoryTitle;
		this.categoryDescription = categoryDescription;
	}

	public Category(String categoryTitle, String categoryDescription, List<Product> products) {
		super();
		this.categoryId = new Random().nextInt(1999999999);
		this.categoryTitle = categoryTitle;
		this.categoryDescription = categoryDescription;
		this.products = products;
	}

	public Category(int categoryId, String categoryTitle, String categoryDescription, List<Product> products) {
		super();
		this.categoryId = new Random().nextInt(1999999999);
		this.categoryTitle = categoryTitle;
		this.categoryDescription = categoryDescription;
		this.products = products;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryTitle() {
		return categoryTitle;
	}

	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}

	public String getCategoryDescription() {
		return categoryDescription;
	}

	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	@Override
	public String toString() {
		return "Category [categoryId=" + categoryId + ", categoryTitle=" + categoryTitle + ", categoryDescription="
				+ categoryDescription + "]";
	}

}
