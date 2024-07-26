package ajaxReply;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import ajax01.DBConnectionMgr;

public class ReplyDao {
	private DBConnectionMgr pool = DBConnectionMgr.getInstance();
	Connection con =null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	String sql =null;
	
	public ArrayList<Reply> getReplyList(int ref){
		ArrayList<Reply> alist = new ArrayList<Reply>();
	
		try {
			con=pool.getConnection();
			sql="select * from reply ref="+ref;
			rs=con.createStatement().executeQuery(sql);
			
			while(rs.next()) {
				Reply reply =new Reply();
				reply.setNo(rs.getInt("no"));
				reply.setName(rs.getString("name"));
				reply.setContent(rs.getString("content"));
				reply.setRedate(rs.getString("redate"));
				
				alist.add(reply);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		return alist;
	}
}
