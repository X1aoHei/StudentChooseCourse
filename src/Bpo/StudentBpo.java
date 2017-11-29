package Bpo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import util.DBConnection;
import Bean.StudentBean;

public class StudentBpo {
	public StudentBean get(String stuid) throws SQLException {
		StudentBean stu = new StudentBean();
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try{
			conn = DBConnection.getConnection();
			String sql = "select * from student where stuid = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, stuid);
			rs = ps.executeQuery();
			while(rs.next()){
				String sname = rs.getString("sname");
				String sex = rs.getString("sex");
				String age = Integer.toString(rs.getInt("age"));
				String birthday = rs.getString("birthday");
				String classname = rs.getString("classname");
				stu.setStuid(stuid);
				stu.setSname(sname);
				stu.setSex(sex);
				stu.setAge(age);
				stu.setBirthday(birthday);
				stu.setClassname(classname);
			}
		}finally{
			DBConnection.close(rs, ps, conn);
		}
		
		return stu;
		
	}
}
