package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Cart;

public class CartDAOImpl implements CartDAO {
	Connection conn;

	public CartDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addToCart(Cart cart) {
		boolean isAddedInCart = false;
		try {

			String query = "insert into cart_details (bookId, userId, bookName, author, price, total_price) values(?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, cart.getBookId());
			ps.setInt(2, cart.getUserId());
			ps.setString(3, cart.getBookName());
			ps.setString(4, cart.getAuthor());
			ps.setDouble(5, cart.getPrice());
			ps.setDouble(6, cart.getTotalPrice());

			int res = ps.executeUpdate();
			if (res == 1) {
				isAddedInCart = true;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return isAddedInCart;
	}

	@Override
	public List<Cart> getCartByUserId(int userId) {
		List<Cart> carts = new ArrayList<Cart>();
		int count = 0;
		Cart cart = null;
		double total_price = 0;
		try {
			String query = "select * from cart_details where userId=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, userId);
			ResultSet res = ps.executeQuery();
			while (res.next()) {
				cart = new Cart();
				cart.setId(res.getInt(1));
				cart.setBookId(res.getInt(2));
				cart.setUserId(res.getInt(3));
				cart.setBookName(res.getString(4));
				cart.setAuthor(res.getString(5));
				cart.setPrice((res.getDouble(6)));
				total_price += res.getDouble(7);
				cart.setTotalPrice(total_price);
				count++;
				cart.setCount(count);
				carts.add(cart);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return carts;
	}

	@Override
	public boolean deleteBook(int bookId) {
		boolean isDeleted = false;
		try {
			String query = "delete from cart_details where bookId=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, bookId);

			int res = ps.executeUpdate();
			if (res == 1) {
				isDeleted = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return isDeleted;
	}
}
