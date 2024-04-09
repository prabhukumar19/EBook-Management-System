package com.user.servlets;

import java.io.IOException;

import com.DAO.UserDAOImpl;
import com.DB.DBConnection;
import com.entity.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
			UserDAOImpl useDAO = new UserDAOImpl(DBConnection.getConnection());

			HttpSession session = request.getSession();

			String email = request.getParameter("email");
			String password = request.getParameter("password");

			System.out.println("Email :- " + email);
			System.out.println("Password :- " + password);

			if ("admin@gmail.com".equals(email) && "admin".equals(password)) {
				User adminUser = new User();
				adminUser.setName("Admin");
				session.setAttribute("user", adminUser);
				response.sendRedirect("admin/home.jsp");

			} else {
				User userLogin = useDAO.login(email, password);
				System.out.println(userLogin);
				
				if (userLogin != null) {
					session.setAttribute("user", userLogin);
					response.sendRedirect("home.jsp");
					System.out.println("Session object"+session.getAttribute("user"));
				} else {
					session.setAttribute("loginFailed", "Invalid email or Password");
					System.out.println("LoginFailed Message"+session.getAttribute("loginFailed"));
					response.sendRedirect("login.jsp");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			// TODO: handle exception
		}

	}

}
