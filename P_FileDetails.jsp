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
.style32 {font-size: 12px}
.style34 {color: #FFFFFF}
.style35 {font-size: 12px; color: #FFFFFF; }
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
          <h2 class="style2">View Uploaded Details !!!</h2>
          <p><span class="style2">Role : (Patient)</span></p>
          <p>&nbsp;</p>
          <%	  
			  
			  
	String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9="",s10="",s11="",s12,s13,s14;
	int i=0,j=0,k=0;
String fname=request.getParameter("fname");	
String pname=(String)application.getAttribute("pname");	

try 
	{
      		String query="Select *from files where fname='"+fname+"'"; 
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
					s10=rs.getString(10);
					s11=rs.getString(11);
					s12=rs.getString(12);
					s13=rs.getString(13);
					s14=rs.getString(14);
					
					String strQuery2 = "select * from patient  where name='"+s8+"' ";
			ResultSet rs1=connection.createStatement().executeQuery(strQuery2);
			while(rs1.next())
			{
				String gender=rs1.getString(8);
				String email=rs1.getString(4);
				String mob=rs1.getString(5);
					
						String keys = "ef50a0ef2c3e3a5f";
      			byte[] keyValue = keys.getBytes();
      			Key key = new SecretKeySpec(keyValue, "AES");
      			Cipher c = Cipher.getInstance("AES");
      			c.init(Cipher.DECRYPT_MODE, key);
      			String decryptedValue = new String(Base64.decode(s3.getBytes()));
      			String dt1 = new String(Base64.decode(s7.getBytes()));
				
      			String s91 = new String(Base64.decode(s9.getBytes()));
      			String s121 = new String(Base64.decode(s12.getBytes()));
      			String s141 = new String(Base64.decode(s14.getBytes()));
						%>
          <table width="499" border="2" style="border-collapse:collapse" cellpadding="0" cellspacing="0" align="center">
            <tr>
              <td width="159" height="36" bgcolor="#FF0000"><div align="center" class="style29 style32 style34">
                  <div align="left"><strong> ID :</strong></div>
              </div></td>
              <td width="393"><label>
                <input readonly="readonly"  name="textfield" type="text" value="<%=i%>" size="49" />
                </label>              </td>
            </tr>
			 <tr>
              <td height="36" bgcolor="#FF0000"><div align="center" class="style35">
                  <div align="left"><strong>Patient Name : </strong></div>
              </div></td>
              <td><input readonly="readonly"  name="pname" type="text" size="49" value="<%=pname%>" />              </td>
            </tr>
            <tr>
              <td height="36" bgcolor="#FF0000"><div align="center" class="style35">
                  <div align="left"><strong>File Name : </strong></div>
              </div></td>
              <td><input readonly="readonly"  name="textfield2" type="text" size="49" value="<%=s2%>" />              </td>
            </tr>
			<tr>
              <td height="36" bgcolor="#FF0000"><div align="center" class="style35">
                  <div align="left"><strong>Disease :</strong></div>
              </div></td>
              <td><input readonly="readonly"  name="textfield33" type="text" value="<%=s121%>" size="49" /></td>
            </tr>
			<tr>
              <td height="36" bgcolor="#FF0000"><div align="center" class="style35">
                  <div align="left"><strong>Age :</strong></div>
              </div></td>
              <td><input readonly="readonly"  name="textfield33" type="text" value="<%=s13%>" size="49" /></td>
            </tr>
			<tr>
              <td height="36" bgcolor="#FF0000"><div align="center" class="style35">
                  <div align="left"><strong>BloodGroup :</strong></div>
              </div></td>
              <td><input readonly="readonly"  name="textfield33" type="text" value="<%=s141%>" size="49" /></td>
            </tr>
			<tr>
              <td height="36" bgcolor="#FF0000"><div align="center" class="style35">
                  <div align="left"><strong>Gender :</strong></div>
              </div></td>
              <td><input readonly="readonly"  name="textfield33" type="text" value="<%=gender%>" size="49" /></td>
            </tr>
			<tr>
              <td height="36" bgcolor="#FF0000"><div align="center" class="style35">
                  <div align="left"><strong>Email :</strong></div>
              </div></td>
              <td><input readonly="readonly"  name="textfield33" type="text" value="<%=email%>" size="49" /></td>
            </tr>
			<tr>
              <td height="36" bgcolor="#FF0000"><div align="center" class="style35">
                  <div align="left"><strong>Mobile :</strong></div>
              </div></td>
              <td><input readonly="readonly"  name="textfield33" type="text" value="<%=mob%>" size="49" /></td>
            </tr>
			<tr>
              <td height="36" bgcolor="#FF0000"><div align="center" class="style35">
                  <div align="left"><strong>Hospital :</strong></div>
              </div></td>
              <td><input readonly="readonly"  name="textfield33" type="text" value="<%=s91%>" size="49" /></td>
            </tr>
            <tr>
              <td height="36" bgcolor="#FF0000"><div align="center" class="style35">
                  <div align="left"><strong>Doctor :</strong></div>
              </div></td>
              <td><input readonly="readonly"  name="textfield33" type="text" value="<%=s10%>" size="49" /></td>
            </tr>
            <tr>
              <td height="186" bgcolor="#FF0000"><div align="center" class="style35">
                  <div align="left"><strong>Contents :</strong></div>
              </div></td>
              <td><label>
                <textarea readonly="readonly" rows="10"  cols="50"  name="textarea"><%=decryptedValue%></textarea>
                </label>              </td>
            </tr>
            <tr>
              <td height="36" bgcolor="#FF0000"><div align="center" class="style35">
                  <div align="left"><strong>Trapdoor :</strong></div>
              </div></td>
              <td><input readonly="readonly"  name="textfield3" type="text" value="<%=s4%>" size="49" /></td>
            </tr>
            <tr>
              <td height="36" bgcolor="#FF0000"><div align="center" class="style35">
                  <div align="left"><strong>Secret Key  : </strong></div>
              </div></td>
              <td><input readonly="readonly"  name="textfield32" type="text" value="<%=s5%>" size="49" /></td>
            </tr>
            <tr>
              <td height="36" bgcolor="#FF0000"><div align="center" class="style35">
                  <div align="left"><strong>Rank :</strong></div>
              </div></td>
              <td><input readonly="readonly"  name="textfield33" type="text" value="<%=s6%>" size="49" /></td>
            </tr>
            <tr>
              <td height="36" bgcolor="#FF0000"><div align="center" class="style35">
                  <div align="left"><strong>Date &amp; Time :</strong></div>
              </div></td>
              <td><input readonly="readonly"  name="textfield33" type="text" value="<%=dt1%>" size="49" /></td>
            </tr>
            <tr>
              <td height="36" bgcolor="#FF0000"><div align="center" class="style35">
                  <div align="left"><strong>Status : </strong></div>
              </div></td>
              <%if (s11.equalsIgnoreCase("No")){%>
              <td ><input readonly="readonly"  name="textfield34" type="text" value="Not Scheduled" size="49" /></td>
              <%}else{%>
              <td ><input readonly="readonly"  name="textfield34" type="text" value="<%=s11%>" /></td>
              <%}%>
              <%
				}	}
           connection.close();
	  }
	 
	  catch(Exception e)
	  {
		out.println(e.getMessage());
	  }
%>
            </tr>
          </table>
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
