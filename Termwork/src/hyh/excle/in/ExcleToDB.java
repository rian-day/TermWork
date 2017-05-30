package hyh.excle.in;

import java.util.List;

import util.DBUtil;

public class ExcleToDB {
	   public static void main(String[] args) {
	        //得到表格中所有的数据
	        List<ExcleUser> listExcel=Service.getAllByExcel("d://xx.xls");
	        /*//得到数据库表中所有的数据
	        List<StuEntity> listDb=StuService.getAllByDb();*/
	        
	        DBUtil db=new DBUtil();
	        
	        for (ExcleUser excleuser : listExcel) {
	            String username=excleuser.getUsername();
	            if (!Service.isExist(username)) {
	                //不存在就添加
	            	String tableName="user";
	            	String []field={"headres","sex","resume","name","email","tag","power","password"};
	            	String []value={excleuser.getHeadres(),excleuser.getUsersex(),excleuser.getResume(),excleuser.getUsername(),excleuser.getEmail(),
	            			excleuser.getTag(),excleuser.getPower(),excleuser.getPassword()};
	                db.insertData(tableName, field, value);
	            }else {
	                //存在就更新
	            	System.out.println("用户:"+username+" 已存在");
	            }
	        }
	    }
}
