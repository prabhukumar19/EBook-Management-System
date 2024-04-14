package com.user.servlets;

import java.io.IOException;

import com.DAO.CartDAOImpl;
import com.DB.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class RemoveCartServlet
 */
@WebServlet("/remove")
public class RemoveCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		int bookId = Integer.parseInt(request.getParameter("bookId"));
		System.out.println(bookId);
		
		CartDAOImpl cartDao= new CartDAOImpl(DBConnection.getConnection());
		boolean res = cartDao.deleteBook(bookId);
		HttpSession session = request.getSession();
		if(res) {
			session.setAttribute("cart_removed","Removed from Cart");
			response.sendRedirect("checkout.jsp");
		}else {
			session.setAttribute("cart_failed","Something went wrong!");
			response.sendRedirect("checkout.jsp");
		}
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	}
}
