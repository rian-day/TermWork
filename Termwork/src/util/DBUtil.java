package util;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Vector;

import com.alibaba.fastjson.JSON;

public class DBUtil {
	private Connection conn = null;

	private ResultSet rs = null;

	private PreparedStatement prestmt = null;
	
	public DBUtil(){
		String[] str = readConfigFile();
		
		try {
			Class.forName(str[0]);
			conn = DriverManager.getConnection(str[1],str[2], str[3]);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
//	public static void main(String[] args){
//	DBUtil dbc = new DBUtil();
//	String[] str = dbc.readConfigFile();
//	System.out.println(str[0]);
//	String condition = "name='heyuheng'";
//	boolean b = dbc.CheckedLogin("user", condition);
//	System.out.println(b);
//	}

	private  String[] readConfigFile() {
		String[] str = new String[4];
		try{
		Properties props = new Properties();
		InputStream infile = this.getClass().getResourceAsStream("/ConfigFile/DbConfig.properties");
		props.load(infile);

		str[0] = props.getProperty("driver");
		str[1] = props.getProperty("url");
		str[2] = props.getProperty("username");
		str[3] = props.getProperty("password");
		}catch(Exception e){
			e.printStackTrace();
		}
		return str;
	}
	/**
	 * delete data by tablename and condition
	 * 
	 * @param tableName
	 * @param condition
	 */
	public boolean deleteData(String tableName, String condition) {
		String sql = "";
		boolean flag = false;
		if(condition==null||condition==""){
		sql = "delete from "+tableName;	
		}else{
		sql = "delete from "+tableName+" where "+condition;
		}
		try {
			prestmt = conn.prepareStatement(sql);
			int rscount = prestmt.executeUpdate();
			if(rscount>0){
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	   return flag;
	}
	/**
	 * get data by tablename, fields and condition 
	 * 
	 * @param tableName
	 * @param field
	 * @param condition
	 */
	
	public String getData(String tableName,String field,String condition){
		String sql="";
		String out="";
		sql="Select "+field+" From "+tableName+" Where "+condition+";";
		try{
			prestmt =conn.prepareStatement(sql);
			rs=prestmt.executeQuery();
			while(rs.next()){
				out=rs.getString(field);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return out;
	}
	
	public List getDateLimit(String tableName,String start,String end,String []field ,String condition,String idName){
		List list=new ArrayList();
		String strField = "", sql = "";
		for (int i = 0; i < field.length; i++) {
			strField += field[i] + ",";
		}
		strField = strField.substring(0, strField.lastIndexOf(","));
		if (condition == null || condition == "") {
			sql = "select " + strField + " from " + tableName+" ORDER BY "+idName+" DESC "+" limit "+start+","+end;
		} else {
			sql = "select " + strField + " from " + tableName + " where "
					+ condition;
		}
		try {
			prestmt = conn.prepareStatement(sql);
			rs = prestmt.executeQuery();
			while(rs.next()){
				Map<String,String> map=new HashMap();
				String[] temp = new String[field.length]; 
				for(int i=0;i<field.length;i++){
					temp[i] = rs.getString(field[i]);
				}
				for(int i=0;i<temp.length;i++){
					map.put(field[i], temp[i]);
				}
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return list;
	}
	
	public List getData(String tableName, String[] field, String condition) {
		List list=new ArrayList();
		String strField = "", sql = "";
		for (int i = 0; i < field.length; i++) {
			strField += field[i] + ",";
		}
		strField = strField.substring(0, strField.lastIndexOf(","));
		if (condition == null || condition == "") {
			sql = "select " + strField + " from " + tableName;
		} else {
			sql = "select " + strField + " from " + tableName + " where "
					+ condition;
		}
		try {
			prestmt = conn.prepareStatement(sql);
			rs = prestmt.executeQuery();
			while(rs.next()){
				Map<String,String> map=new HashMap();
				String[] temp = new String[field.length]; 
				for(int i=0;i<field.length;i++){
					temp[i] = rs.getString(field[i]);
				}
				for(int i=0;i<temp.length;i++){
					map.put(field[i], temp[i]);
				}
				list.add(map);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	
		return list;
	
	}
	
//	public Vector<String[]> getData(String tableName, String[] field, String condition) {
//		Vector<String[]> vec = new Vector<String[]>();
//	
//		String strField = "", sql = "";
//		for (int i = 0; i < field.length; i++) {
//			strField += field[i] + ",";
//		}
//		strField = strField.substring(0, strField.lastIndexOf(","));
//		if (condition == null || condition == "") {
//			sql = "select " + strField + " from " + tableName;
//		} else {
//			sql = "select " + strField + " from " + tableName + " where "
//					+ condition;
//		}
//		try {
//			prestmt = conn.prepareStatement(sql);
//			rs = prestmt.executeQuery();
//			while(rs.next()){
//				String[] temp = new String[field.length]; 
//				for(int i=0;i<field.length;i++){
//					temp[i] = rs.getString(field[i]);
//					//Debug(temp[i]);
//				}
//				vec.add(temp);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	
//		return vec;
//	
//	}
/**
 * @param table
 * @param condition
 * @return
 */
	public boolean CheckedLogin(String table,String condition) {
		boolean flag = false;
		try {
			
			String sql = "select * from "+table+" where "+condition;
			prestmt = conn.prepareStatement(sql);
			rs = prestmt.executeQuery();
			if (rs.next()) {
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	/**
	 * 
	 * @param tableName
	 * @param field
	 * @param value
	 * @throws SQLException
	 */
	
	public boolean insertData(String tableName, String[] field, String[] value) {
		boolean flag = false;
		if (field == null || value == null ||field.length==0||value.length==0|| field.length != value.length)
			return flag;
		String strField = "", strValue = "";
		for (int i = 0; i < field.length; i++) {
			strField += field[i] + ",";
			strValue += "'" + value[i] + "',";
		}
		strField = strField.substring(0, strField.lastIndexOf(","));
		strValue = strValue.substring(0, strValue.lastIndexOf(","));
		try {
			String sql = "insert into " + tableName;
			sql += " (" + strField + ") values(";
			sql += strValue + ")";
			prestmt = conn.prepareStatement(sql);
			int rscount = prestmt.executeUpdate();
			if (rscount > 0)
				flag = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	/**
	 * 
	 * @param tableName
	 * @param field
	 * @param value
	 * @param condition
	 */
	public boolean modifyData(String tableName, String[] field, String[] value,
			String condition) {
		boolean flag = false;
		if (field == null || value == null ||field.length==0||value.length==0|| field.length != value.length)
			return flag;
		String str = "";
		for(int i=0;i<field.length;i++){
			str += field[i]+"='"+value[i]+"',";
		}
		str = str.substring(0,str.lastIndexOf(","));
		//Debug(str);
		String sql = "";
		if(condition==null||condition==""){
		 sql = "update "+tableName+" set "+str;
		}else{
			sql = "update "+tableName+" set "+str+"  where "+condition;	
		}
		//Debug(sql);
		
		try {
			prestmt = conn.prepareStatement(sql);
			int rscount = prestmt.executeUpdate();
			if(rscount>0){
				flag = true;
			}
		} catch (SQLException e) {
			e.printStackTrace(); 
		}
		return flag;
	}
	/**
	 * @param table
	 * @param field
	 * @param condition
	 * @return
	 */
	public Hashtable<String, String> execSQL(String table,String field,String condition){
		Hashtable<String, String> ht = new Hashtable<String, String>();
		try{
			String sql = "select "+field+" from "+table+" where "+condition;
			prestmt = conn.prepareStatement(sql);
			rs = prestmt.executeQuery();
			while(rs.next()){
                    ht.put(field, rs.getString(field));
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return ht;
		
	}
}
