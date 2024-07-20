package ch07;

import java.sql.*;

public class RegisterMgr {
	private DBConnectionMgr pool;
	
	public RegisterMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean loginRegister(String id,String pwd) {
		Connection con =null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		boolean logincon = false;
		
		try {
			con =pool.getConnection();
			/*
			 * Statement로 하는 방식
			 * String quety ="select count(*) from mem whiere mem_id="
			 * +id+"and mem_ow ="+pwd;
			 */
			
			String quety ="select count(*) from mem where mem_id=? and mem_pw=?";
			pstmt = con.prepareStatement(quety);
			pstmt.setString(1,id);
			pstmt.setString(2,pwd);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()&&rs.getInt(1)==1) {
				logincon=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt,rs);
		}
		return logincon;
	}
	
}
