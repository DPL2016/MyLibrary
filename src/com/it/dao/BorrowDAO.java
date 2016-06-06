package com.it.dao;

import com.it.entity.Borrow;
import com.it.tools.BeanRowMapper;
import com.it.tools.DBHelper;

public class BorrowDAO {
	DBHelper<Borrow> db = new DBHelper<>(Conf.DB_URL);
	BeanRowMapper<Borrow> be = new BeanRowMapper<>(Borrow.class);
	
	public boolean add(Borrow b){
		String sql  = "insert into borrow(bid,cid) values(?,?)";
		return db.doUpdate(sql, b.getBid(),b.getCid())==1;
	}
	public Borrow findOne(Borrow bor) {
		String sql = "select * from borrow where bid = ? and cid = ?";
		return db.queryOne(sql, be, bor.getBid(),bor.getCid());
				
	}
	public boolean remove(int id){
		String sql = "delete from borrow where id=?";
		return db.doUpdate(sql, id)==1;
	}
}
