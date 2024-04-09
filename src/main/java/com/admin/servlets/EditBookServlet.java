package com.admin.servlets;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnection;
import com.entity.Book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class EditBookServlet
 */
@WebServlet("/edit")
public class EditBookServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		System.out.print("Servlet id :- "+id);
		String name = request.getParameter("name");
		String authorName = request.getParameter("authorName");
		String price = request.getParameter("price");
		String book_category = request.getParameter("book_category");
		String book_status = request.getParameter("book_status");
		String book_image=request.getParameter("book_image");
		Book book = new Book();
		book.setName(name);
		book.setAuthor_name(authorName);
		book.setPrice(price);
		book.setCategory(book_category);
		book.setStatus(book_status);
		book.setUser_email("admin@gmail.com");
		book.setId(id);

		BookDAOImpl dao = new BookDAOImpl(DBConnection.getConnection());
		boolean updated = dao.updateBook(book);

		HttpSession session = request.getSession();
		if (updated) {
			session.setAttribute("success_message", "Book updated Successfully!");
			response.sendRedirect("admin/show_books.jsp");
		} else {
			session.setAttribute("failed_message", "Something went wrong!");
			response.sendRedirect("admin/show_books.jsp");
		}
	}
}
