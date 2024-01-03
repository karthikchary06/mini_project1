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
.style3 {
	color: #FFFF00;
	font-weight: bold;
}
.style4 {color: #FFFF00}
-->
</style>
<script language="javascript" type='text/javascript'>
function loadFileAsText()
{
	var fileToLoad = document.getElementById("file").files[0];

	var fileReader = new FileReader();
	fileReader.onload = function(fileLoadedEvent) 
	{
		var textFromFileLoaded = fileLoadedEvent.target.result;
		document.getElementById("textarea").value = textFromFileLoaded;
	};
	fileReader.readAsText(fileToLoad, "UTF-8");
}
</script>
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
          <h2 class="style2">Upload Patient Details !!!</h2>
          <p><span class="style2">Role : (Patient)</span></p>
          <form id="form1" name="form1" method="post" action="P_Upload1.jsp">
            <p>&nbsp;</p>
            <table width="553" border="0" align="center">
			<%
			String pname=(String)application.getAttribute("pname");
			
			
			String strQuery2 = "select * from patient  where name='"+pname+"' ";
			ResultSet rs1=connection.createStatement().executeQuery(strQuery2);
			while(rs1.next())
			{
				String gender=rs1.getString(8);
				String email=rs1.getString(4);
				String mob=rs1.getString(5);
			
			
			%>
              <tr>
                <td height="42" bgcolor="#FF0000" ><span class="style3">Patient Name :- </span></td>
                <td><input  name="pname" type="text" id="t42" readonly="readonly" value="<%=application.getAttribute("pname")%>" size="49"/></td>
              </tr>
              <tr>
                <td width="286" height="42" bgcolor="#FF0000" ><span class="style3">File Name :- </span></td>
                <td width="356"><input required="required" name="tt" type="text" id="t42" size="49"/></td>
              </tr>
              <tr>
                <td height="34" bgcolor="#FF0000"><span class="style21 style23 style4"><strong>Enter Disease : </strong></span></td>
                <td><input name="disease" type="text"  size="49"  required="required" /></td>
              </tr>
              <tr>
                <td height="34" bgcolor="#FF0000"><span class="style21 style23 style4"><strong>Enter Age : </strong></span></td>
                <td><input name="age" type="text"  size="49"  required="required" /></td>
              </tr>
              <tr>
                <td height="34" bgcolor="#FF0000"><span class="style21 style23 style4"><strong>Blood Group : </strong></span></td>
                <td><input name="bloodgroup" type="text"  size="49"  required="required" /></td>
              </tr>
              <tr>
                <td height="34" bgcolor="#FF0000"><span class="style21 style23 style4"><strong>Gender : </strong></span></td>
                <td><input name="gender" type="text"  size="49"  readonly="readonly"  value="<%=gender%>"  /></td>
              </tr>
              <tr>
                <td height="34" bgcolor="#FF0000"><span class="style21 style23 style4"><strong>E-mail : </strong></span></td>
                <td><input name="email" type="text"  size="49" readonly="readonly"   value="<%=email%>" /></td>
              </tr>
              <tr>
                <td height="34" bgcolor="#FF0000"><span class="style21 style23 style4"><strong>Mobile No  : </strong></span></td>
                <td><input name="mob" type="text"  size="49" readonly="readonly"   value="<%=mob%>" /></td>
              </tr>
			  <%
			  
				ArrayList hosp=new ArrayList();
				
				String query="select * from  hospital ";
				Statement st=connection.createStatement();
				ResultSet rs =st.executeQuery(query);
				while(rs.next())
				{
					String hos=rs.getString(2);
					hosp.add(hos);
				}%>
              <tr>
                <td height="42" bgcolor="#FF0000" ><span class="style4"><strong>Select Hospital :- </strong></span></td>
                <td>
				  <select name="hospital" >
                  <option>-Select-</option>
                  <%for(int i=0;i<hosp.size();i++){%>
                  <option value="<%=hosp.get(i)%>"><%=hosp.get(i)%></option>
                  <%
				  }
				  
				 %>
                </select></td>
              </tr>
              <tr>
                <td height="37" bgcolor="#FF0000"><span class="style4"><strong>Select File :-</strong></span></td>
                <td><input required="required" type="file" name="t42" id="file"  onchange="loadFileAsText()" /></td>
              </tr>
			  	
              <tr>
                <td height="259">&nbsp;</td>
                <td><textarea name="text" id="textarea" cols="50" rows="15"></textarea></td>
              </tr>
              <tr>
                <td><div align="right"></div></td>
                <td><input type="submit" name="Submit" value="Encrypt" /></td>
              </tr><%}%>
            </table>
          </form>
          <p align="justify">&nbsp;</p>
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
  <div class="footer">
    <div class="footer_resize">
      <p class="lf">&nbsp;</p>
      <div class="clr"></div>
    </div>
  </div>
</div>
<div align=center></div>
</body>
</html>
