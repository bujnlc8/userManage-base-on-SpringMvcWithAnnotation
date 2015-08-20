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
		<form class="form-horizontal" id="userInfoDetail"
			name="userInfoDetail">
			<div class="form-group form-group-sm">
				<div class="form-group">
					<label class="col-sm-2 control-label">ID</label>
					<div class="col-sm-3">
						<input type="text" name="username"
							value='<c:out value="${userObject.userid}"/>'
							class="form-control" readonly>
					</div>
				</div>
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
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="button" onclick="goback();"
							value="返回" class="btn btn-primary" class="form-control" />
					</div>
				</div>
		</form>
	</div>
	<script type="text/javascript">
		function goback() {
			window.location = "userInfoList.do";
		}
		window.onload = function() {
			var mytime = $("#datepicker").val();
			$("#datepicker").val(mytime.substr(0, 7));
		}
	</script>
</body>
</html>
