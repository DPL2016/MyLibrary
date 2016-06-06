package com.it.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;

public class BorrowService {
	public String borrowBook(String bookcode,String cardcode){
		return callPro("{CALL pro_book_borrow(?,?,?)}", cardcode, bookcode);
	}
	public String reBook(String bookcode,String cardcode){
		return callPro("{CALL pro_book_re(?,?,?)}", cardcode, bookcode);
	}
	private String callPro(String proName,String cardCode,String bookCode){
		String msg = "";
		try {
			Connection conn = DriverManager.getConnection(com.it.dao.Conf.DB_URL);
			CallableStatement cstmt = conn.prepareCall(proName);
			cstmt.setString(1, bookCode);
			cstmt.setString(2, cardCode);
			cstmt.executeQuery();
			msg = cstmt.getString(3);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return msg;
	}
}
