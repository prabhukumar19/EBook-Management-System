package com.entity;

public class Book {
	private int id;
	private String name;
	private String author_name;
	private String price;
	private String category;
	private String status;
	private String image;
	private String user_email;
	
	public Book() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Book(String name, String author_name, String price, String category, String status, String image,
			String user_email) {
		super();
		this.name = name;
		this.author_name = author_name;
		this.price = price;
		this.category = category;
		this.status = status;
		this.image = image;
		this.user_email = user_email;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAuthor_name() {
		return author_name;
	}

	public void setAuthor_name(String author_name) {
		this.author_name = author_name;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	@Override
	public String toString() {
		return "Book [id=" + id + ", name=" + name + ", author_name=" + author_name + ", price=" + price + ", category="
				+ category + ", status=" + status + ", image=" + image + ", user_email=" + user_email + "]";
	}
	
	
	
	
}
