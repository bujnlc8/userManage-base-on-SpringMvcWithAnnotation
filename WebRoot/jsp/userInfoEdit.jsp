<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="pragma" content="no-cache">
<link rel="stylesheet"
	href="http://cdn.bootcss.com/twitter-bootstrap/3.3.4/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="http://cdn.bootcss.com/jquery/1.11.2/jquery.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
</head>
<body>
	<div>
		<form class="form-horizontal" id="userInfoEdit" name="userInfoEdit"
			action="userInfoEdit.do" method="post">
			<div class="form-group form-group-sm">
				<div class="form-group">
					<label class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-3">
						<input type="text" name="username"
							value='<c:out value="${userObject.username}"/>'
							class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">年龄</label>
					<div class="col-sm-3">
						<input type="text" name="userage"
							value="<c:out value='${userObject.userage}'/>"
							class="form-control">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">性别</label>
					<div class="col-sm-3">
						<input type="text" name="usersex"
							value="<c:out value='${userObject.usersex}'/>"
							class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">生日</label>
					<div class="col-sm-3">
						<input type="text" name="userbirthday" id="datepicker"
							value="<c:out value='${userObject.userbirthday}'/> "
							class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">地址</label>
					<div class="col-sm-3">
						<input type="text" name="useraddress"
							value="<c:out value='${userObject.useraddress}'/>"
							class="form-control" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">工作</label>
					<div class="col-sm-3">
						<input type="text" name="userjob"
							value="<c:out value='${userObject.userjob}'/>"
							class="form-control" />
					</div>
					</div>
				<div class="form-group"><div class="col-sm-offset-2 col-sm-10"><input type="button" id="saveInfo" onclick="saveUserEdit();"
					value="保存" class="btn btn-primary" class="form-control" /> <input
					type="hidden" name="qqId"
					value="<c:out value='${userObject.userid}'/>" /></div>
					</div>
		</form>
	</div>
	<script type="text/javascript">
		$(function() {
			$("#datepicker").datepicker({
				dateFormat : "yy-mm-dd",
				maxDate : "+0d",
				gotoCurrent : true,
				yearRange : "1970:2015",
				showAnim : "fold"
			});
		});
		function saveUserEdit() {
			userInfoEdit.submit();
		}
		window.onload = function() {
			var mytime=$("#datepicker").val();
			var strs = new Array();
			strs = mytime.split("-");
		    var str1,str2,str3;
		    str1=strs[0]+"-";
		    if(strs[1].trim().length==1)
		    	{
		    	str2="0"+strs[1]+"-";
		    	}else
		    		{
		    		str2=strs[1]+"-";
		    		}
		    if(strs[2].trim().length==1)
		    	{
		    	str3="0"+strs[2];
		    	}else{
		    		str3=strs[2];
		    	}
			$("#datepicker").val((str1+str2+str3).trim());
		}
	</script>
</body>
</html>
