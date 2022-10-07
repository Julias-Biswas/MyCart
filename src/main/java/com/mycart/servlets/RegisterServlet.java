package com.mycart.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.mycart.entities.User;
import com.mycart.helper.FactoryProvider;

/**
 * Servlet implementation class RegisterServlet
 */
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RegisterServlet() {
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

			//PrintWriter out = response.getWriter();

			String userName = request.getParameter("userName");
			String userEmail = request.getParameter("userEmail");
			String userPassword = request.getParameter("userPassword");
			String userPhone = request.getParameter("userPhone");
			String userAddress = request.getParameter("userAddress");

			// out.print(userName+"\n"+userEmail+"\n"+userPassword+"\n"+userPhone+"\n"+userAddress);

			// Creating User object to store data
			User user = new User(userName, userEmail, userPassword, userPhone, "default.png", userAddress, "normal");

			// Creating session object
			Session session = FactoryProvider.getFactory().openSession();

			// Creating transaction object
			Transaction tx = session.beginTransaction();

			int userId = (Integer) session.save(user);

			tx.commit();

			session.close();

			// out.print("Successfully Saved!!!");
			// out.print("\n"+"User Id is : "+userId);

			HttpSession httpSession = request.getSession();

			httpSession.setAttribute("message", "User Registration Successfully !! User id is " + userId);

			response.sendRedirect("reg");

			return;

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();

			HttpSession httpSession = request.getSession();

			httpSession.setAttribute("error", "Email is already exists !! Please try with different");

			response.sendRedirect("reg");
			
			return;
		}

	}

}
