package chun;

public class chunBean {
	private int student_no;
	private String student_name;
	private String student_ssn;
	
	public chunBean() {

	}

	public chunBean(int student_no, String student_name, String student_ssn) {
		super();
		this.student_no = student_no;
		this.student_name = student_name;
		this.student_ssn = student_ssn;
	}

	public int getStudent_no() {
		return student_no;
	}

	public void setStudent_no(int student_no) {
		this.student_no = student_no;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getStudent_ssn() {
		return student_ssn;
	}

	public void setStudent_ssn(String student_ssn) {
		this.student_ssn = student_ssn;
	}

	
	@Override
	public String toString() {
		return "chunBean [student_no=" + student_no + ", student_name=" + student_name + ", student_ssn=" + student_ssn
				+ "]";
	}
	
	
	
	
}
