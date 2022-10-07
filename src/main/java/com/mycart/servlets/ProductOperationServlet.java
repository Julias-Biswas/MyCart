package com.mycart.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mycart.dao.CategoryDao;
import com.mycart.dao.ProductDao;
import com.mycart.entities.Category;
import com.mycart.entities.Product;
import com.mycart.helper.FactoryProvider;

/**
 * Servlet implementation class ProductOperationServlet
 */
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductOperationServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {

			PrintWriter out = response.getWriter();

			String operationName = request.getParameter("operationName");

			if (operationName.trim().equals("AddCategory")) {

				// Add Category
				String categoryTitle = request.getParameter("categoryTitle");
				String categoryDescription = request.getParameter("categoryDescription");

				// Category class object
				Category category = new Category(categoryTitle, categoryDescription);

				// category save into database
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());

				int categoryId = categoryDao.saveCategory(category);

				HttpSession httpSession = request.getSession();

				httpSession.setAttribute("message", "Category added successfully !! Category id is " + categoryId);

				response.sendRedirect("seller-profile");

				return;

			} else if (operationName.trim().equals("AddProduct")) {

				// Add Product
				String productTitle = request.getParameter("productTitle");
				String productDescription = request.getParameter("productDescription");
				Double productPrice = Double.parseDouble(request.getParameter("productPrice"));
				int productDiscount = Integer.parseInt(request.getParameter("productDiscount"));
				int productQuantity = Integer.parseInt(request.getParameter("productQuantity"));
				int productCategoryId = Integer.parseInt(request.getParameter("productCategoryId"));

				Part part = request.getPart("productImage");
				String fileName = part.getSubmittedFileName();

				// get category id
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());

				Category category = categoryDao.getCategoryById(productCategoryId);

				Product product = new Product(productTitle, productDescription, fileName, productPrice, productDiscount,
						productQuantity, category);

				// save product into database
				ProductDao productDao = new ProductDao(FactoryProvider.getFactory());

				productDao.saveProduct(product);

				// Product image upload in folder
				// find out the path to upload photo
				String path = request.getServletContext()
						.getRealPath("img" + File.separator + "products" + File.separator + fileName);

				//System.out.println("\n\n\n\n\nImage Path is : " + path+"\n\n\n\n\n");

				try {

					// upload image on server
					FileOutputStream fos = new FileOutputStream(path);

					InputStream is = part.getInputStream();
					
					// reading data
					byte[] data = new byte[is.available()];

					is.read(data);

					// writing data
					fos.write(data);

					is.close();
					fos.close();

				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}

				HttpSession httpSession = request.getSession();

				httpSession.setAttribute("message", "Product added successfully !!");

				response.sendRedirect("seller-profile");

				return;

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

		}

	}

}
