package com.mycart.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.mycart.entities.User;

public class UserDao {
	private SessionFactory factory;

	public UserDao() {
		// TODO Auto-generated constructor stub
	}

	public UserDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	// get user by email and password
	public User getUserByEmailAndPassword(String email, String password) {
		User user = null;

		try {

			// HQL Query
			String query = "FROM User WHERE userEmail =: e AND userPassword =: p";

			Session session = this.factory.openSession();

			Query query2 = session.createQuery(query);

			query2.setParameter("e", email);
			query2.setParameter("p", password);

			user = (User) query2.uniqueResult();

			session.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return user;
	}

}
