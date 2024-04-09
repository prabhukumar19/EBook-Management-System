package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAOImpl implements UserDAO {

	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean userRegister(User user) {
		boolean isRegister = false;
		try {
			String query = "insert into users (name, email, contact_number, password) values(?,?,?,?)";

			PreparedStatement ps = conn.prepareStatement(query);

			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getContact_number());
			ps.setString(4, user.getPassword());
			int res = ps.executeUpdate();
			System.out.println("DB Response :- " + res);
			if (res == 1) {
				isRegister = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return isRegister;
	}

	@Override
	public User login(String email, String password) {
		User user = null;
		try {
			String query = "select * from users WHERE email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet res = ps.executeQuery();
			
			while (res.next()) {
				user = new User();
				user.setId(res.getInt(1));
				user.setName(res.getString(2));
				user.setEmail(res.getString(3));
				user.setContact_number(res.getString(4));
				user.setPassword(res.getString(5));
			}

		} catch (Exception e) {
			
			System.out.println(e);
		}
		return user;
	}

}
