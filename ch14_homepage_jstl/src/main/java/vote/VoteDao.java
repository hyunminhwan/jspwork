package vote;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DBConnectionMgr;

public class VoteDao {
	private DBConnectionMgr pool;
	Connection con =null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	String sql =null;
	
	public VoteDao() {
		pool = DBConnectionMgr.getInstance();
	}
	
	//설문 등록하기
	public boolean voteInsert(VoteList vlist,VoteItem vitem) {
		boolean flag =false;
		
		try {
			con=pool.getConnection();
			sql="insert into votelist values (SEQ_VOTE.nextval,?,?,?,sysdate,?,default)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, vlist.getQuestion());
			pstmt.setString(2, vlist.getSdate());
			pstmt.setString(3, vlist.getEdate());
			pstmt.setInt(4, vlist.getType());
			
			int result = pstmt.executeUpdate();
			int result2 = 0;
			if(result ==1) {
				sql = "insert into voteitem values(seq_vote.currval,?,?,default)";
				pstmt=con.prepareStatement(sql);
				
				String item[] = vitem.getItem();
				for(int i=0;i<item.length;i++) {
					if(item[i]==null||item[i].equals("")) {
						break;
					}
					pstmt.setInt(1,i);
					pstmt.setString(2, item[i]);
					result2=pstmt.executeUpdate();
				}
			}
			
			
			if(result2 ==1) {
				flag=true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con,pstmt);
		}
		
		return flag;
	}
	
	//설문폼에 넣을 질문 1개 가져오기
	public VoteList getOneVote(int num) {
		VoteList vlist = new VoteList();
		try {
			con = pool.getConnection();
			if(num == 0)
				sql = "select * from votelist order by num desc";
			else
				sql = "select * from votelist where num=" + num;
			rs=con.createStatement().executeQuery(sql);
			if(rs.next()) {
				vlist.setQuestion(rs.getString("question"));
				vlist.setType(rs.getInt("Type"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		return vlist;
	}
	
	//num 최대값 구하기
	public int getMaxNum() {
		int max =0;
		try {
			con=pool.getConnection();
			sql="select max(num) from votelist";
			rs = con.createStatement().executeQuery(sql);
			if(rs.next()) {
				max=rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		return max;
	}
	
	
	
	
	//설문폼(투표하기)에 넣을 item들 가져오기
	public ArrayList<String> getItem(int num){
		ArrayList<String> alist =new ArrayList<String>();
		
		try {
			con=pool.getConnection();
			if(num==0) {
				num=getMaxNum();
				System.out.println(getMaxNum());
			}
			sql = "select item from voteitem where listnum="+num;
			rs=con.createStatement().executeQuery(sql);
			while(rs.next()) {
				alist.add(rs.getString(1));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		return alist;
	}
	//리스트에 넣을 num 가져오기
	 public ArrayList<Integer> getsnum() {
		 ArrayList<Integer> snum =new ArrayList<Integer>();
		 try {
			con=pool.getConnection();
			sql = "select num from votelist order by num desc";
			rs=con.createStatement().executeQuery(sql);
			while(rs.next()) {
				snum.add(rs.getInt("num"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		return snum;
			
	 }
	 //리스트에 넣을 질문 날짜 넣기
	 public VoteList getSlist(int num) {
			VoteList vlist = new VoteList();
			try {
				con=pool.getConnection();
				sql = "select * from votelist where num="+num;
				rs=con.createStatement().executeQuery(sql);
				if(rs.next()) {
					vlist.setQuestion(rs.getString("question"));
					vlist.setSdate(rs.getString("sdate"));
					vlist.setEdate(rs.getString("edate"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				pool.freeConnection(con);
			}
			return vlist;
		}
	 
	 //값 1개씩 더하기
	 public boolean updateCount(int num,String[] itemnum) {
		 boolean flag = false;
		 try {
			con=pool.getConnection();
			sql="update voteitem set count= count+1 where listnum=? and itemnum=?";
			pstmt=con.prepareStatement(sql);
			if(num==0) {
				num = getMaxNum();
			}
			for(int i=0; i<itemnum.length;i++) {
				if(itemnum[i]==null||itemnum[i].equals("")) {
					break;
				}
				pstmt.setInt(1,num);
				pstmt.setInt(2,Integer.parseInt(itemnum[i]));
				int result = pstmt.executeUpdate();
				if(result==1) {
					flag=true;
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con);
		}
		 return flag;
	 }
	 
	 //listnum에 해당하는 전체 count가져오기
	 public int sumCount(int num) {
		 int count=0;
		 
		 try {
			con=pool.getConnection();
			sql="select sum(count) from voteitem where listnum=?";
			pstmt=con.prepareStatement(sql);
			 if(num==0) {
				 pstmt.setInt(1,getMaxNum());
			 }else {
				 pstmt.setInt(1,num);
			 }
			 rs=pstmt.executeQuery();
			 if(rs.next()) {
				 count=rs.getInt(1);
			 }
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		 return count;
		 
	 }
	
	 
	 //listnum에 해당하는 각 item의 count 얻어오기
	 public ArrayList<VoteItem> getView(int num){
		 ArrayList<VoteItem> alist = new ArrayList<VoteItem>();
		 
		 try {
			con=pool.getConnection();
			sql="select item, count from voteitem where listnum=?";
			pstmt=con.prepareStatement(sql);
			
			if(num==0) {
				pstmt.setInt(1, getMaxNum());
			}else {
				pstmt.setInt(1, num);
			}
			rs=pstmt.executeQuery();
			while(rs.next()) {
				VoteItem vitem = new VoteItem();
				String[] item = new String[1];
				item[0] = rs.getString(1);
				
				vitem.setItem(item);
				vitem.setCount(rs.getInt(2));
				alist.add(vitem);
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		 return alist;
	 }
	
	
}
