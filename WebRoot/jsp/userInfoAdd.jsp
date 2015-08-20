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
<script type="text/javascript"
	src="http://validform.rjboy.cn/Validform/v5.3.2/Validform_v5.3.2.js"></script>
</head>
<body>
	<div>
		<form class="form-horizontal" id="userInfoAdd" name="userInfoAdd"
			class="userInfo"  action="userInfoAdd.do" method="post">
			<div class="form-group form-group-sm">
				<div class="form-group">
					<label class="col-sm-2 control-label">姓名</label>
					<div class="col-sm-3">
						<input type="text" name="username" class="form-control"
							datatype="*1-20" nullmsg="请输入1-20位的字符">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">年龄</label>
					<div class="col-sm-3">
						<input type="text" name="userage" class="form-control"
							datatype="n1-2" nullmsg="请输入1-2位的数字">
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">性别</label>
					<div class="col-sm-3">
						<input type="text" name="usersex" class="form-control"
							datatype="/男|女/" nullmsg="请输入‘男’或‘女’" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">生日</label>
					<div class="col-sm-3">
						<input type="text" name="userbirthday" id="datepicker"
							class="form-control" /><span>选择或手动输入yyyy-mm-dd格式的日期</span>
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">地址</label>
					<div class="col-sm-3">
						<input type="text" name="useraddress" class="form-control"
							ignore="ignore" />
					</div>
				</div>
				<div class="form-group">
					<label class="col-sm-2 control-label">工作</label>
					<div class="col-sm-3">
						<input type="text" name="userjob" class="form-control"
							ignore="ignore" />
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<input type="button" id="saveInfo" value="保存"
							class="btn btn-primary" class="form-control" />
					</div>
				</div>
			</div>
		</form>
		</div>
	<script>
			$(function() {
				$("#userInfoAdd").Validform({
					btnSubmit : "#saveInfo",
					tiptype : 3,
					beforeSubmit : function() {
					return confirm("确认新增人员吗？");
					}
				});
				$("#datepicker").datepicker({
					dateFormat : "yy-mm-dd",
					maxDate : "+0d",
					gotoCurrent : true,
					yearRange : "1970:2015",
					showAnim : "fold"
				});
			});
		</script>
</body>
</html>
