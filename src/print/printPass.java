package print;

import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.util.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@WebServlet("/printPass")
public class printPass extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String GatePassNumber = (String) request.getParameter("Gnumber"); // Gate Pass Number
		
		String driver = "com.mysql.cj.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://dno6xji1n8fm828n.cbetxkdyhwsb.us-east-1.rds.amazonaws.com:3306/";
		String database = "zvp0njb2yauy3fgk";
		String userid = "pjyaoyeilkkbtjg8";
		String password = "ejzn69wchxp2bv6j";

		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		Connection connection = null;
		Statement statement1 = null;
		Statement statement2 = null;
		Statement statement3 = null;
		Statement statement4 = null;
		Statement statement5 = null;
		Statement statement6 = null;

		try {
			connection = DriverManager.getConnection(connectionUrl + database, userid, password);
			statement1 = connection.createStatement();
			statement2 = connection.createStatement();
			statement3 = connection.createStatement();
			statement4 = connection.createStatement();
			statement5 = connection.createStatement();
			statement6 = connection.createStatement();
			HttpSession session = request.getSession();
			String Name = (String) session.getAttribute("Name");
			String Info = "SELECT * FROM bhel_person WHERE gatepass='" + GatePassNumber + "'";
			ResultSet rs10 = statement1.executeQuery(Info);
			String Info1 = "SELECT * FROM nonbhel_person WHERE gatepass='" + GatePassNumber + "'";
			ResultSet rs11 = statement2.executeQuery(Info1);
			String numberOfItems = "SELECT COUNT(PassNumber) FROM material WHERE PassNumber='" + GatePassNumber + "'";
			ResultSet rs4 = statement3.executeQuery(numberOfItems);
			rs4.next();
			String receiverTable = "select * from receiver WHERE gatepass='" + GatePassNumber + "'";
			ResultSet rs22 = statement4.executeQuery(receiverTable);
			rs22.next();
			Document document = new Document();
			String materialTable = "select * from material WHERE PassNumber='" + GatePassNumber + "'";
			ResultSet rs5 = statement5.executeQuery(materialTable);
			String details = "select Details from material_details WHERE gatepass='" + GatePassNumber + "'";
			ResultSet rs6 = statement6.executeQuery(details);
			rs6.next();
//			 new FileOutputStream("C:\\Users\\bhanu\\Desktop\\PS 1\\page\\text.pdf");	
			PdfWriter.getInstance(document,response.getOutputStream() );
			
			
			document.open();
			
			Font f1 = new Font(Font.FontFamily.TIMES_ROMAN,10,Font.BOLD,BaseColor.BLACK);
			Font f2 = new Font(Font.FontFamily.TIMES_ROMAN,8,Font.BOLD,BaseColor.BLACK);
			Font f3 = new Font(Font.FontFamily.TIMES_ROMAN,8,Font.NORMAL,BaseColor.BLACK);
			
			
			String passNum = "Gate Pass No. " + GatePassNumber;
			Paragraph p = new Paragraph(passNum, f1);
			
			p.setAlignment(Element.ALIGN_CENTER);
			
			Paragraph blank = new Paragraph(" ");
			
			PdfPTable tableHeader = new PdfPTable(5);
			PdfPTable tableHeaderSub = new PdfPTable(1);
			
			Date dNow1 = new Date();
	        SimpleDateFormat ft1 = 
	        new SimpleDateFormat ("dd-MM-yyyy");
	        String presentDate = ft1.format(dNow1);
			
			
			String strBHEL = "Bharat Heavy Electricals Limited\n" + "Heavy Plates and Vessels Plant\n" + "Visakhapatnam";
			String gatePass = "\n MATERIAL GATE PASS\n" + "(RETURNABLE)\n" + "IN/OUT"; 
			String gatePassNum = "GATE PASS NO.\n" + GatePassNumber + "\n";
			Image img = Image.getInstance("C:\\Users\\bhanu\\git\\BHEL-Material-Gate-Pass-System\\WebContent\\img_src\\Login_logo.jpg");
			PdfPCell c1 = new PdfPCell( img , true);
			c1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			PdfPCell c2 = new PdfPCell(new Paragraph(strBHEL,f2));
			c2.setHorizontalAlignment(Element.ALIGN_CENTER);
			c2.setVerticalAlignment(Element.ALIGN_MIDDLE);
			PdfPCell c3 = new PdfPCell(new Paragraph(gatePass,f2));
			c3.setHorizontalAlignment(Element.ALIGN_CENTER);
			c3.setVerticalAlignment(Element.ALIGN_MIDDLE);
			PdfPCell c4 = new PdfPCell(new Paragraph(gatePassNum,f2));
			c4.setHorizontalAlignment(Element.ALIGN_CENTER);
			c4.setVerticalAlignment(Element.ALIGN_MIDDLE);
			PdfPCell sc1 = new PdfPCell(new Paragraph("PREVIEW",f2));
			PdfPCell sc2 = new PdfPCell(new Paragraph("\nDate: \n"+ presentDate,f2));
			tableHeaderSub.addCell(sc1);
			tableHeaderSub.addCell(sc2);
			tableHeader.addCell(c1);
			tableHeader.addCell(c2);
			tableHeader.addCell(c3);
			tableHeader.addCell(c4);
			tableHeader.addCell(tableHeaderSub);
			
			
			PdfPTable tableName = new PdfPTable(1);
			String name = "Name : " + Name;
			c1  =  new PdfPCell(new Paragraph(name,f2));
			tableName.addCell(c1);
			
			
			
			
			
			PdfPTable tableCompany = new PdfPTable(3);
			tableCompany.setWidths(new float[] {1,4,4});
			
			String stores = "Person\nTaking\nStores";
			Paragraph person = new Paragraph(stores,f3);
			String staffId = " ";
			String designation = " ";
			String department = " ";
			String company = " ";
			String address = " ";
			if(rs10.next() == true) {
			
			staffId = rs10.getString("staff_id");
			designation = rs10.getString("designation");
			department = rs10.getString("department");
			}
			else {
			company = rs11.getString("company");
			address = rs11.getString("address");
			}
			
			
			
			
			String forBHEL = "\n BHEL Employee \n \nStaff No :  "+staffId+" \n" + "Designation :  "+designation+"\n" + "Department :  "+department+"\n" ;
			String nonBHEL ="\n Non BHEL \n \n Company Name : "+ company+" \n" + "Address :"+ address +"\n" ;
			 c1 = new PdfPCell(person);
			 c1.setHorizontalAlignment(Element.ALIGN_CENTER);
			 c1.setVerticalAlignment(Element.ALIGN_MIDDLE);
		     c2 = new PdfPCell(new Paragraph(forBHEL,f2));
			 c3 = new PdfPCell(new Paragraph(nonBHEL,f2));
			 tableCompany.addCell(c1);
			 tableCompany.addCell(c2);
			 tableCompany.addCell(c3);		
			 
			 
			 
			 PdfPTable tableMaterial = new PdfPTable(2);
			 tableMaterial.setWidths(new float[] {1,(float)5.5});
			 PdfPTable tableMaterialSub = new PdfPTable(5);
			 
				
			 String particulars = "Particulars";
		     String sNo = "SI.No. \n"; 
			 String description = "Description \n";
			 String unit = "Unit \n ";
			 String quantity = "Quantity \n";
			 String date = "Date of Return \n";
			
			 
			 PdfPCell k1 = new PdfPCell(new Paragraph(particulars,f3));
			 k1.setHorizontalAlignment(Element.ALIGN_CENTER);
			 k1.setVerticalAlignment(Element.ALIGN_MIDDLE);
			 PdfPCell k2 = new PdfPCell(new Paragraph(sNo,f2));
			 PdfPCell k3 = new PdfPCell(new Paragraph(description,f2));
			 PdfPCell k4 = new PdfPCell(new Paragraph(unit,f2));
			 PdfPCell k5 = new PdfPCell(new Paragraph(quantity,f2));
			 PdfPCell k6 = new PdfPCell(new Paragraph(date,f2));
			 
			 tableMaterialSub.addCell(k2);
			 tableMaterialSub.addCell(k3);
			 tableMaterialSub.addCell(k4);
			 tableMaterialSub.addCell(k5);
			 tableMaterialSub.addCell(k6);
			 
			 int count = 1;
			 
			 while(rs5.next()) {
	  
				  sNo  = String.valueOf(count) ;
				  description = rs5.getString("Materials");
				  unit = rs5.getString("Unit") ;
				  quantity = rs5.getString("Quantity");
				  date = rs5.getString("Date_of_return");
				 
				 
				  k2 = new PdfPCell(new Paragraph(sNo,f3));
				  k3 = new PdfPCell(new Paragraph(description,f3));
				  k4 = new PdfPCell(new Paragraph(unit,f3));
				  k5 = new PdfPCell(new Paragraph(quantity,f3));
				  k6 = new PdfPCell(new Paragraph(date,f3));
				 
				 tableMaterialSub.addCell(k2);
				 tableMaterialSub.addCell(k3);
				 tableMaterialSub.addCell(k4);
				 tableMaterialSub.addCell(k5);
				 tableMaterialSub.addCell(k6);
				 
				 count++;
				 
		 }
			 
			 tableMaterial.addCell(k1);
			 tableMaterial.addCell(tableMaterialSub);

			 
			 PdfPTable tableReciever = new PdfPTable(3);
			 tableReciever.setWidths(new float[] {1,4,4});
				String recieve = "TO WHOM SENT\n ";
				String recName = rs22.getString("name");
				String recdesg = rs22.getString("designation");
				String recdept = rs22.getString("dept");
				String recAddress = rs22.getString("address") + ", \n" + rs22.getString("city")+ ", " + rs22.getString("state") + ", \n" + rs22.getString("pincode"); 
				String reciever = "Name:"+ recName +"\n" + "Designation: " + recdesg + "\n" + "Department" + recdept + "\n" + "Address" + recAddress ;
				String purposeDetail = rs6.getString("Details");
				String purpose = "Purpose:"+ purposeDetail +"\n";
			    c1 = new PdfPCell(new Paragraph(recieve,f3));
			    c1.setHorizontalAlignment(Element.ALIGN_CENTER);
				c1.setVerticalAlignment(Element.ALIGN_MIDDLE);
				c2 = new PdfPCell(new Paragraph(reciever,f2));
				c3 = new PdfPCell(new Paragraph(purpose,f2));
				tableReciever.addCell(c1);
				tableReciever.addCell(c2);
				tableReciever.addCell(c3);
			
			PdfPTable tableItems = new PdfPTable(1);
			String n = rs4.getString("COUNT(PassNumber)");
			String items = "Total Number of Items in the Gate Pass : "+ n;
			c1  =  new PdfPCell(new Paragraph(items,f2));
			tableItems.addCell(c1);

			
			PdfPTable tableSignature = new PdfPTable(5);
			
			String signatureReciever  = "("+ Name +") \n"+ "Signature of Reciever";
			String signatureIncharge = "\n\n\n\n Name & Signature of CISF Gate Incharge on Return of Materials";
			String dateSignature = "Date";
			String time = "TIME \n IN/OUT";
			String register = "CISF Material Register Entry No." ;
		     c1 = new PdfPCell(new Paragraph(signatureReciever,f2));
		     c1.setHorizontalAlignment(Element.ALIGN_CENTER);
			 c1.setVerticalAlignment(Element.ALIGN_BOTTOM);
			 c2 = new PdfPCell(new Paragraph(signatureIncharge,f2));
			 c2.setHorizontalAlignment(Element.ALIGN_CENTER);
			 c2.setVerticalAlignment(Element.ALIGN_BOTTOM);
			 c3 = new PdfPCell(new Paragraph(dateSignature,f2));
			 c3.setHorizontalAlignment(Element.ALIGN_CENTER);
			 c3.setVerticalAlignment(Element.ALIGN_TOP);
			 c4 = new PdfPCell(new Paragraph(time,f2));
			 c4.setHorizontalAlignment(Element.ALIGN_CENTER);
			 c4.setVerticalAlignment(Element.ALIGN_TOP);
			 PdfPCell c5 = new PdfPCell(new Paragraph(register,f2));
			 c5.setHorizontalAlignment(Element.ALIGN_CENTER);
			 c5.setVerticalAlignment(Element.ALIGN_TOP);
			 tableSignature.addCell(c1);
			 tableSignature.addCell(c2);
			 tableSignature.addCell(c3);
			 tableSignature.addCell(c4);
			 tableSignature.addCell(c5);

			 PdfPTable tableGate = new PdfPTable(4);
				
				String signatureGateIncharge  = "\n\n\n\n Name & Signature of CISF Gate Incharge";
				String signatureCustodian = "\n\n\n\n  Name, Designation, Staff No. & Signature of Custodian";
				String vehicleNo = "Vehicle No.\n \n ";
				String signatureIssue = "\n\n\n\n Signature and Designation of Issuing Officer\n";
			     c1 = new PdfPCell(new Paragraph(signatureGateIncharge,f2));
			     c1.setHorizontalAlignment(Element.ALIGN_CENTER);
				 c1.setVerticalAlignment(Element.ALIGN_BOTTOM);
				 c2 = new PdfPCell(new Paragraph(signatureCustodian,f2));
				 c2.setHorizontalAlignment(Element.ALIGN_CENTER);
				 c2.setVerticalAlignment(Element.ALIGN_BOTTOM);
				 c3 = new PdfPCell(new Paragraph(vehicleNo,f2));
				 c3.setHorizontalAlignment(Element.ALIGN_CENTER);
				 c3.setVerticalAlignment(Element.ALIGN_TOP);
				 c4 = new PdfPCell(new Paragraph(signatureIssue,f2));
				 c4.setHorizontalAlignment(Element.ALIGN_CENTER);
				 c4.setVerticalAlignment(Element.ALIGN_BOTTOM);
				 tableGate.addCell(c1);
				 tableGate.addCell(c2);
				 tableGate.addCell(c3);
				 tableGate.addCell(c4);
				 

			
			document.add(p);
			document.add(blank);
			document.add(tableHeader);
			document.add(tableName);
			document.add(tableCompany);
			document.add(tableMaterial);
			document.add(tableReciever);
			document.add(tableItems);
			document.add(tableSignature);
			document.add(tableGate);
			
			
			document.close();
			
		
			connection.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
			
		    
		
}
}
