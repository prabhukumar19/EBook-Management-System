package com.DAO;

import java.util.List;

import com.entity.Book;

public interface BookDAO {
	public boolean addBook(Book book);
	public List<Book> getBooks();
	public Book getBookById(int id);
	public boolean updateBook(Book book);
	public boolean deleteBook(int id);
}
