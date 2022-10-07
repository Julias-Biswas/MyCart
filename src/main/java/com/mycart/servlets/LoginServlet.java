package com.mycart.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mycart.dao.UserDao;
import com.mycart.entities.User;
import com.mycart.helper.FactoryProvider;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
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

			String userEmail = request.getParameter("userEmail");
			String userPassword = request.getParameter("userPassword");

			// validation

			// authentication user
			UserDao userDao = new UserDao(FactoryProvider.getFactory());

			User user = userDao.getUserByEmailAndPassword(userEmail, userPassword);

			// out.print(user);

			if (user == null) {
				HttpSession httpSession = request.getSession();

				httpSession.setAttribute("error", "Email & Password are invalid !!");

				response.sendRedirect("login");

				return;
			} else {
				//out.print(user.getUserType());

				// set user details into session
				HttpSession httpSession = request.getSession();

				httpSession.setAttribute("current-user", user);

				if (user.getUserType().equals("admin")) {
					// for admin
					response.sendRedirect("seller-profile");
				} else if (user.getUserType().equals("normal")) {
					// for normal
					response.sendRedirect("user-profile");
				} else {

					httpSession.setAttribute("error", "We have not identified user type !!");

					response.sendRedirect("login");

					return;
				}

			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}
