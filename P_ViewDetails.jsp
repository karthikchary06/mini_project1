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
<title><%=application.getAttribute("pname")%> (Patient)</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/georgia.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 23px}
.style2 {	color: #FF0000;
	font-weight: bold;
}
.style21 {font-size: 14px}
.style24 {color: #FF0000}
.style25 {color: #FFFF00}
.style26 {
	font-size: 14px;
	color: #FFFF00;
	font-weight: bold;
}
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
          <li class="active"><a href="P_Main.jsp">Hi <%=application.getAttribute("pname")%> !! (Patient)</a></li>
          <li><a href="P_Login.jsp">Logout</a></li>
        </ul>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
    <div class="content_resize">
      <div class="mainbar">
        <div>
          <h2 class="style24">View Uploaded Details !!!</h2>
          <p><span class="style2">Role : (Patient)</span></p>
          <p>&nbsp;</p>
          <table width="619" border="1.5" style="border-collapse:collapse" cellpadding="0" cellspacing="0"  align="center">
            <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8,s9="",s10,s11,s12,s13;
	int i=0,j=0,k=0;
try 
	{		
		
				%>
            <tr>
              <td width="28" height="30" bgcolor="#FF0000"><div align="center" class="style21 style25"><strong> ID </strong></div></td>
              <td width="98" bgcolor="#FF0000"><div align="center" class="style26">Details/File  </div></td>
              <td width="75" bgcolor="#FF0000"><div align="center" class="style26">Hospital</div></td>
              <td width="77" bgcolor="#FF0000"><div align="center" class="style26">Doctor</div></td>
              <td width="170" bgcolor="#FF0000"><div align="center" class="style26">Status </div></td>
              <td width="92" bgcolor="#FF0000"><div align="center" class="style26">Verify  </div></td>
            </tr>
            <%
				String pname=(String)application.getAttribute("pname");

				String query="Select *from files where patient='"+pname+"' "; 
				Statement st=connection.createStatement();
				ResultSet rs=st.executeQuery(query);
				while ( rs.next() )
				{
					i=rs.getInt(1);
					s2=rs.getString(2);
					s3=rs.getString(9);
					s4=rs.getString(10);
					s5=rs.getString(11);
					s6=rs.getString(8);
					String keys = "ef50a0ef2c3e3a5f";
					byte[] keyValue = keys.getBytes();
					Key key = new SecretKeySpec(keyValue, "AES");
					Cipher c = Cipher.getInstance("AES");
					c.init(Cipher.DECRYPT_MODE, key);
					String dt1 = new String(Base64.decode(s3.getBytes()));

					
					%>
            <tr>
              <td height="28"><div align="center"><%=i%></div></td>
              <td><div align="center"><a href="P_FileDetails.jsp?fname=<%=s2%>"><%=s2%></a></div></td>
              <td><div align="center"><%=dt1%></div></td>
              <td><div align="center"><%=s4%></div></td>
			  <%if(s5.equalsIgnoreCase("Scheduled")){%>
              <td><div align="center"><span class="style24"><%=s5%> </span><a href="P_ViewSch_date.jsp?fname=<%=s2%>">View Timings & Treatment Details</a></div></td>
			  <%}else if(s5.equalsIgnoreCase("No")){%>
              <td><div align="center"><span class="style24">Not Scheduled</div></td>
			  <%}else{%>
              <td width="17"><div align="center"><%=s5%></div></td>
			  <%}%>
              <td width="44"><div align="center"><a href="P_FileVerify.jsp?fname=<%=s2%>">Verify.</a></div></td>
            </tr>
            <%
			  
				}
	connection.close();
	}
	catch(Exception e)
	{
	out.println(e.getMessage());
	}
%>
          </table>
          <p>&nbsp;</p>
          <p align="right"><a href="P_Main.jsp">Back</a></p>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <ul class="sb_menu">
			<li><a href="P_Main.jsp">Home</a></li>
			<li><a href="P_Login.jsp">Logout</a></li>
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
