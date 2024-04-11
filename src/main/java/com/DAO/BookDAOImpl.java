package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Book;

public class BookDAOImpl implements BookDAO {
	private Connection conn;

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addBook(Book book) {
		boolean bookAdded = false;
		try {
			String query = "insert into book_details (name, author_name, price, category, status, image, user_email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, book.getName());
			ps.setString(2, book.getAuthor_name());
			ps.setString(3, book.getPrice());
			ps.setString(4, book.getCategory());
			ps.setString(5, book.getStatus());
			ps.setString(6, book.getImage());
			ps.setString(7, book.getUser_email());

			int res = ps.executeUpdate();
			if (res == 1) {
				bookAdded = true;
			} else {
				System.out.println("Something went wrong!");
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return bookAdded;
	}

	@Override
	public Book getBookById(int id) {
		Book book = null;

		try {
			String query = "select * from book_details where id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet res = ps.executeQuery();
			while (res.next()) {
				book = new Book();
				book.setId(res.getInt(1));
				book.setName(res.getString(2));
				book.setAuthor_name(res.getString(3));
				book.setPrice(res.getString(4));
				book.setCategory(res.getString(5));
				book.setStatus(res.getString(6));
				book.setImage(res.getString(7));
				book.setUser_email(res.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return book;
	}

	@Override
	public List<Book> getBooks() {
		List<Book> books = new ArrayList<Book>();
		Book book = null;

		try {
			String query = "select * from book_details";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet res = ps.executeQuery();
			while (res.next()) {
				book = new Book();
				book.setId(res.getInt(1));
				book.setName(res.getString(2));
				book.setAuthor_name(res.getString(3));
				book.setPrice(res.getString(4));
				book.setCategory(res.getString(5));

				book.setStatus(res.getString(6));
				book.setImage(res.getString(7));
				book.setUser_email(res.getString(8));
				books.add(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return books;
	}

	@Override
	public boolean updateBook(Book book) {
		boolean bookUpdated = false;
		try {
			String query = "update book_details set name=? ,author_name=? ,price=?,category=?,status=?,user_email=? where id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, book.getName());
			ps.setString(2, book.getAuthor_name());
			ps.setString(3, book.getPrice());
			ps.setString(4, book.getCategory());
			ps.setString(5, book.getStatus());
			ps.setString(6, book.getUser_email());
			ps.setInt(7, book.getId());
			System.out.println("Query :-" + query);
			System.out.println("Book Id :- " + book.getId());

			int res = ps.executeUpdate();
			if (res == 1) {
				bookUpdated = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return bookUpdated;
	}

	@Override
	public boolean deleteBook(int id) {
		boolean isDeleted = false;
		try {
			String query = "delete from book_details where id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			int res = ps.executeUpdate();
			if (res == 1) {
				isDeleted = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return isDeleted;
	}

	@Override
	public List<Book> getRecentBooks() {
		List<Book> recentBooks = new ArrayList<Book>();
		Book book = null;

		try {
			String query = "select * from book_details where status=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, "active");
			ResultSet res = ps.executeQuery();
			int i = 1;
			while (res.next() && i <= 4) {
				book = new Book();
				book.setId(res.getInt(1));
				book.setName(res.getString(2));
				book.setAuthor_name(res.getString(3));
				book.setPrice(res.getString(4));
				book.setCategory(res.getString(5));

				book.setStatus(res.getString(6));
				book.setImage(res.getString(7));
				book.setUser_email(res.getString(8));
				recentBooks.add(book);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return recentBooks;
	}

	@Override
	public List<Book> getNewBooks() {
		List<Book> newBooks = new ArrayList<Book>();
		Book book = null;

		try {
			String query = "select * from book_details where category=? and status=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, "new");
			ps.setString(2, "active");
			ResultSet res = ps.executeQuery();
			int i = 1;
			while (res.next() && i <= 4) {
				book = new Book();
				book.setId(res.getInt(1));
				book.setName(res.getString(2));
				book.setAuthor_name(res.getString(3));
				book.setPrice(res.getString(4));
				book.setCategory(res.getString(5));

				book.setStatus(res.getString(6));
				book.setImage(res.getString(7));
				book.setUser_email(res.getString(8));
				newBooks.add(book);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return newBooks;
	}

	@Override
	public List<Book> getOldBooks() {
		List<Book> oldBooks = new ArrayList<Book>();
		Book book = null;

		try {
			String query = "select * from book_details where category=? and status=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, "old");
			ps.setString(2, "active");
			ResultSet res = ps.executeQuery();
			int i = 1;
			while (res.next() && i <= 4) {
				book = new Book();
				book.setId(res.getInt(1));
				book.setName(res.getString(2));
				book.setAuthor_name(res.getString(3));
				book.setPrice(res.getString(4));
				book.setCategory(res.getString(5));

				book.setStatus(res.getString(6));
				book.setImage(res.getString(7));
				book.setUser_email(res.getString(8));
				oldBooks.add(book);
				i++;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return oldBooks;
	}

	@Override
	public List<Book> getAllRecentBooks() {
		List<Book> allRecentBooks = new ArrayList<Book>();
		Book book = null;

		try {
			String query = "select * from book_details where status=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, "active");
			ResultSet res = ps.executeQuery();
			while (res.next()) {
				book = new Book();
				book.setId(res.getInt(1));
				book.setName(res.getString(2));
				book.setAuthor_name(res.getString(3));
				book.setPrice(res.getString(4));
				book.setCategory(res.getString(5));

				book.setStatus(res.getString(6));
				book.setImage(res.getString(7));
				book.setUser_email(res.getString(8));
				allRecentBooks.add(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return allRecentBooks;
	}

	@Override
	public List<Book> getAllNewBooks() {
		List<Book> allNewBooks = new ArrayList<Book>();
		Book book = null;

		try {
			String query = "select * from book_details where category=? and status=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, "new");
			ps.setString(2, "active");
			ResultSet res = ps.executeQuery();
			while (res.next()) {
				book = new Book();
				book.setId(res.getInt(1));
				book.setName(res.getString(2));
				book.setAuthor_name(res.getString(3));
				book.setPrice(res.getString(4));
				book.setCategory(res.getString(5));

				book.setStatus(res.getString(6));
				book.setImage(res.getString(7));
				book.setUser_email(res.getString(8));
				allNewBooks.add(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return allNewBooks;
	}

	@Override
	public List<Book> getAllOldBooks() {
		List<Book> allOldBooks = new ArrayList<Book>();
		Book book = null;

		try {
			String query = "select * from book_details where category=? and status=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, "old");
			ps.setString(2, "active");
			ResultSet res = ps.executeQuery();
			while (res.next()) {
				book = new Book();
				book.setId(res.getInt(1));
				book.setName(res.getString(2));
				book.setAuthor_name(res.getString(3));
				book.setPrice(res.getString(4));
				book.setCategory(res.getString(5));

				book.setStatus(res.getString(6));
				book.setImage(res.getString(7));
				book.setUser_email(res.getString(8));
				allOldBooks.add(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return allOldBooks;
	}

}
