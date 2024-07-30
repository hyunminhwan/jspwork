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
			sql="select * from reply  where ref="+ref 
				+" order by no desc";
					
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
	
	public boolean insert(Reply reply) {
		boolean flag = false;
		try {
			con=pool.getConnection();
			sql="insert into reply values (seq_reply.nextval,?,?,?,sysdate)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,reply.getContent());
			pstmt.setInt(2, 1);
			pstmt.setString(3,reply.getName());
			if(pstmt.executeUpdate() == 1) { // 반환값 : insert가 안되었을 때 0반환, insert가 잘 되었을 때 1반환 
				flag = true;
			}  
		} catch (Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
}
