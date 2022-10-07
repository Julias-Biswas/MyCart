package com.mycart.entities;

import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product {
	@Id
	// @GeneratedValue(strategy = GenerationType.IDENTITY)
	private int productId;
	@Column(length = 3000, nullable = false)
	private String productName;
	@Column(length = 12000)
	private String productDescription;
	@Column(nullable = false)
	private String productPhoto;
	@Column(nullable = false)
	private Double productPrice;
	@Column(nullable = false)
	private int productDiscount;
	@Column(nullable = false)
	private int productQuantity;

	@ManyToOne
	private Category category;

	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(String productName, String productDescription, String productPhoto, Double productPrice,
			int productDiscount, int productQuantity, Category category) {
		super();
		this.productId = new Random().nextInt(1999999999);
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPhoto = productPhoto;
		this.productPrice = productPrice;
		this.productDiscount = productDiscount;
		this.productQuantity = productQuantity;
		this.category = category;
	}

	public Product(int productId, String productName, String productDescription, String productPhoto,
			Double productPrice, int productDiscount, int productQuantity, Category category) {
		super();
		this.productId = new Random().nextInt(1999999999);
		this.productName = productName;
		this.productDescription = productDescription;
		this.productPhoto = productPhoto;
		this.productPrice = productPrice;
		this.productDiscount = productDiscount;
		this.productQuantity = productQuantity;
		this.category = category;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getProductPhoto() {
		return productPhoto;
	}

	public void setProductPhoto(String productPhoto) {
		this.productPhoto = productPhoto;
	}

	public Double getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(Double productPrice) {
		this.productPrice = productPrice;
	}

	public int getProductDiscount() {
		return productDiscount;
	}

	public void setProductDiscount(int productDiscount) {
		this.productDiscount = productDiscount;
	}

	public int getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Product [productId=" + productId + ", productName=" + productName + ", productDescription="
				+ productDescription + ", productPhoto=" + productPhoto + ", productPrice=" + productPrice
				+ ", productDiscount=" + productDiscount + ", productQuantity=" + productQuantity + "]";
	}

}
