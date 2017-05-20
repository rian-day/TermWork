package util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MyUtil {
	DBUtil db=new DBUtil();
	StringUtil su=new StringUtil();
//	public static void main(String[] args) {
//		String username="heyuheng";
//		String condition=" name='"+username+"';";
//		db.CheckedLogin("user", condition);
//	}
	public boolean isUser(String username ,String password , HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		String condition=" name='"+username+"';";
		String condition_2=" email='"+username+"';";
		boolean user=false;
		if(db.CheckedLogin("user", condition)){
			//通过用户名验证
			String db_pwd=db.getData("user", "password", condition);
			if(password.equals(db_pwd)){
				int id=get_id(username);
				session.setAttribute("username", username);
				session.setAttribute("id", id);
				user=true;
			}else{
				//用户密码错误
				
			}
		}else if(db.CheckedLogin("user", condition_2)){
			//通过email验证
			String db_email=db.getData("user", "password", condition_2);
			if(password.equals(db_email)){
				int id=get_id_byemail(username);
				session.setAttribute("username", username);
				session.setAttribute("id", id);
				user=true;
			}else{
				//用户密码错误
			}
		}
		else{
			//无此用户
		}
		return user;
	}
	public int get_id(String username){
		String sql="name='"+username+"'";
		String id=db.getData("user", "id", sql);
		int out=su.stringToInteger(id);
		return out;
	}
	
	public int get_id_byemail(String email){
		String sql="email='"+email+"'";
		String id=db.getData("user", "id", sql);
		int out=su.stringToInteger(id);
		System.out.println(out);
		return out;
	}
}
