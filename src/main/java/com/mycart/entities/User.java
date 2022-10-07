package com.mycart.entities;

import java.util.Random;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user")
public class User {
	@Id
	private int userId;
	@Column(length = 255, nullable = false)
	private String userName;
	@Column(length = 255, nullable = false, unique = true)
	private String userEmail;
	@Column(length = 100, nullable = false)
	private String userPassword;
	@Column(length = 10, nullable = false)
	private String userPhone;
	@Column(length = 3000)
	private String userPic;
	@Column(length = 12000)
	private String userAddress;
	@Column(length = 255, nullable = false)
	private String userType;

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String userName, String userEmail, String userPassword, String userPhone, String userPic,
			String userAddress, String userType) {
		super();
		this.userId = new Random().nextInt(1999999999);
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userPic = userPic;
		this.userAddress = userAddress;
		this.userType = userType;
	}

	public User(int userId, String userName, String userEmail, String userPassword, String userPhone, String userPic,
			String userAddress, String userType) {
		super();
		this.userId = new Random().nextInt(1999999999);
		this.userName = userName;
		this.userEmail = userEmail;
		this.userPassword = userPassword;
		this.userPhone = userPhone;
		this.userPic = userPic;
		this.userAddress = userAddress;
		this.userType = userType;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserPic() {
		return userPic;
	}

	public void setUserPic(String userPic) {
		this.userPic = userPic;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword="
				+ userPassword + ", userPhone=" + userPhone + ", userPic=" + userPic + ", userAddress=" + userAddress
				+ ", userType=" + userType +"]";
	}

}
