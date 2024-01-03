<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@page import ="java.util.*"%>
<%@ include file="connect.jsp" %>
    <%@page import ="java.util.*,java.security.Key,java.util.Random,javax.crypto.Cipher,javax.crypto.spec.SecretKeySpec,org.bouncycastle.util.encoders.Base64"%>
    <%@ page import="java.sql.*,java.util.Random,java.io.PrintStream,java.io.FileOutputStream,java.io.FileInputStream,java.security.DigestInputStream,java.math.BigInteger,java.security.MessageDigest,java.io.BufferedInputStream" %>
<%@ page import ="java.security.Key,java.security.KeyPair,java.security.KeyPairGenerator,javax.crypto.Cipher"%>
 <%@page import ="java.util.*,java.text.SimpleDateFormat,java.util.Date,java.io.FileInputStream,java.io.FileOutputStream,java.io.PrintStream"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Cloud</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/georgia.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 23px}
.style3 {font-size: 18}
.style28 {color: #FFFFFF; font-weight: bold; }
-->
</style>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><span class="style6"><a href="index.html" class="style1">STREAMLINED AND SECURE DATA DEDUPLICATION METHOD FOR HEALTH RECORDS</a></span></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="A_Main.jsp">CloudServer</a></li>
          <li><a href="A_Login.jsp">Logout</a></li>
        </ul>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div class="article">
          <h2><span>Generate Bill </span></h2>
          <p>&nbsp;</p>
            <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
try 
	{		
		
							
				String id=request.getParameter("id");
				String query="Select *from scheduled_patients where id='"+id+"' "; 
				Statement st=connection.createStatement();
				ResultSet rs=st.executeQuery(query);
				while ( rs.next() )
				{
				
					i=rs.getInt(1);
					s2=rs.getString(2);
					s3=rs.getString(3);
					s4=rs.getString(4);
					s5=rs.getString(5);
					s6=rs.getString(6);
					s7=rs.getString(7);
					s8=rs.getString(8);		
					s9=rs.getString(9);		
					
					String query1="Select *from files where patient='"+s2+"' and fname='"+s8+"' "; 
					Statement st1=connection.createStatement();
					ResultSet rs1=st1.executeQuery(query1);
					if ( rs1.next() )
					{		
						String disease=rs1.getString(12);
						
						%>
						<form id="form1" name="form1" method="post" action="A_GenerateBill2.jsp">
						<table width="603" border="0" align="center" cellpadding="0" cellspacing="0">
						  <tr>
							<td width="264" height="25" bgcolor="#FF0000"><span class="style28">Patient Name : </span></td>
							<td width="339"><label>
							  <input type="text" name="pname" readonly="readonly" value="<%=s2%>"/>
							</label>						    </td>
						  </tr>
						  <tr>
							<td height="25" bgcolor="#FF0000"><span class="style28">Doctor Name : </span></td>
							<td><input type="text" name="dname" readonly="readonly" value="<%=s3%>" />						    </td>
						  </tr>
						  <tr>
                            <td height="25" bgcolor="#FF0000"><span class="style28">Details/Files : </span></td>
						    <td><input type="text" name="fname"  readonly="readonly" value="<%=s8%>" />					        </td>
					      </tr>
						  <tr>
                            <td height="25" bgcolor="#FF0000"><span class="style28">Scheduled D&amp;T : </span></td>
						    <td><input type="text" name="sch_dt" readonly="readonly"  value="<%=s5%>,<%=s6%>"/>					        </td>
					      </tr>
						  <tr>
							<td height="139" bgcolor="#FF0000"><span class="style28">Treatment Provided : </span></td>
							<td>
							  <label>
							    <textarea name="treatment" readonly="readonly" cols="45" rows="8"><%=s9%></textarea>
						      </label>							</td>
						  </tr>
						  <tr>
							<td height="25" bgcolor="#FF0000"><span class="style28">Enter Amount To Be Paid By Patient : </span></td>
							<td>
							  <label>
							    <input type="text" name="amount" />
						      </label>							</td>
						  </tr>
						  <tr>
							<td height="61">&nbsp;</td>
							<td><label>
							  <input type="submit" name="Submit" value="Submit" />
							</label></td>
						  </tr>
		  </table>
		  </form>
						<%
						
			  		}					
				}
			connection.close();
		}
		catch(Exception e)
		{
		out.println(e.getMessage());
		}
		
		%>
          <p>&nbsp;</p>
          <p align="right"><a href="A_Main.jsp">Back</a></p>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <ul class="sb_menu">
			<li><a href="A_Main.jsp">Home</a></li>
			<li><a href="A_Login.jsp">Logout</a></li>
		  </ul>
        </div>
        <div class="gadget"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg"></div>
  <div class="footer"></div>
</div>
<div align=center></div>
</body>
</html>