<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<link rel="stylesheet" href="http://cdn.bootcss.com/twitter-bootstrap/3.3.4/css/bootstrap.min.css">  
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://cdn.bootcss.com/jquery/1.10.2/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  </head>
  <body>
   <form>
  <table class="table">
  <tr>
  <td>用户名</td><td><input type="text" name="qName" id ="qName" ></td>
  </tr>
  <tr>
  <td>密码</td><td><input type="password" name="qPassword" id ="qPassword" ></td>
  </tr>
  <tr><td colspan="2"><input id="btn_sub" type="button" value="登陆" onclick="javascript:checkValid();"></td></tr>
  <label id="tip" style="display:none"></label>
  </table> 
   </form>
   <script>
   function checkValid()
   {
	  $.ajax({
		  type:"GET",
		  url:"user/isuserValid.do",
		  data:{name:$("#qName").val(),password:$("#qPassword").val()
			  },
		  success : function(data) {
				var result = data;
				if ("valid" == result) {
					$("#tip").hide();
					$("#btn_sub").removeAttr("disabled");
					window.location ="user/userInfoList.do";
				} else if ("invalid" == result) {
					document.getElementById('tip').innerHTML = "用户名或密码错误！";
					$("#tip").show();
					$("#btn_sub").attr("disabled", "disabled");
				}else if("isBlank"==result)
					{
					document.getElementById('tip').innerHTML ="请输入用户名和密码！";
					$("#tip").show();
					$("#btn_sub").attr("disabled", "disabled");
					}
			}
		});
   } 
   </script>
  </body>
</html>
