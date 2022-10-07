package com.mycart.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.mycart.entities.Product;

public class ProductDao {
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	// save product into database
	public boolean saveProduct(Product product) {
		boolean status = false;

		try {

			Session session = this.factory.openSession();

			Transaction tx = session.beginTransaction();

			session.save(product);

			tx.commit();

			session.close();

			status = true;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

			status = false;
		}

		return status;
	}

	// get all products
	public List<Product> getAllProducts() {
		List<Product> list = null;

		try {

			Session session = this.factory.openSession();

			Query<Product> query = session.createQuery("from Product");

			list = query.list();

			session.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;
	}

	// get all products of given category id and category name
	public List<Product> getProductByCategoryIdAndName(int categoryId, String categoryName) {

		List<Product> list = null;

		try {

			Session session = this.factory.openSession();

			Query<Product> query = session.createQuery(
					"from Product as p where p.category.categoryId =: id and p.category.categoryTitle =: name");

			query.setParameter("id", categoryId);
			query.setParameter("name", categoryName);

			list = query.list();

			session.close();

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return list;

	}

}
