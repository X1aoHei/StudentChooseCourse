package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Bean.CourseBean;
import Bpo.CourseBpo;
/**
 * Servlet implementation class getCourse
 */
@WebServlet("/getCourse")
public class getCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getCourse() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String err = "";
		List<CourseBean> course = null;
		String courseid = request.getParameter("courseid");
		String cname = request.getParameter("cname");
		if(courseid.equals("")&&cname.equals("")){
			CourseBpo bpo = new CourseBpo();
			try {
				course =bpo.getAllCourse();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				err = "≤È—Ø ß∞‹"+e.getMessage();
			}
			
		}else{
			CourseBpo bpo = new CourseBpo();
			try {
				course = bpo.getCourse(courseid, cname);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				err = "≤È—Ø ß∞‹"+e.getMessage();
			}
			
		}
		request.setAttribute("err", err);
		request.setAttribute("course", course);
		request.getRequestDispatcher("Student/PickingCourse.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
