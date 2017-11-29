package Bpo;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBConnection;
import Bean.StudentBean;

public class ScBpo {
	
	public List<StudentBean> getStudentList(String courseid) throws SQLException {
		List<StudentBean> list = new ArrayList<StudentBean>();
		StudentBean student = null;
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			conn = DBConnection.getConnection();
			String sql = "select * from sc where courseid = "+courseid;
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				student = new StudentBean();
				String stuid = rs.getString("stuid");
				student.setStuid(stuid);
				list.add(student);
			}
		}finally{
			DBConnection.close(rs, st, conn);
		}
		
		return list;
		
	}
}
