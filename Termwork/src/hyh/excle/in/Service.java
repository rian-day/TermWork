package hyh.excle.in;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jxl.Sheet;
import jxl.Workbook;
import util.DBUtil;
import util.StringUtil;

/**
 * @author Javen
 * @Email zyw205@gmail.com
 * 
 */
public class Service {
	static StringUtil su=new StringUtil();
    /**
     * 查询指定目录中电子表格中所有的数据
     * @param file 文件完整路径
     * @return
     */
    public static List<ExcleUser> getAllByExcel(String file){

        List<ExcleUser> list=new ArrayList<ExcleUser>();
        try {
            Workbook rwb=Workbook.getWorkbook(new File(file));
            Sheet rs=rwb.getSheet(0);//或者rwb.getSheet(0)
            int clos=rs.getColumns();//得到所有的列
            int rows=rs.getRows();//得到所有的行
            
            System.out.println(clos+" rows:"+rows);
            for (int i = 1; i < rows; i++) {
                for (int j = 0; j < clos; j++) {
                    
                    String headres=rs.getCell(j++, i).getContents();              //默认最左边编号也算一列 所以这里得j++
                    String sex=rs.getCell(j++, i).getContents();
                    String resume=rs.getCell(j++, i).getContents();
                    String name=rs.getCell(j++, i).getContents();
                    String email=rs.getCell(j++, i).getContents();
                    String password=rs.getCell(j++, i).getContents();
                    String tag=rs.getCell(j++, i).getContents();
                    String eassynum=rs.getCell(j++, i).getContents();
                    String power=rs.getCell(j++, i).getContents();
                    
                    System.out.println("headres:"+headres+" name:"+name+" sex:"+sex+" email:"+email+"password:"+password);
                    ExcleUser excleuser=new ExcleUser();
                    excleuser.setUsername(name);
                    
                    excleuser.setEassynum(su.stringToInteger(eassynum));
                    excleuser.setEmail(email);
                    excleuser.setHeadres(headres);
                    excleuser.setPower(power);
                    excleuser.setResume(resume);
                    excleuser.setTag(tag);
                    excleuser.setUsername(name);
                    excleuser.setUsersex(sex);
                    excleuser.setPassword(password);
                    
                    list.add(excleuser);
                }
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } 
        return list;
        
    }
    
    /**
     * 通过Id判断是否存在
     * @param id
     * @return
     */
    public static boolean isExist(String username){
        try {
            DBUtil db=new DBUtil();
            String condition ="name='"+username+"';";
            return db.CheckedLogin("user", condition);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }
    
    public static void main(String[] args) {
        /*List<StuEntity> all=getAllByDb();
        for (StuEntity stuEntity : all) {
            System.out.println(stuEntity.toString());
        }*/
        
        
    }
    
}