package cn.hyh;

import java.io.IOException;
import java.io.PrintWriter;
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
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request,response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String path=request.getServletPath();
		String real_path=path.replace("page", "").replace(".in","").replace("/","");
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
			String []field={"content","username","eassytitle","time","good","type","updatetime"};
			String condition="eassytitle like '%"+text+"%'";
			List result=myutil.search(tableName, field, condition);
			String json=JSON.toJSONString(result);
			response.getWriter().println(json);
		}
	}

}
