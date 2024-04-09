package com.admin.servlets;

import java.io.File;
import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnection;
import com.entity.Book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class AddBookServlet
 */
@WebServlet("/add")
@MultipartConfig
public class AddBookServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String name = request.getParameter("name");
			String authorName = request.getParameter("authorName");
			String price = request.getParameter("price");
			String book_category = request.getParameter("book_category");
			String book_status = request.getParameter("book_status");
			Part part = request.getPart("book_image");
			String fileName = part.getSubmittedFileName();

			Book book = new Book(name, authorName, price, book_category, book_status, fileName, "admin@gmail.com");
			BookDAOImpl dao = new BookDAOImpl(DBConnection.getConnection());

			boolean added = dao.addBook(book);
			HttpSession session = request.getSession();
			if (added) {

				String path = getServletContext().getRealPath("") + "assets/images";
//				System.out.println(path);
				File file = new File(path);
				part.write(path + File.separator + fileName);

				session.setAttribute("success_message", "Book added Successfully!");
				response.sendRedirect("admin/add_book.jsp");
			} else {
				session.setAttribute("failed_message", "Something went wrong!");
				response.sendRedirect("admin/add_book.jsp");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

}
