package action;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.rmi.UnexpectedException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import hep.aida.bin.StaticBin1D;
import id3algorithm.GenerateTree;
import id3algorithm.ID3_calculation;
import id3algorithm.Id3;
import id3algorithm.Node;
import service.DBOperation;

public class EvaluateAction extends ActionSupport {
	HttpServletRequest req = ServletActionContext.getRequest();
	HttpSession session = req.getSession();
	EmployeeRegister empregister = new EmployeeRegister();
	Performance performance = new Performance();
	String idvalue, emp_name;
	double emp_salary = empregister.getEmpsalary();
	Performance perform = new Performance();
	static String[][] table = null;

	ArrayList<EmployeeRegister> emp = new ArrayList<>();
	ArrayList<EmployeeRegister> employeelist = new ArrayList<>();
	ArrayList<Performance> performancelist = new ArrayList<>();

	DBOperation db = new DBOperation();
	String attendence = req.getParameter("Attendence");
	String assignment = req.getParameter("assignment");
	String eng_skill = req.getParameter("eng_skill");
	String job_skill = req.getParameter("job_skill");
	String job_position = req.getParameter("job_position");
	String teamwork = req.getParameter("teamwork");
	String communication = req.getParameter("communication");

	public ArrayList<EmployeeRegister> getEmployeelist() {
		return employeelist;
	}

	public void setEmployeelist(ArrayList<EmployeeRegister> employeelist) {
		this.employeelist = employeelist;
	}

	public String getIdvalue() {
		return idvalue;
	}

	public void setIdvalue(String idvalue) {
		this.idvalue = idvalue;
	}

	public String getEmp_name() {
		return emp_name;
	}

	public void setEmp_name(String emp_name) {
		this.emp_name = emp_name;
	}

	public ArrayList<EmployeeRegister> getEmp() {
		return emp;
	}

	public void setEmp(ArrayList<EmployeeRegister> emp) {
		this.emp = emp;
	}

	public void setEmp_salary(double emp_salary) {
		this.emp_salary = emp_salary;
	}

	public EmployeeRegister getEmpregister() {
		return empregister;
	}

	public void setEmpregister(EmployeeRegister empregister) {
		this.empregister = empregister;
	}

	public String Evaluate_Data() throws SQLException, ClassNotFoundException {

		int id = Integer.parseInt(idvalue);
		DBOperation db = new DBOperation();
		emp = db.employeelist(id);

		return "success";

	}

	public String HREvaluate() throws SQLException, ClassNotFoundException {
		int empid = (int) session.getAttribute("EmpID");

		DBOperation db = new DBOperation();

		if (db.insertPerformanceHR(empid, attendence, eng_skill, job_position).equals("success")) {
			employeelist = db.retrieveEmpData2();

			return "success";

		} else if (db.insertPerformance(empid, assignment, job_skill, teamwork, communication).equals("success")) {
			employeelist = db.retrieveEmpData2();

			return "success";
		} else {
			return "error";
		}

	}

	public String Evaluate() throws SQLException, ClassNotFoundException {
		int empid = (int) session.getAttribute("EmpID");

		DBOperation db = new DBOperation();

		if (db.insertPerformance(empid, assignment, job_skill, teamwork, communication).equals("success")) {
			employeelist = db.retrieveEmpData2();

			return "success";
		} else {
			return "error";
		}

	}

	

	public String ManagerEvaluate() throws SQLException, ClassNotFoundException {
		

		DBOperation db = new DBOperation();

		employeelist = db.retrieveEmpData2();

		Id3.main(null);
		return "success";

	}
	
	public String DeleteEmployee() throws SQLException, ClassNotFoundException {

		DBOperation db = new DBOperation();

		try {
			int id = Integer.parseInt(idvalue);
			db.DeleteEmp(id);
			employeelist = db.retrieveEmpData2();

			System.out.println(employeelist);
		} catch (UnexpectedException e) {
			
			e.printStackTrace();
		}
		return "success";
	}
	
	public String UpdateEmployee() throws SQLException, ClassNotFoundException {

		DBOperation db = new DBOperation();
		

		int empid = (int) session.getAttribute("EmpID");
		db.updateemployee(empid);
		employeelist = db.retrieveEmpData2();

		System.out.println(employeelist);
		return "success";
	}

}
