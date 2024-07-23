package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class BoardDao {
	private DBConnectionMgr pool;
	Connection con =null;
	PreparedStatement pstmt = null;
	Statement stmt =null;
	ResultSet rs =null;
	String sql =null;

	public BoardDao() {
		pool=DBConnectionMgr.getInstance();
	}

	public ArrayList<Board> getBoardList(String keyField,String keyWord,int start,int end){
		ArrayList<Board> blist= new ArrayList<Board>();
		try {
			con=pool.getConnection();
			if(keyWord==null||keyWord.equals("")) {
				sql="select * "
				+ "from(select rownum as rnum ,BT1.* "
				+ "		from(select * "
				+ "			 from board "
				+ "			 order by ref desc, pos) BT1 )"
				+ "where rnum between ? and ? ";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			}else {
				sql="select * "
						+ " from(select rownum as rnum ,BT1.* "
						+ "		from(select * "
						+ "			 from board "
						+ "			 where " + keyField + " like ? "
						+ "			 order by ref desc, pos) BT1"
						+ " 		)"
						+ " where rnum between ? and ? ";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1,"%"+keyWord+"%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Board board = new Board();
				board.setNum(rs.getInt("num"));
				board.setName(rs.getString("name"));
				board.setSubject(rs.getString("subject"));
				board.setContent(rs.getString("content"));
				board.setPos(rs.getInt("pos"));
				board.setRef(rs.getInt("ref"));
				board.setDepth(rs.getInt("depth"));
				board.setRegdate(rs.getString("regdate"));
				board.setPass(rs.getString("pass"));
				board.setIp(rs.getString("ip"));
				board.setCount(rs.getInt("count"));
				blist.add(board);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		return blist;
		
	}
	
	// 게시물 총 갯수
	public int getTotalCount(String keyField,String keyWord) {
		int totalCount = 0;
		
		try {
			con = pool.getConnection();
			if(keyWord==null||keyWord.equals("")) {
				sql ="select count(num) from board";
				rs=con.createStatement().executeQuery(sql);
			}else {
				sql ="select count(num) from board where " +keyField+ " like ? ";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1,"%"+keyWord+"%");
				rs=pstmt.executeQuery();
			}
			
			
			if(rs.next()) {
				totalCount=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		return totalCount;
	}
	
	//조회수 증가
	public void upCount(int num) {
		try {
			con = pool.getConnection();
			sql = "update board set count = count +1 where num="+num;
			con.createStatement().executeUpdate(sql);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
	}
	
	//게시물 1행 얻어오기
		public Board getOneBoard(int num) {
			Board board =new Board();
			
			try {
				con = pool.getConnection();
				sql="select * from board where num="+num;
				rs=con.createStatement().executeQuery(sql);
				if(rs.next()) {
					board.setNum(rs.getInt("num"));
					board.setName(rs.getString("name"));
					board.setSubject(rs.getString("subject"));
					board.setContent(rs.getString("content"));
					board.setPos(rs.getInt("pos"));
					board.setRef(rs.getInt("ref"));
					board.setDepth(rs.getInt("depth"));
					board.setRegdate(rs.getString("regdate"));
					board.setPass(rs.getString("pass"));
					board.setIp(rs.getString("ip"));
					board.setCount(rs.getInt("count"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				pool.freeConnection(con);
			}
			return board;
		}
		
	
		//게시물 총 레코드 수
				public int getTotalCount2() {
					int totalCount = 0;
					
					try {
						con = pool.getConnection();

					} catch (Exception e) {
						e.printStackTrace();
					}finally {
						pool.freeConnection(con);
					}
					return totalCount;
				}
}
