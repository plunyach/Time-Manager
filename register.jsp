<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*"  errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<title>Registration Form</title>
		<style type="text/css">
			#output {
					position:absolute;
					width:1100px;
					height:368px;
					z-index:1;
					left: 6px;
					top: 3px;
					list-style:none;
					text-decoration:none;
					}
	   
       </style>
		</head>
			<body bgcolor="#FFCCFF">
				<div id="output"><font size="20">
				<marquee direction="left"><p> Welcome You are successfully login</p></marquee>
				<%
				String fn=request.getParameter("fn");
				String sn=request.getParameter("sn");
				String email=request.getParameter("email");
				String password=request.getParameter("password");
				String repassword=request.getParameter("repassword");
				String sex=request.getParameter("sex");			
				String atemail=request.getParameter("aemail");
				String phone=request.getParameter("phone");
				String mobile=request.getParameter("mobile");
				String ques1=request.getParameter("ques1");
				String ans1=request.getParameter("ans1");
				String ques2=request.getParameter("ques2");
				String ans2=request.getParameter("ans2");
				String veri=request.getParameter("verification");
					try{
						Class.forName("com.mysql.jdbc.Driver");
						Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/study","root","");
						Statement st=con.createStatement();
											
				String query="insert into register_tb(fname,lname,email,password,sex,aemail,phone,mobile,ques1,ans1,ques2,ans2) values('"+fn+"','"+sn+"','"+email+"','"+password+"','"+sex+"','"+atemail+"','"+phone+"','"+mobile+"','"+ques1+"','"+ans1+"','"+ques2+"','"+ans2+"')";
						
							st.executeUpdate(query);
							%><jsp:forward page="index.html"/><%
						}
						catch(ClassNotFoundException c){
							out.println(c);
						}
						catch(SQLException s){
							out.println(s);
						}
						%>
		
		</font>
		</div>
	</body>
</html>
