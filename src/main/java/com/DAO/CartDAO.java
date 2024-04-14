package com.DAO;

import java.util.List;
import com.entity.Cart;

public interface CartDAO {
	public boolean addToCart(Cart cart);
	public List<Cart> getCartByUserId(int userId);
	public boolean deleteBook(int bookId);
}
