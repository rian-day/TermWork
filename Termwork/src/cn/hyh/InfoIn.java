package cn.hyh;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import util.MyUtil;

public class InfoIn extends HttpServlet {
	MyUtil myutil=new MyUtil();
	PrintWriter pw;
	Date date=new Date();
	SimpleDateFormat matter1=new SimpleDateFormat("yyyy-MM-dd");
	String time=matter1.format(date);
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		pw=response.getWriter();
		String path=request.getServletPath();
		String real_path=path.replace("page", "").replace(".in","").replace("/","");
		//System.out.println(real_path);
		switch(real_path){
			case "login":
				String username=request.getParameter("username");
				String password=request.getParameter("password");
				if(myutil.isUser(username, password, request, response)){
					Map map = new HashMap();
					map.put("username",username);
					JSONObject itemjson=JSONObject.parseObject(JSON.toJSONString(map));
					response.getWriter().println(itemjson);
				}else{
					Map map = new HashMap();
					map.put("username","not a user");				
					JSONObject itemjson=JSONObject.parseObject(JSON.toJSONString(map));
					response.getWriter().println(itemjson);
				}
				break;
			case "search":
				String text=request.getParameter("text");
				String tableName="eassy";
				String []field={"content","username","eassytitle","time","good","type","updatetime","imgres"};
				String condition="eassytitle like '%"+text+"%'";
				List result=myutil.search(tableName, field, condition);
				String json=JSON.toJSONString(result);
				response.getWriter().println(json);
				break;
			case "register":
				String usernameRe=request.getParameter("username");
				String passwordRe=request.getParameter("password");
				String emailRe=request.getParameter("email");
				String resultRe=myutil.registerUser(usernameRe, passwordRe, emailRe,request,response);
				if(resultRe.equals("注册成功")){
					Map map = new HashMap();
					map.put("username",usernameRe);
					JSONObject itemjson=JSONObject.parseObject(JSON.toJSONString(map));
					response.getWriter().println(itemjson);
				}else{
					Map map = new HashMap();
					map.put("username","exist");			
					JSONObject itemjson=JSONObject.parseObject(JSON.toJSONString(map));
					response.getWriter().println(itemjson);
				}
				break;
			case "getuser":
				List resultGetuser=myutil.getuser();
				String jsonGetuser=JSON.toJSONString(resultGetuser);
				response.getWriter().println(jsonGetuser);
				break;
			case "changepower":
				String powername=request.getParameter("payMethod");
				String usernamePower=request.getParameter("username");
				if(myutil.changepower(usernamePower, powername)){
					Map map = new HashMap();
					map.put("result","complete");			
					JSONObject itemjson=JSONObject.parseObject(JSON.toJSONString(map));
					response.getWriter().println(itemjson);
				}
				break;
			case "getpower":
				String []fieldPower={"power","changeuser","deletedynamic","deleteuser","deleteeassy"};
				List resultPower=myutil.search("power", fieldPower, "");
				String jsonPower=JSON.toJSONString(resultPower);
				response.getWriter().println(jsonPower);
				break;
			case "changepoweritems":
				String usernamePowerItems=request.getParameter("power");
				String changeuser=request.getParameter("changeuser");
				String deletedynamic=request.getParameter("deletedynamic");
				String deleteeassy=request.getParameter("deleteeassy");
				String deleteuser=request.getParameter("deleteuser");
				String []fieldPowerItems={"changeuser","deletedynamic","deleteeassy","deleteuser"};
				String []values={changeuser,deletedynamic,deleteeassy,deleteuser};
				for(int i=0;i<values.length;i++){
					if(values[i].equals("true"))values[i]="1";
					else values[i]="0";
				}
				String conditionPowerItems="power='"+usernamePowerItems+"'";
				if(myutil.changepoweritems(fieldPowerItems, values, conditionPowerItems)){
					Map map = new HashMap();
					map.put("result","complete");			
					JSONObject itemjson=JSONObject.parseObject(JSON.toJSONString(map));
					response.getWriter().println(itemjson);
				}
				break;
			case "deleteuser":
				String Dusername=request.getParameter("username");
				if(myutil.deleteuser(Dusername)){
					response.getWriter().print("1");
				}else{
					response.getWriter().print("0");
				}
				break;
			case "writepostEassy":
				String usernameEassy =(String) request.getSession().getAttribute("username");
				String eassytitle =request.getParameter("eassytitle");
				String eassycontent=request.getParameter("content");
				if(myutil.writeEassy(usernameEassy, time, eassytitle, eassycontent)){
					pw.print("1");
				}else{
					pw.print("0");
				}
				break;
			case "OutToPDF":
				String message=myutil.OutToPDF(request);
				if(message=="success"){
					response.getWriter().print("1");
				}else{
					response.getWriter().print("0");
				}
				break;
			case "Deassy":
				String eassyid=request.getParameter("eassyid");
				if(myutil.Deassy(eassyid)){
					response.getWriter().print("1");
				}else response.getWriter().print("0");
				break;
			case "Ddynamic":
				String dynamicid=request.getParameter("dynamicid");
				if(myutil.Ddynamic(dynamicid))response.getWriter().print("1");
				else response.getWriter().print("0");
				break;
			case "insertDynamic":
				String content=request.getParameter("content");
				if(myutil.Idynamic(content, time, (String) request.getSession().getAttribute("username"))){
					pw.print("1");
				}else pw.print("0");
				break;
			case "addcommit":
				username=request.getParameter("username");
				eassyid=request.getParameter("eassyid");
				String commentcontent=request.getParameter("commentcontent");
				if(myutil.addcomment("eassycomment", username ,eassyid, commentcontent)){
					pw.print("1");
				}else{
					pw.print("0");
				}
				break;
			case "moreload":
				String start=request.getParameter("start");
				String end=request.getParameter("end");
				tableName="eassy";
				List list=myutil.moreload(start, end, tableName);
				json=JSON.toJSONString(list);
				pw.println(json);
				break;
			case "addfollow":
				String followername=request.getParameter("followername");
				username=request.getParameter("username");
				System.out.println("followername:"+followername);
				if(myutil.addfollow(followername, username)){
					pw.print("1");
				}else{
					pw.print("0");
				}
				break;
		}
	}

}
