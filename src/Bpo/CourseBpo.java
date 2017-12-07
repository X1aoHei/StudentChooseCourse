package Bpo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBConnection;
import Bean.CourseBean;

public class CourseBpo {
	//获取所有学生列表  返回LIST
	public List<CourseBean> getAllCourse() throws SQLException {
		List<CourseBean> list = new ArrayList<CourseBean>();
		CourseBean course = null;
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		
		try {
			conn = DBConnection.getConnection();
			String sql = "select * from course";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				course = new CourseBean();
				String courseid = rs.getString("courseid");
				String cname = rs.getString("cname");
				String ccredit = rs.getString("ccredit");
				String cpre = rs.getString("cpre");
				course.setCourseid(courseid);
				course.setCname(cname);
				course.setCcredit(ccredit);
				course.setCpre(cpre);
				list.add(course);
			}
		} finally{
			DBConnection.close(rs, st, conn);
		}
		
		return list;
		
	}
	
	//模糊查询
	public List<CourseBean> getCourse(String courseid,String cname) throws SQLException{
		List<CourseBean> list = new ArrayList<CourseBean>();
		CourseBean course = null;
		Connection conn = null;
		Statement st = null;
		ResultSet rs = null;
		try{
			conn = DBConnection.getConnection();
			String sql = "select * from course where courseid like '"+courseid+"%' and ifnull(cname,'') like '"+cname+"%'";
			st = conn.createStatement();
			rs = st.executeQuery(sql);
			while(rs.next()){
				course = new CourseBean();
				String courseid1 = rs.getString("courseid");
				String cname1 = rs.getString("cname");
				String ccredit = rs.getString("ccredit");
				String cpre = rs.getString("cpre");
				course.setCourseid(courseid1);
				course.setCname(cname1);
				course.setCcredit(ccredit);
				course.setCpre(cpre);
				list.add(course);
			}
		}finally{
			DBConnection.close(rs, st, conn);
		}
		
		return list;
		
	}
	//选课
	public void  addsc(String stuid,String courseid) throws SQLException  {
		
		Connection conn = null;
		PreparedStatement ps = null;
		try{
			conn = DBConnection.getConnection();
			String sql = "insert into sc(stuid,courseid) values(?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, stuid);
			ps.setString(2,courseid);
			ps.executeUpdate();
			
		}finally{
			DBConnection.close(null, ps, conn);
		}
		
		
		
	}
	
	//获取所选课程
	public List<CourseBean> getCoursebystuid(String stuid) throws SQLException {
		List<CourseBean> list = new ArrayList<CourseBean>();
		CourseBean course = null;
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try{
			conn = DBConnection.getConnection();
			String sql = "select * from course where courseid in (select courseid from sc where stuid = ? )";
			ps = conn.prepareStatement(sql);
			ps.setString(1, stuid);
			rs = ps.executeQuery();
			while(rs.next()){
				course = new CourseBean();
				String courseid = rs.getString("courseid");
				String cname = rs.getString("cname");
				String ccredit = rs.getString("ccredit");
				String cpre = rs.getString("cpre");
				course.setCourseid(courseid);
				course.setCname(cname);
				course.setCcredit(ccredit);
				course.setCpre(cpre);
				list.add(course);
			}
		}finally{
			DBConnection.close(rs, ps, conn);
		}
		
		return list;
	}
}
