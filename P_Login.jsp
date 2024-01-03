<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Patient Login</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/georgia.js"></script>
<script type="text/javascript" src="js/cuf_run.js"></script>
<style type="text/css">
<!--
.style1 {font-size: 23px}
.style2 {
	color: #FF0000;
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
          <li><a href="index.html">Home</a></li>
          <li class="active"><a href="P_Login.jsp">Patient</a></li>
          <li><a href="D_Login.jsp">Doctor</a></li>
          <li><a href="A_Login.jsp">Cloud</a></li>
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
          <h2 class="style2">Patient Login !!!</h2>
          <p><img src="images/login.jpg"/A Three Layer Privacy Preserving Cloud Storage Scheme/images/login.jpg" width="180" height="126" /></p>
          <form action="P_Authentication.jsp" method="post" id="leavereply">
            <label for="name"> <br />
              <span class="style2">Name (required)&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; </span></label>
            <span class="style2">
            <input name="userid" type="text" class="box" id="name" value="" />
            <label for="email"><br />
            <br />
            Password (required) </label>
            </span>
            <strong>
            <label for="email"></label>
            </strong>
            <label for="email">&nbsp;&nbsp; </label>
            <input type="password" id="pass" name="pass" class="box" />
            <p>&nbsp;</p>
            <p>
              <input name="imageField" type="submit"  class="LOGIN" id="imageField" value="Login" />
              <input type="reset" name="imageField" id="imageField"  class="RESET" />
            </p>
            <p><span class="style2">New User? click here to</span> <a href="P_Register.jsp"> Register</a><br />
            </p>
          </form>
        </div>
      </div>
      <div class="sidebar">
        <div class="gadget">
          <h2 class="star">Menu</h2>
          <ul class="sb_menu">
			<li><a href="index.html">Home</a></li>
			<li><a href="P_Login.jsp">Patient</a></li>
			<li><a href="D_Login.jsp">Doctor</a></li>
			<li><a href="A_Login.jsp">Cloud</a></li>
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
