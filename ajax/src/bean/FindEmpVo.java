package bean;

public class FindEmpVo {
	
	int empId;
	String name;
	String phone;
	double salary;
	String strSal;  // 소수점이 포함된 salary
	String email;
	
	public FindEmpVo() {
		
	}

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public double getSalary() {
		return salary;
	}

	public void setSalary(double salary) {
		this.salary = salary;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStrSal() {
		return strSal;
	}

	public void setStrSal(String strSal) {
		this.strSal = strSal;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	
	

}
