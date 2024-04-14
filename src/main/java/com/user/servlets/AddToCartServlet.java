package com.user.servlets;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnection;
import com.entity.Book;
import com.entity.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class AddToCartServlet
 */
@WebServlet("/cart")
public class AddToCartServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			int bookId = Integer.parseInt(request.getParameter("bookId"));
			int userId = Integer.parseInt(request.getParameter("userId"));

			BookDAOImpl dao = new BookDAOImpl(DBConnection.getConnection());
			Book book = dao.getBookById(bookId);

			Cart cart = new Cart();
			cart.setBookId(bookId);
			cart.setUserId(userId);
			cart.setBookName(book.getName());
			cart.setAuthor(book.getAuthor_name());
			cart.setPrice(Double.parseDouble(book.getPrice()));
			cart.setTotalPrice(Double.parseDouble(book.getPrice()));

			CartDAOImpl dao2 = new CartDAOImpl(DBConnection.getConnection());
			boolean res = dao2.addToCart(cart);
			HttpSession session = request.getSession();
			if (book.getCategory().equals("old")) {
				response.sendRedirect("book_details.jsp?id=" + book.getId());
			}
			if (res) {
				System.out.println("Added to Cart");
				session.setAttribute("cart_success", "Book added to cart!");
				response.sendRedirect("all_books.jsp");
			} else {
				System.out.println("Something went wrong! Find out what?");
				session.setAttribute("cart_failed", "Something went wrong!");
				response.sendRedirect("all_books.jsp");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

	}

}
