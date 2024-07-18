package ch;
import java.sql.*;
import java.util.*;
public class beanPool {
	private DBConnectionMgr pool =null;
	
	public beanPool() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public ArrayList<Bean> getList() {
		ArrayList<Bean> alist = new ArrayList<Bean>();
		Connection con = null;
		Statement st = null;
		ResultSet rs = null;
	try {
		con =pool.getConnection();
		st = con.createStatement();
		rs = st.executeQuery("select* from employee order by emp_id");
		
			while(rs.next()) {
				Bean bean =new Bean();
				bean.setEmp_id(rs.getString("emp_id"));
				bean.setEmp_name(rs.getString("emp_name"));
				bean.setEmail(rs.getString("email"));
				bean.setPhone(rs.getString("phone"));
				bean.setJob_code(rs.getString("job_code"));
				alist.add(bean);
			}
	} catch (Exception e) {
			e.printStackTrace();
	}finally {
		pool.freeConnection(con);
	}
	return alist;
	}
}
