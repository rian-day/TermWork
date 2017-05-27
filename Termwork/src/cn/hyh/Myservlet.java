package cn.hyh;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.*;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hyh.mjava.User;
import util.DBUtil;
import util.StringUtil;

public class Myservlet extends HttpServlet {
	DBUtil db;
	PrintWriter out;
	StringUtil su;
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		db=new DBUtil();
		PrintWriter out =response.getWriter();
		String path=request.getServletPath();
		path.replace(".do","");
		path.replace("/","");
		String real_path=path.replace(".do", "").replace("/", "");
		switch(real_path){
			case "login":
				//登录
				login(request,response);
				break;
			case "register":
				//注册
				register(request,response);
				break;
			case "change_password":
				change_password(request,response);
		}
	}
	public void login(HttpServletRequest request, HttpServletResponse response){
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String condition=" name='"+username+"';";
		String condition_2=" email='"+username+"';";
		if(db.CheckedLogin("user", condition)){
			//通过用户名验证
			String db_pwd=db.getData("user", "password", condition);
			if(password.equals(db_pwd)){
				int id=get_id(username);
				HttpSession session=request.getSession();
				session.setAttribute("username", username);
				session.setAttribute("id", id);
				try {
					response.sendRedirect(request.getContextPath()+"/page/my_index.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				//用户密码错误
				out.print("密码错误11111");
			}
		}else if(db.CheckedLogin("user", condition_2)){
			//通过email验证
			String db_email=db.getData("user", "password", condition_2);
			if(password.equals(db_email)){
				try {
					int id=get_id_byemail(username);
					request.setAttribute("id", id);
					request.setAttribute("email", username);
					response.sendRedirect(request.getContextPath()+"/welcome.jsp");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}else{
				//用户密码错误
			}
		}
		else{
			//无此用户
			out.print("密码错误");
		}
	}
	public void register (HttpServletRequest request, HttpServletResponse response){
		System.out.println("注册");
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String email=request.getParameter("email");
		String []arr_username={"name","password","email"};
		String []arr_password={username, password ,email};
		if(db.insertData("user", arr_username, arr_password)){
			//重定向
			try {
				response.sendRedirect(request.getContextPath()+"/index.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//请求分派
//			RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
//			try {
//				rd.forward(request, response);
//			} catch (ServletException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			} catch (IOException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
		}else{
			out.print("");
		}
	}
	public void change_password(HttpServletRequest request, HttpServletResponse response){
		
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
