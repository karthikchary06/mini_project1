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
.style26 {font-size: 18px}
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
        <div >
          <h2><span>File Verify</span> Status </h2>
          <p><span class="style2">Role : (Patient)</span></p>
          <p>&nbsp;</p>
          <h3><%
		  
		  String fname=request.getParameter("fname");
		  String pname=(String)application.getAttribute("pname");
		  
		  String sql1="select * from files where patient='"+pname+"' and fname='"+fname+"'";
		  Statement st1=connection.createStatement();
		  ResultSet rs1=st1.executeQuery(sql1);
		  if(rs1.next())
		  {
		  	
			String trap=rs1.getString(4);
		  	
			  String sql="select * from files_backup where patient='"+pname+"' and fname='"+fname+"'";
			  Statement st=connection.createStatement();
			  ResultSet rs=st.executeQuery(sql);
			  if(rs.next())
			  {
				String backup_trap=rs.getString(4);
				
				if(trap.equalsIgnoreCase(backup_trap))
				{
					%>
            <span class="style26">Details/File Is Safe</span><br /><%
				}
				else
				{
					%>
            <span class="style26">Details/File Is Not Safe <a href="P_FileVerify1.jsp?fname=<%=fname%>">Click Here </a>To Recover</span>
            <%
				}
			  }
		  }
		  
		  %>
          </h3>
          <p align="justify"><a href="P_Main.jsp">Back</a></p>
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
