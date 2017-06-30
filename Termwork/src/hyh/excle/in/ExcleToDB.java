package hyh.excle.in;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import util.DBUtil;

public class ExcleToDB {
	
	public void uploadExcle(HttpServletRequest request){
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setSizeThreshold(1024*1024*3);
		ServletFileUpload upload = new ServletFileUpload(factory);
		upload.setSizeMax(1024*1024*10);
		upload.setFileSizeMax(1024*1024*20);
        upload.setHeaderEncoding("UTF-8");
        
        List<FileItem> formItems = null;
		try {
			formItems = upload.parseRequest(request);
		} catch (FileUploadException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        FileItem file = formItems.get(0);
        
	    try {
			HSSFWorkbook book = new HSSFWorkbook(file.getInputStream());
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        DBUtil db=new DBUtil();
    	String tableName="user";
		InputStream is = null;
		try {
			is = request.getInputStream();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HSSFWorkbook wb = null;
        try {
        	wb = new HSSFWorkbook(is);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        HSSFSheet sheet = wb.getSheetAt(0);
        int rowNum = sheet.getLastRowNum();
        HSSFRow row = sheet.getRow(0);
        int colNum = row.getLastCellNum();
        String []field={"headres","sex","resume","name","email","tag","power","password"};
		
        for(int i = 1; i <= rowNum; i ++){
        	row = sheet.getRow(i);
    		String[] value= new String[field.length];
        	for(int j = 1; j <= colNum; j++){
        		value[j-1] = row.getCell(j).getStringCellValue();
        	}
            db.insertData(tableName, field, value);
        }
        
		
	}
	
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
	                //存在就后台打印
	            	System.out.println("用户:"+username+" 已存在");
	            }
	        }
	    }
}
