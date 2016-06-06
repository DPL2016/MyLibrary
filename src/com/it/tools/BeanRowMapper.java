package com.it.tools;

import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

public class BeanRowMapper<T> implements BuildEntity<T> {

	private Class<T> type;

	public BeanRowMapper(Class<T> type) {
		this.type = type;
	}

	@Override
	public T build(ResultSet rs) throws SQLException {
		T obj = null;
		try {
			obj = type.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}

		ResultSetMetaData rsmd = rs.getMetaData();
		Method[] mds = type.getMethods();
		
		for (int i = 1; i <= rsmd.getColumnCount(); i++) {
			
			String colName = rsmd.getColumnLabel(i);
			colName = colName.substring(0, 1).toUpperCase() + colName.substring(1);
			colName = "set" + colName;
			
			for (Method md : mds) {
				if (md.getName().equals(colName)) {
					try {
						md.invoke(obj, rs.getObject(i));
					} catch (Exception e) {
						e.printStackTrace();
					}
					break;
				}
			}
		}
		
		return obj;
	}

}
