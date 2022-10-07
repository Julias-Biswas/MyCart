package com.mycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.mycart.entities.Category;

public class CategoryDao {
	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	// save category into database method
	public int saveCategory(Category category) {

		int categoryId = 0;

		try {

			Session session = this.factory.openSession();

			Transaction tx = session.beginTransaction();

			categoryId = (Integer) session.save(category);

			tx.commit();

			session.close();

			return categoryId;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return categoryId;
	}

	// get all category from database
	public List<Category> getAllCategory() {

		List<Category> list = null;

		try {

			Session session = this.factory.openSession();

			Query<Category> query = session.createQuery("from Category");

			list = query.list();

			session.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	//get particular category using category id
	public Category getCategoryById(int categoryId) {
		Category category = null;

		try {

			Session session = this.factory.openSession();

			category = session.get(Category.class, categoryId);

			session.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return category;
	}

}
