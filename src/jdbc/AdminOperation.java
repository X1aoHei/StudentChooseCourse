package jdbc;

import java.sql.Connection;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import util.DBConnection;

public class AdminOperation {
	private String name;
	private String password;
	private String age;
	private String classname;
	private String usertype;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getClassname() {
		return classname;
	}
	public void setClassname(String classname) {
		this.classname = classname;
	}
	public String getUsertype() {
		return usertype;
	}
	public void setUsertype(String usertype) {
		this.usertype = usertype;
	}
	public boolean login() throws SQLException{
		boolean successflag = false;
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from admin where name = '"+this.name+"' and password = '"+this.password+"'"+"and usertype = '"+this.usertype+"'";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			if(rs.next()==true){
				successflag = true;
			}
			
		}finally{
			DBConnection.close(null, st, conn);
		}
		return successflag;
		
	}
	
	
}
