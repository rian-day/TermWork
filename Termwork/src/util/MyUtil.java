package util;

import java.awt.Desktop;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import hyh.mjava.User;
import hyh.pdf.BuildPdf;

public class MyUtil {
	DBUtil db=new DBUtil();
	StringUtil su=new StringUtil();
	User user=new User();
	Date date=new Date();
	SimpleDateFormat matter1=new SimpleDateFormat("yyyy-MM-dd");
	String time=matter1.format(date);
	//获取javabean所有属性值
	public void showUser(){
		System.out.println(user.getEassynum());
		System.out.println(user.getEmail());
		System.out.println(user.getHeadres());
		System.out.println(user.getPower());
		System.out.println(user.getResume());
		System.out.println(user.getTag());
		System.out.println(user.getUsername());
		System.out.println(user.getUsersex());
		for(int i=0;i<4;i++){
			System.out.println(user.getPoweritems(i));
		}
	}
	public void SaveUser(String username ,String condition,HttpSession session){
		List list=SearchUserInfo(username,condition);
		Map map=(Map) list.get(0);
		
		user.init1();
		
		session.setAttribute("username", map.get("name").toString());
		user.setUsername(map.get("name").toString());
		user.setEmail(map.get("email").toString());
		//user.setHeadres(map.get("headres").toString());
		//user.setPower(map.get("power").toString());
		//user.setResume(map.get("resume").toString());
		user.setTag((String)map.get("tag"));
		user.setUsersex(map.get("sex").toString());
		//user.setEassynum((int) map.get("eassynum"));
		list=SearchPowerItems(map.get("power").toString());
		map=(Map) list.get(0);
		System.out.println(map.get("changeuser"));
		user.setPoweritems(
				su.objectToInteger(map.get("changeuser")),
				su.objectToInteger(map.get("deletedynamic")), 
				su.objectToInteger(map.get("deleteeassy")), 
				su.objectToInteger(map.get("deleteuser"))
				);
	}
	public List SearchUserInfo(String username,String condition){
		List list=null;
		String []field={"name","email","headres","power","resume","tag","sex","power","eassynum"};
		list=db.getData("user", field, condition);
		return list;
	}
	public List SearchPowerItems(String power){
		List list=null;
		String []field={"changeuser","deletedynamic","deleteeassy","deleteuser"};
		String condition ="power='"+power+"'";
		list=db.getData("power", field, condition);
		return list;
	}
	public boolean isUser(String username ,String password , HttpServletRequest request, HttpServletResponse response){
		HttpSession session=request.getSession();
		String condition=" name='"+username+"';";
		String condition_2=" email='"+username+"';";
		boolean result=false;
		if(db.CheckedLogin("user", condition)){
			//通过用户名验证
			String db_pwd=db.getData("user", "password", condition);
			if(password.equals(db_pwd)){
				//session.setAttribute("username", username);
				SaveUser(username,condition,session);
				result=true;
			}else{
				//用户密码错误
				
			}
		}else if(db.CheckedLogin("user", condition_2)){
			//通过email验证
			String db_email=db.getData("user", "password", condition_2);
			if(password.equals(db_email)){
				//session.setAttribute("username", username);
				SaveUser(username,condition_2,session);
				result=true;
			}else{
				//用户密码错误
			}
		}
		else{
			//无此用户
		}
		return result;
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
	public boolean changepoweritems(String []field,String []values,String condition){
		db.modifyData("power", field, values, condition);
		return true;
	}
	public boolean writeEassy(String username,String time,String eassytitle,String content){
		String []field={"username","time","eassytitle","content"};
		String []value={username,time,eassytitle,content};
		boolean result=db.insertData("eassy", field, value);
		return result;
	}
	//导出user表信息到pdf
	public String OutToPDF(HttpServletRequest request){
		String []field={"sex","resume","name","email","tag","eassynum","power","password"};
		String tablename="user";
		List list=db.getData(tablename, field, "");
		BuildPdf bp=new BuildPdf();
		String message=bp.Build(list, field,tablename,request);
		try {
			Desktop.getDesktop().open(new File("D:/MyPDF.pdf"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return message;
	}
	public boolean deleteuser(String username){
		String condition="name='"+username+"';";
		return db.deleteData("user", condition);
	}
	public boolean Deassy(String eassyid){
		String condition="eassyid='"+eassyid+"';";
		return db.deleteData("eassy", condition);
	}
	public boolean Ddynamic(String dynamicid){
		String condition="dynamicid='"+dynamicid+"';";
		return db.deleteData("dynamic", condition);
	}
	public boolean Idynamic(String content,String time,String username){
		String []field={"content","time","username"};
		String []value={content,time,username};
		return db.insertData("dynamic", field, value);
	}
	public boolean addcomment(String tableName,String username,String eassyid,String commentcontent){
		String []field={"content","username","time","eassyid"};
		String []value={commentcontent,username,time,eassyid};
		return db.insertData(tableName, field, value);
	}
	public List moreload(String start,String end,String tableName){
		String []field={"username","content","time","good","eassytitle","eassyid"};
		String condition="";
		List list=db.getDateLimit(tableName, start, end, field, condition,"eassyid");
		return list;
	}
	public boolean addfollow(String followername,String username){
		String condition="followername = '"+followername+"' AND username= '"+username+"';";
		if(db.CheckedLogin("follow", condition)){
			return false;
		}
		String []field={"followername","username"};
		String []value={followername,username};
		System.out.println("follower:"+followername);
		System.out.println("username:"+username);
		return db.insertData("follow", field, value);
	}
	
	
//	public static void main(String[] args) {
//		DBUtil db=new DBUtil();
//		String []field={"sex","resume","name","email","tag","eassynum","power","password"};
//		String tablename="user";
//		List list=db.getData(tablename, field, "");
//		BuildPdf bp=new BuildPdf();
//		String message=bp.Build(list, field,tablename);
//		try {
//			Desktop.getDesktop().open(new File("D:/MyPDF.pdf"));
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
}
