package com.user.servlets;

import java.io.IOException;
import jakarta.servlet.http.*;

import com.DAO.UserDAOImpl;
import com.DB.DBConnection;
import com.entity.User;

import jakarta.servlet.annotation.WebServlet;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		try {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String contact_number = request.getParameter("contact");
			String password = request.getParameter("password");
			String check = request.getParameter("check_condition");

			User user = new User();
			user.setName(name);
			user.setEmail(email);
			user.setContact_number(contact_number);
			user.setPassword(password);

			HttpSession session = request.getSession();

			if (check != null) {
				UserDAOImpl userDAOImpl = new UserDAOImpl(DBConnection.getConnection());
				boolean res = userDAOImpl.userRegister(user);
				System.out.println("Response:- "+res);
				if (res) {
					session.setAttribute("success_message", "User Registered!");
					response.sendRedirect("register.jsp");

				} else {
					session.setAttribute("failed_message", "Something went wrong!");
					response.sendRedirect("register.jsp");
				}
			} else {
				session.setAttribute("failed_message", "Please accept terms and condition");
//				System.out.println("Please accept terms and condition");
				response.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}
	}

}
