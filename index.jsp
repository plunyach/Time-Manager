<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript" src="validation.js"></script>

	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
		<title>Login Form jsp</title>
			<style type="text/css">
				#invalid {
						position:absolute;
						width:673px;
						height:115px;
						z-index:1;
						left: 10px;
						top: 81px;
						}
				#invalid ul{
						list-style:none;
						}
				#invalid a{
						text-decoration:none;
						}
            </style>
	</head>
				<body>
					<%
						String name=request.getParameter("username");
						String pass=request.getParameter("password");
						
							try{
								 HttpSession hs=request.getSession(true);
										if(session.isNew()!=true)
											{
											session.setAttribute("NAME1",name);		
											}


								Class.forName("com.mysql.jdbc.Driver");
								Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/study","root","");
								Statement st=con.createStatement();
								Statement tt=con.createStatement();
								String query1="select password from register_tb where fname='"+name+"'";
								String query2="select password from register_student where fname='"+name+"'";
								
								
								ResultSet rs=st.executeQuery(query1);
								
								ResultSet dd=tt.executeQuery(query2);
								
							
						if(rs.next()){
								
									if(pass.equals(rs.getString(1))){
									out.println("****password matched********");
										
											
										
												%>
												<jsp:forward page="staff/index.jsp"/>
												<%
												
									}
									else{
												if(dd.next()){
								
														if(pass.equals(dd.getString(1))){
														//out.println("****password matched********");
															
																
															
																	%>
																	<jsp:forward page="student/index.jsp"/>
																	<%
																												
													    }
													
												}
								}
						}
								
								
							else	if(dd.next()){
								
													if(pass.equals(dd.getString(1))){
													//out.println("****password matched********");
														
															
														
																%>
																<jsp:forward page="student/index.jsp"/>
																<%
																
													}
									else{
													if(rs.next()){
												
													if(pass.equals(rs.getString(1))){
													//out.println("****password matched********");
														
															
														
																%>
																<jsp:forward page="staff/index.jsp"/>
																<%
																
													
												}
												
												}
										}
								}
								
								
								
								
								else {
									%>
												<jsp:forward page="index.html"/>
												<%
								}
							}	
						
							catch(SQLException s){
								out.println(s);
								}
							catch(ClassNotFoundException c){
								out.println(c);
								}
					%>		
			
		             
				</body>
</html>
