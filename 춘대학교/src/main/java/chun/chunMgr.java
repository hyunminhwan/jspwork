package chun;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class chunMgr {
	private DBConnectionMgr pool;
	Connection con =null;
	PreparedStatement pstmt = null;
	ResultSet rs =null;
	String sql =null;
	
	public chunMgr() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean loginRegister(String studentNo,String studenPw) {
		boolean flag = false;
		
		try {
			con=pool.getConnection();
			sql="select count(*) from tb_student where student_no=? and student_pw=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, studentNo);
			pstmt.setString(2, studenPw);
			
			rs=pstmt.executeQuery();
			flag=rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			pool.freeConnection(con);
		}
		return flag;
	}
	
	public chunStudentBean getStudent(String no){
			chunStudentBean stBean =new chunStudentBean();
		
		try {
				con=pool.getConnection();
				sql="select student_name,STUDENT_NO,ENTRANCE_DATE,ABSENCE_YN,DEPARTMENT_NAME"
						+ " from tb_student"
						+ " join tb_department using(department_no) "
						+ " where student_no='"+no+"'";
				rs=con.createStatement().executeQuery(sql);
				if(rs.next()) {
					stBean.setStudentNo(rs.getString("student_no"));
					stBean.setStudentName(rs.getString("student_name"));
					stBean.setAbsenceYn(rs.getString("absence_yn"));
					stBean.setDepartmentNmae(rs.getString("department_name"));
					stBean.setEntranceDate(rs.getString("entrance_date"));
					
					
				}
				
			} catch (Exception e) {

				e.printStackTrace();
			}finally {
				pool.freeConnection(con);
			}
			return stBean;
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
