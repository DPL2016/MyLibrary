package com.it.dao;


import com.it.entity.Admin;
import com.it.tools.BeanRowMapper;
import com.it.tools.DBHelper;

public class AdminDAO {
	DBHelper<Admin> db = new DBHelper<>(Conf.DB_URL);
	BeanRowMapper<Admin> be = new BeanRowMapper<>(Admin.class);
	public boolean find(String name,String pwd){
		String sql = "select * from admin where name = ? and password = ?";
		Admin a = db.queryOne(sql, be, name,pwd);
		return a!=null;
	}
}
