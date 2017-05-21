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
//	public int get_id(String username){
//		String sql="name='"+username+"'";
//		String id=db.getData("user", "id", sql);
//		int out=su.stringToInteger(id);
//		return out;
//	}
	
	public int get_id_byemail(String email){
		String sql="email='"+email+"'";
		String id=db.getData("user", "id", sql);
		int out=su.stringToInteger(id);
		System.out.println(out);
		return out;
	}

//	public  Vector<String[]> search(String tableName,String []field,String condition){
//		Vector<String[]>vector=null;
//		vector=db.getData(tableName, field, condition);
//		return vector;
//	}
	public List search(String tableName,String []field,String condition){
		List list=null;
		list=db.getData(tableName, field, condition);
		return list;
	}
//	public static void main(String[] args) {
//		MyUtil myutil=new MyUtil();
//		String text="G";
//		String tableName="eassy";
//		String []field={"content","username","eassytitle","time","good","type","updatetime"};
//		String condition="eassytitle like '%"+text+"%'";
//		List result=myutil.search(tableName, field, condition);
//		String json=JSON.toJSONString(result);
//		System.out.println(json);
//	}
}
