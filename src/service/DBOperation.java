package service;

import java.rmi.UnexpectedException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Collection;
import java.util.Collections;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.apache.struts2.ServletActionContext;
import action.Contact;
import action.EmployeeRegister;
import action.Performance;

//import action.AdminRegistration;

public class DBOperation {
	Connection con;
	ResultSet rs;
	HttpServletRequest req = ServletActionContext.getRequest();
	HttpSession session = req.getSession();
	Statement st;

	public DBOperation() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/db";
			String uname = "root";
			String pass = "password";
			con = DriverManager.getConnection(url, uname, pass);
			System.out.println("connect");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// Evaluate Section------
	public String insertPerformance(int empregister_id, String assignment, String job_skill, String teamwork,
			String communication) throws SQLException {
		System.out.println("P out");
		String eval = "UPDATE performance SET assignment='" + assignment + "',job_skill='" + job_skill + "',teamwork='"
				+ teamwork + "',communication='" + communication + "' where empregister_id='" + empregister_id + "';";
		PreparedStatement pre = con.prepareStatement(eval);
		pre.executeUpdate();
		return "success";
	}

	public String insertPerformanceHR(int empregister_id, String attendence, String eng_skill, String job_position)
			throws SQLException {
		String performancesql = "select * from performance where empregister_id='" + empregister_id + "'";
		String performanceid = "";
		st = con.createStatement();
		rs = st.executeQuery(performancesql);
		while (rs.next()) {
			performanceid = String.valueOf(rs.getInt("performance_id"));
		}
		if (performanceid == "") {
			String eval = "insert into performance (empregister_id,attendence,english_skill,job_position) values (?,?,?,?)";
			PreparedStatement pre = con.prepareStatement(eval);
			pre.setInt(1, empregister_id);
			pre.setString(2, attendence);
			pre.setString(3, eng_skill);
			pre.setString(4, job_position);
			pre.executeUpdate();
			return "success";
		} else {
			String eval = "UPDATE performance SET attendence='" + attendence + "',english_skill='" + eng_skill
					+ "',job_position='" + job_position + "' where empregister_id='" + empregister_id + "';";
			PreparedStatement pre = con.prepareStatement(eval);
			pre.executeUpdate();
			return "success";
		}

	}

	// insert Employee

	public String insertEmployeeDataOperation(EmployeeRegister e)
			throws ClassNotFoundException, SQLException, NullPointerException {

		Statement st = con.createStatement();
		String query = "select email  from employee where email='" + e.empemail + "' or password='" + e.emppass + "'";
		ResultSet rs = st.executeQuery(query);
		if (!rs.next()) {
			String ss = "insert into employee(hradmin_id,name,password,email,salary,address,phone) values ('" + e.hrId
					+ "','" + e.empname + "','" + e.emppass + "','" + e.empemail + "','" + e.empsalary + "','"
					+ e.empaddress + "','" + e.empphone + "')";
			PreparedStatement pre = con.prepareStatement(ss);
			pre.executeUpdate();
			return "success";
		} else {
			System.out.println("Existing account.");
			return "invalid";
		}

	}

	public String systemconnect(String uname, String pass, String radio) throws ClassNotFoundException, SQLException {

		boolean check = false;
		int mid = 0;
		if (radio.equals("systemadmin")) {
			String ss = "select * from systemadmin";
			st = con.createStatement();
			rs = st.executeQuery(ss);

			while (rs.next()) {
				mid = rs.getInt(1);
				session.setAttribute("mId", mid);
				if (rs.getString(2).equals(uname) && rs.getString(3).equals(pass)) {
					check = true;
					break;
				}

			}

		}
		if (check == true)
			return "systemadmin";
		else
			return "error";

	}

	public String hrconnect(String uname, String pass, String radio) throws ClassNotFoundException, SQLException {

		boolean check = false;
		int hrid = 0;
		if (radio.equals("hradmin")) {
			String ss = "select * from hradmin";
			st = con.createStatement();
			rs = st.executeQuery(ss);

			while (rs.next()) {
				hrid = rs.getInt(1);
				session.setAttribute("hrId", hrid);
				System.out.println("hrId" + hrid);
				if (rs.getString(2).equals(uname) && rs.getString(3).equals(pass)) {
					check = true;
					break;
				}

			}

		}
		if (check == true)
			return "hradmin";
		else
			return "error";

	}

	// ManagerConnect
	public String managerconnect(String uname, String pass, String radio) throws ClassNotFoundException, SQLException {

		boolean check = false;
		int mid = 0;
		if (radio.equals("manager")) {
			String ss = "select * from manageradmin";
			st = con.createStatement();
			rs = st.executeQuery(ss);

			while (rs.next()) {
				mid = rs.getInt(1);
				session.setAttribute("manager", mid);
				if (rs.getString(2).equals(uname) && rs.getString(3).equals(pass)) {
					check = true;
					break;
				}

			}

		}
		if (check == true)
			return "manager";
		else
			return "error";

	}

	public String employeeconnect(String uname, String pass, String radio) throws ClassNotFoundException, SQLException {
		// System.out.print(rad);
		boolean check = false;
		if (radio.equals("employee")) {
			String ss = "select * from employee";
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery(ss);
			String empname = null;
			String empemail = null;
			String empadd = null;
			String empphone = null;
			double empsalary = 0.0;

			int empId = 0;
			while (rs.next()) {
				if (rs.getString(3).equals(uname) && rs.getString(4).equals(pass)) {
					check = true;
					empId = rs.getInt(1);
					session.setAttribute("empId", empId);
					empname = rs.getString(3);
					session.setAttribute("empname", empname);
					empemail = rs.getString(5);
					session.setAttribute("empemail", empemail);
					empsalary = rs.getDouble(6);
					session.setAttribute("empsalary", empsalary);
					empadd = rs.getString(7);
					session.setAttribute("empaddress", empadd);
					empphone = rs.getString(8);
					session.setAttribute("empphone", empphone);

					break;
				}

			}

		}
		if (check == true)
			return "employee";
		else
			return "error";

	}

	public String SelectEmployeeData() throws SQLException {
		String ss = "select * from employee";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(ss);
		while (rs.next()) {
			HttpServletRequest req = ServletActionContext.getRequest();
			HttpSession session = req.getSession();

			String email = rs.getString(4);
			String address = rs.getString(5);
			String phone = rs.getString(6);

			session.setAttribute("Email", email);
			session.setAttribute("Address", address);
			session.setAttribute("Phone", phone);

		}
		return "success";
	}

	public String updateemployee(int id) throws ClassNotFoundException, SQLException {
		System.out.println("Updating.....");
		EmployeeRegister emp = new EmployeeRegister();

		System.out.println("Employee ID:" + id);
		String qq = "update employee set name=?,email=?,address=?,phone=?,password=?,salary=? where empregister_id="
				+ id + "";
		PreparedStatement pre = con.prepareStatement(qq);
		double salary = Double.parseDouble(req.getParameter("empsalary"));
		pre.setString(1, req.getParameter("empname"));
		pre.setString(2, req.getParameter("empemail"));
		pre.setString(3, req.getParameter("empaddress"));
		pre.setString(4, req.getParameter("empphone"));
		pre.setString(5, req.getParameter("emppass"));
		pre.setDouble(6, Double.parseDouble(req.getParameter("empsalary")));
		session.setAttribute("username", emp.getEmpname());
		session.setAttribute("empemail", emp.getEmpemail());
		session.setAttribute("empphone", emp.getEmpaddress());
		session.setAttribute("empaddress", emp.getEmpphone());
		session.setAttribute("emppass", emp.getEmppass());
		session.setAttribute("empsalary", emp.getEmpsalary());
		pre.executeUpdate();

		return "success";
	}

	// select employee data to evaluate

	public ArrayList<EmployeeRegister> employeelist(int id) throws SQLException, ClassNotFoundException {
		ArrayList<EmployeeRegister> empresult = new ArrayList<EmployeeRegister>();
		String sql = "select * from employee where employee.empregister_id=" + id + "";
		st = con.createStatement();
		rs = st.executeQuery(sql);
		EmployeeRegister em = new EmployeeRegister();
		int empID = 0;
		String empName = null;
		double empSalary = 0.0;
		while (rs.next()) {
			empID = rs.getInt(1);
			empName = rs.getString(3);
			empSalary = rs.getDouble(6);

		}
		em.setId(empID);
		em.setEmpname(empName);
		em.setEmpsalary(empSalary);

		session.setAttribute("EmpID", em.getId());
		session.setAttribute("Empname", em.getEmpname());
		session.setAttribute("Salary", em.getEmpsalary());
		empresult.add(em);
		return empresult;
	}

	// select employee data

	public ArrayList<EmployeeRegister> employeeData(int id) throws SQLException, ClassNotFoundException {
		ArrayList<EmployeeRegister> empresult = new ArrayList<EmployeeRegister>();

		String sql = "select * from employee where employee.hradmin_id=" + id + "";
		st = con.createStatement();

		rs = st.executeQuery(sql);
		while (rs.next()) {
			EmployeeRegister em = new EmployeeRegister();
			em.setId(rs.getInt(1));
			em.setEmpname(rs.getString(3));

			empresult.add(em);

		}
		return empresult;
	}

	// For inserting Contact Info
	public void insertContact(Contact cont) throws SQLException {
		String ss = "insert into contact values('" + cont.conid + "','" + cont.contactname + "','" + cont.contactemail
				+ "','" + cont.contactsubject + "','" + cont.contactmessage + "')";
		Statement st = con.createStatement();
		System.out.println("Success insert contact");
		st.executeUpdate(ss);

	}

	public ArrayList<Performance> retrievePerformance() throws SQLException {

		System.out.println(session.getAttribute("EmpID"));
		Performance performance = new Performance();
		EmployeeRegister emp = new EmployeeRegister();
		ArrayList<Performance> performancelist = new ArrayList<Performance>();
		String sql = "select * from managerview where empregister_id=" + session.getAttribute("EmpID") + "";
		Statement st = con.createStatement();
		rs = st.executeQuery(sql);
		while (rs.next()) {

			performance.attendence = rs.getString("attendence");
			performance.assignment = rs.getString("assignment");
			performance.eng_skill = rs.getString("english_skill");
			performance.job_skill = rs.getString("job_skill");
			performance.job_position = rs.getString("job_position");
			performance.teamwork = rs.getString("teamwork");
			performance.communication = rs.getString("communication");

			performancelist.add(performance);

		}
		return performancelist;
	}

	public ArrayList<EmployeeRegister> retrieveEmpData2() throws SQLException {
		int mid = 1;
		String qry = "select employee.empregister_id,employee.name from employee where employee.hradmin_id=" + mid + "";

		Statement stt = con.createStatement();
		rs = stt.executeQuery(qry);

		ArrayList<EmployeeRegister> demp = new ArrayList<>();
		while (rs.next()) {
			EmployeeRegister em = new EmployeeRegister();
			em.setId(rs.getInt(1));
			em.setEmpname(rs.getString(2));

			demp.add(em);

		}

		return demp;

	}

	// Update Employee
	public ArrayList<EmployeeRegister> UpdateEmp(int id) throws SQLException, UnexpectedException {

		String emp_query = "select * from employee where empregister_id=" + id + "";
		Statement st = con.createStatement();
		st.executeQuery(emp_query);
		ArrayList<EmployeeRegister> demp = new ArrayList<>();
		while (rs.next()) {
			EmployeeRegister em = new EmployeeRegister();
			em.setId(rs.getInt(1));
			em.setEmpname(rs.getString(2));

			demp.add(em);

		}

		return demp;

	}

	// Delete Employee
	public void DeleteEmp(int id) throws SQLException, UnexpectedException {

		String del_query = "delete from employee where empregister_id=" + id + "";
		Statement st = con.createStatement();
		st.executeUpdate(del_query);
		System.out.println("Delete Successfully");

	}
	// Retrieve Contact message

	public ArrayList<Contact> ContactViewdata() throws SQLException

	{

		ArrayList<Contact> contactList = new ArrayList<Contact>();
		String ss = "select * from contact";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(ss);
		while (rs.next()) {
			Contact cp = new Contact();
			cp.setConid(rs.getInt(1));
			cp.setContactname(rs.getString(2));
			cp.setContactemail(rs.getString(3));
			cp.setContactsubject(rs.getString(4));
			cp.setContactmessage(rs.getString(5));
			contactList.add(cp);
			System.out.println("Message " + rs.getString(5));

		}

		return contactList;
	}

	public int preYear(int yy) {

		return yy - 1;
	}

}
