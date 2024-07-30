package chun;

public class chunStudentBean {
	private String studentNo; //학번
	private String studentPw;//비밀번호(초기값 생년월일)
	private String studentName; //학생이름
	private String departmentNmae; //학과이름
	private String entranceDate; // 입학일자 
	private String absenceYn;// 휴학 유무 ABSENCE_YN
	
	public chunStudentBean() {
	}

	public chunStudentBean(String studentNo, String studentPw, String studentName, String departmentNmae,
			String entrance_date, String absenceYn) {
		this.studentNo = studentNo;
		this.studentPw = studentPw;
		this.studentName = studentName;
		this.departmentNmae = departmentNmae;
		this.entranceDate = entrance_date;
		this.absenceYn = absenceYn;
	}

	public String getStudentNo() {
		return studentNo;
	}

	public void setStudentNo(String studentNo) {
		this.studentNo = studentNo;
	}

	public String getStudentPw() {
		return studentPw;
	}

	public void setStudentPw(String studentPw) {
		this.studentPw = studentPw;
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}

	public String getDepartmentNmae() {
		return departmentNmae;
	}

	public void setDepartmentNmae(String departmentNmae) {
		this.departmentNmae = departmentNmae;
	}

	public String getEntranceDate() {
		return entranceDate;
	}

	public void setEntranceDate(String entranceDate) {
		this.entranceDate = entranceDate;
	}

	public String getAbsenceYn() {
		return absenceYn;
	}

	public void setAbsenceYn(String absenceYn) {
		this.absenceYn = absenceYn;
	}

	@Override
	public String toString() {
		return "chunStudentBean [studentNo=" + studentNo + ", studentPw=" + studentPw + ", studentName=" + studentName
				+ ", departmentNmae=" + departmentNmae + ", entranceDate=" + entranceDate + ", absenceYn=" + absenceYn
				+ "]";
	}
	
	
	
	
}
