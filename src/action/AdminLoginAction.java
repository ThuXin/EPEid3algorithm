package action;

import java.rmi.UnexpectedException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import service.DBOperation;

import com.opensymphony.xwork2.ActionSupport;

public class AdminLoginAction extends ActionSupport {
	public String adloginname, adloginpas, rad;

	ArrayList<String> eval = new ArrayList<String>();

	public String idValue;

	public String getIdValue() {
		return idValue;
	}

	public void setIdValue(String idValue) {
		this.idValue = idValue;
	}

	public ArrayList<String> getEval() {
		return eval;
	}

	public void setEval(ArrayList<String> eval) {
		this.eval = eval;
	}

	ArrayList<EmployeeRegister> employeelist = new ArrayList<>();

	ArrayList<Contact> contactList = new ArrayList<Contact>();

	public ArrayList<Contact> getContactList() {
		return contactList;
	}

	public void setContactList(ArrayList<Contact> contactList) {
		this.contactList = contactList;
	}

	HttpServletRequest req = ServletActionContext.getRequest();
	HttpSession session = req.getSession();

	public ArrayList<EmployeeRegister> getEmployeelist() {
		return employeelist;
	}

	public void setEmployeelist(ArrayList<EmployeeRegister> employeelist) {
		this.employeelist = employeelist;
	}

	public String getRad() {
		return rad;
	}

	public void setRad(String rad) {
		this.rad = rad;
	}

	public String getAdloginname() {
		return adloginname;
	}

	public void setAdloginname(String adloginname) {
		this.adloginname = adloginname;
	}

	public String getAdloginpas() {
		return adloginpas;
	}

	public void setAdloginpas(String adloginpas) {
		this.adloginpas = adloginpas;
	}

	DBOperation db = new DBOperation();

	public String connectsystem() throws ClassNotFoundException, SQLException {
		System.out.print("systemsuccess");

		if (db.systemconnect(adloginname, adloginpas, rad).equals("systemadmin")) {

			HttpServletRequest req = ServletActionContext.getRequest();
			HttpSession session = req.getSession();
			session.setAttribute("username", adloginname);
			System.out.println(adloginname);
			employeelist=db.retrieveEmpData2();	
			return "systemadmin";
		}
		else if (db.hrconnect(adloginname, adloginpas, rad).equals("hradmin")) {

			HttpServletRequest req = ServletActionContext.getRequest();
			HttpSession session = req.getSession();
			session.setAttribute("username", adloginname);
			System.out.println(adloginname);
			employeelist=db.retrieveEmpData2();	
			return "hradmin";
		}

		else if (db.managerconnect(adloginname, adloginpas, rad).equals("manager")) {
			

				HttpServletRequest req = ServletActionContext.getRequest();
				HttpSession session = req.getSession();

				session.setAttribute("username", adloginname);
				session.setAttribute("password", adloginpas);
				session.setAttribute("radio", rad);
				employeelist=db.retrieveEmpData2();	
				return "manager";
			}

		else {
			addActionError("Username or Password is incorrect!!!!");
			return "error";
		}


	}

}
