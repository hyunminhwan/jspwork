package chun;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class chunMgr {
	private DBConnectionMgr pool;
	Connection con =null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	String sql =null;
	
	public chunMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean loginRegister(String studentNo,String studentSsn) {
		boolean flag = false;
		
		try {
			con=pool.getConnection();
			sql="select count(*) from member where student_no ";
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		return flag;
	}
	
}
