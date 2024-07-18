package ch06;

import java.sql.*;
import java.util.*;

public class UseBeanDBpool6 {
	private DBConnectionMgr pool =null;
	
	public UseBeanDBpool6() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public ArrayList<Bean> getList(){
		ArrayList<Bean> list =new ArrayList<Bean>();
		Connection con =null;
		Statement st =null;
		ResultSet  rs =null;
		
		try {
			con = pool.getConnection();
			st= con.createStatement();
			rs =st.executeQuery("select * from emp_01");
			while(rs.next()) {
				Bean bean = new Bean();
				bean.setEmp_id(rs.getString("emp_id"));
				bean.setEmp_name(rs.getString("emp_name"));
				bean.setDept_name(rs.getString("dept_name"));
				list.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		return list;
	}
	
}
