package hyh.pdf;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.*;
import java.util.List;

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
    public String Build(List list,String []fields,String tablename){
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
            		if("".equals(items)){
            			table.addCell("NULL");
            		}else{
            			table.addCell(items);
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