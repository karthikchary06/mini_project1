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
.style19 {font-size: 16px}
.style20 {color: #FF0000}
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
        <div class="article">
          <h2><span class="style2"> Account Status </span><span class="style2">!!!</span></h2>
          <p><span class="style2">Role : (Patient)</span></p>
          <p>&nbsp;</p>
          <h3>&nbsp;          </h3>
          <h3>
            <%		  
			String pname=(String)application.getAttribute("pname");
		  String bank=request.getParameter("bank");
          String branch=request.getParameter("branch");
          String accno=request.getParameter("accno");
          String mobno=request.getParameter("mobno");
          String email=request.getParameter("email");
          String amount=request.getParameter("amount");
		  
		  String sql="select *from bank_account where bank='"+bank+"' and branch='"+branch+"' and account_no='"+accno+"'";
		  ResultSet rs=connection.createStatement().executeQuery(sql);
		  if(rs.next())
		  {
		  
					%>
            <span class="style20 style19"><strong>Account Details Already Added For Account No <%=accno%> With Username : <%=pname%></strong></span></h3>
          <h3><span class="style20 style19"><strong><br />
            </strong></span> 
            <span class="style2">
            <%
		  }
		  else
		  {		  
		  
				int r=  connection.createStatement().executeUpdate("insert into Bank_account(pname,bank,branch,account_no,mobile_no,email_id,total_amount)values('"+pname+"','"+bank+"','"+branch+"','"+accno+"','"+mobno+"','"+email+"','"+amount+"')");
				if(r==1)
				{
					%>
             Account Details For Account No <%=accno%> Added Sucessfully For</span><span class="style19"><span class="style20"> <%=pname%> </span></span>
            <%
				}
		  }
		  
		  
          %>
          </h3>
          <p align="right"><a href="P_BankAcc.jsp">Back</a></p>
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
