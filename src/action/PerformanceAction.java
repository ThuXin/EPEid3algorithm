package action;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import id3algorithm.Id3;
import service.DBOperation;

public class PerformanceAction extends ActionSupport {
	HttpServletRequest req = ServletActionContext.getRequest();
	HttpSession session = req.getSession();
	EmployeeRegister empregister = new EmployeeRegister();
	Performance performance = new Performance();
	String idvalue, emp_name;
	ArrayList<Performance> performancelist = new ArrayList<>();

	DBOperation db = new DBOperation();

	public EmployeeRegister getEmpregister() {
		return empregister;
	}

	public void setEmpregister(EmployeeRegister empregister) {
		this.empregister = empregister;
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

	public ArrayList<Performance> getPerformance() {
		return performancelist;
	}

	public void setPerformance(ArrayList<Performance> performancelist) {
		this.performancelist = performancelist;
	}

	public String Communication() {
		if (performance.communication == "good") {
			return "10%";
		} else if (performance.communication == "normal") {
			return "5%";
		} else {
			return "15%";
		}
	}

	public String TeamWork() {
		if (performance.teamwork == "bad") {
			return "5%";
		} else if (performance.teamwork == "normal") {
			return "5%";
		} else {
			return "15%";
		}
	}

	public String EnglishSkill() {
		if (performance.eng_skill == "advance") {
			return "15%";
		} else if (performance.eng_skill == "intermediate") {
			return "5%";
		} else {
			return "5%";
		}
	}

	public String Assignment() {
		if (performance.assignment == "complete") {
			return Communication();
		} else if (performance.assignment == "inprogress") {
			return EnglishSkill();
		} else {
			return "5%";
		}
	}

	public String PerformanceResult() {

		if (performance.job_skill == "good") {
			return Communication();

		} else if (performance.job_skill == "average") {
			return TeamWork();
		} else {
			return "5%";
		}

	}

}
