package Bean;



import java.sql.SQLException;

import Bpo.CourseBpo;
import Bpo.ScBpo;

public class ScBean {
	
	private String stuid;
	private String courseid;
	private String result;
	
	public String getStuid() {
		return stuid;
	}
	public void setStuid(String stuid) {
		this.stuid = stuid;
	}
	public String getCourseid() {
		return courseid;
	}
	public void setCourseid(String courseid) {
		this.courseid = courseid;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	
	public boolean check(String stuid,String courseid) throws SQLException{
		
		boolean successflag = false;
		ScBpo bpo = new ScBpo();
		ScBean sc = bpo.get(stuid, courseid);
		if(sc == null){
			CourseBpo bpo1 = new CourseBpo();
			bpo1.addsc(stuid, courseid);
			successflag = true;
		}
		return successflag;
	}
}
