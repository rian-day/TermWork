package hyh.pdf;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.*;

/**  
 * First iText example: Hello World.  
 */  
public class BuildPdf {  
   
//    public static void main(String[] args) {
//    	System.out.println("start...");
//    	Document document =new Document();
//        try {
//			PdfWriter writer=PdfWriter.getInstance(document,new FileOutputStream("D:/Chap0101.pdf"));
//		} catch (FileNotFoundException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		} catch (DocumentException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//        document.open();
//        Chunk chunk1 = new Chunk("This text is underlined", 
//        		FontFactory.getFont(FontFactory.HELVETICA, 12, Font.UNDERLINE)); 
//        chunk1.setBackground(BaseColor.ORANGE); 
//        try {
//        	document.add(chunk1);
//			document.add(new Paragraph("Hello World"));
//			document.add(new Paragraph("2"));
//		} catch (DocumentException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//        
//        System.out.println("success...");
//
//        document.close();
//	}
    public String Build(List list,String []fields,String tablename,HttpServletRequest request){
    	System.out.println("start...");
    	Document document =new Document();
        try {
			PdfWriter writer=PdfWriter.getInstance(document,new FileOutputStream("D:/MyPDF.pdf"));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
        document.open();
        BaseFont baseFont=null;
		try {
			baseFont = BaseFont.createFont(request.getSession().getServletContext().getRealPath("/")+"css/simhei.ttf",BaseFont.IDENTITY_H,BaseFont.NOT_EMBEDDED);
		} catch (DocumentException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
        Font font = new Font(baseFont);
        Map map=new HashMap();
        PdfPTable table=new PdfPTable(fields.length);
        PdfPCell cell=new PdfPCell();
        Paragraph para = new Paragraph(tablename);
        para.setAlignment(Element.ALIGN_CENTER);
        cell.setPhrase(para);
        cell.setColspan(fields.length);
        table.addCell(cell);
        for(int i=0;i<fields.length;i++){
        	table.addCell(fields[i]);
        }
        
        
        	for(int i=0;i<list.size();i++){
            	map=(Map) list.get(i);
            	for(int j=0;j<fields.length;j++){
            		String items=(String) map.get(fields[j]);
                    cell=new PdfPCell();
            		if("".equals(items)){
                        cell.setPhrase(new Phrase("NULL",font));
            			table.addCell(cell);
            		}else{
                        cell.setPhrase(new Phrase(items,font));
            			table.addCell(cell);
            		}
            	}
            }
        	
        	
        try {
			document.add(table);
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}
        System.out.println("success...");

        document.close();
        return "success";
    }
    
}  