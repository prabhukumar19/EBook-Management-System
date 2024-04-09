package com.admin.servlets;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


/**
 * Servlet implementation class DeleteBookServlet
 */
@WebServlet("/delete")
public class DeleteBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public DeleteBookServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println(id);
			BookDAOImpl dao = new BookDAOImpl(DBConnection.getConnection());
			boolean res= dao.deleteBook(id);
			HttpSession session = request.getSession();
			if(res) {
				session.setAttribute("success_message", "Book deleted successfully!");
				response.sendRedirect("admin/show_books.jsp");
			}else {
				session.setAttribute("failed_message", "Something went wrong!");
				response.sendRedirect("admin/show_books.jsp");
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	

}
