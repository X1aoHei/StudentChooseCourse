package Bpo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;




import util.DBConnection;
import Bean.ScBean;
import Bean.StudentBean;

public class ScBpo {
	//获取选课用户选课列表
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
	
	//判断是否重复选课
	public ScBean get(String stuid,String courseid){
		ScBean sc = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			
			conn = DBConnection.getConnection();
			
			String sql = "select * from sc where stuid = ? and courseid = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, stuid);
			ps.setString(2, courseid);
			rs = ps.executeQuery();
			while(rs.next()){
				sc = new ScBean();
				String stuid0 = rs.getString("stuid");
				String courseid0 = rs.getString("courseid");
				String result = rs.getString("result");
				sc.setStuid(stuid0);
				sc.setCourseid(courseid0);
				sc.setResult(result);
			}
		}catch(Exception e){
			
		}
		finally{
			DBConnection.close(rs, ps, conn);
		}
		return sc;
		
	}
	
	
	
}
