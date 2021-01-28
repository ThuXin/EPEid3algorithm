package action;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

import service.DBOperation;

public class EmployeeAction extends ActionSupport{
	EmployeeRegister e;
	DBOperation db=new DBOperation();
	ArrayList<EmployeeRegister> employeelist=new ArrayList<>();
	HttpServletRequest req=ServletActionContext.getRequest();
	HttpSession session=req.getSession();
	public ArrayList<EmployeeRegister> getEmployeelist() {
		return employeelist;
	}

	public void setEmployeelist(ArrayList<EmployeeRegister> employeelist) {
		this.employeelist = employeelist;
	}

	public String idvalue;
	public String getIdvalue() {
		return idvalue;
	}

	public void setIdvalue(String idvalue) {
		this.idvalue = idvalue;
	}

	
	public EmployeeRegister getE() {
		return e;
	}

	public void setE(EmployeeRegister e) {
		this.e = e;
	}

	public String insertemployeedata() throws ClassNotFoundException, NullPointerException, SQLException
	{
		
		
	   if(e.empname.equals("") ||e.emppass.equals("") || e.empemail.equals("") || e.empaddress.equals("")|| e.empphone.equals(""))
		{
			return "error";
		}
	   else if(db.insertEmployeeDataOperation(e).equals("success"))
		{  		employeelist=db.retrieveEmpData2();
				return "success";
		}
	   else if(db.insertEmployeeDataOperation(e).equals("invalid"))
		{
		       addActionError("Data already exits");
				return "invalid";
		}
		else
		{
			return "error";
		}
		
	}
	
	
	
	public String employeeResult() throws ClassNotFoundException, SQLException{
		int id=Integer.parseInt(idvalue);
		System.out.println(id+"mmmmmmmm");
		employeelist=db.employeelist(id);
		return "success";
	}
	
	
}
