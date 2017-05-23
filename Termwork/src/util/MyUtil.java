package util;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public class MyUtil {
	DBUtil db=new DBUtil();
	StringUtil su=new StringUtil();
	public boolean isUser(String username ,String password , HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		String condition=" name='"+username+"';";
		String condition_2=" email='"+username+"';";
		boolean user=false;
		if(db.CheckedLogin("user", condition)){
			//通过用户名验证
			String db_pwd=db.getData("user", "password", condition);
			if(password.equals(db_pwd)){
				session.setAttribute("username", username);
				user=true;
			}else{
				//用户密码错误
				
			}
		}else if(db.CheckedLogin("user", condition_2)){
			//通过email验证
			String db_email=db.getData("user", "password", condition_2);
			if(password.equals(db_email)){
				session.setAttribute("username", username);
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
	public String registerUser(String username ,String password ,String email ,HttpServletRequest request, HttpServletResponse response){
		if(db.CheckedLogin("user", "name='"+username+"';")){
			return "用户名已存在";
		}else{
			HttpSession session=request.getSession();
			String []field={"name","password","email"};
			String []value={username,password,email};
			db.insertData("user", field, value);
			session.setAttribute("username", username);
			return "注册成功";
		}
	}
	
	public int get_id_byemail(String email){
		String sql="email='"+email+"'";
		String id=db.getData("user", "id", sql);
		int out=su.stringToInteger(id);
		System.out.println(out);
		return out;
	}

	public List search(String tableName,String []field,String condition){
		List list=null;
		list=db.getData(tableName, field, condition);
		return list;
	}
	
	public List getuser(){
		List list=null;
		String []field={"name","power"};
		list=db.getData("user", field, "");
		return list;
	}
	public boolean changepower(String username,String powername){
		String []field={"power"};
		String []value={powername};
		String condition="name='"+username+"'";
		db.modifyData("user", field, value, condition);
		return true;
	}
}
