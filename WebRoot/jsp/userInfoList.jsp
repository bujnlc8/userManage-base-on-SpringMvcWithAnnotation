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
	<div id="selectOption" align="center">
		<form id="userInfoList" name="userInfoList"
			action="userInfoList.do" method="post">
			<table class="table">
				<tr>
					<td width="20px">用户名：</td>
					<td align="center" height="30px"><input id="username"
						name="username" type="text" class="form-control" width="100px"></td>
					<td>年龄:</td>
					<td align="center"><input name="userage" id="userage"
						type="text" class="form-control">
					</td>
				</tr>
				<tr>
					<td>性别:</td>
					<td align="center"><input name="usersex" id="usersex"
						type="text" class="form-control">
					</td>
					<td>地址:</td>
					<td align="center"><input name="useraddress" id="useraddress"
						type="text" class="form-control"></td>
				</tr>
			</table>
			<div align="center">
				<input type="button" id="btn_submit"
					onclick="javascript:toSearch();" value="查询" class="btn btn-primary"
					style="margin-top:15px;" />
				</td> <input type="button" id="bbtn_reset" onclick="javascript:toReset()"
					value="重置" class="btn btn-primary"
					style="margin-top:15px;margin-left:200px" />
				</td>
			</div>
		</form>
	</div>
	<div id="userInfo">
		<form id="infoList" name="infoList" method="post">
			<table width="70%" align="center" class="table  table-hover">
				<tr>
					<th width="10%"><input type="checkbox" class="user_cb"
						id="checkAll" onclick="javascript:selectAll();" title="全部选中">
					</th>
					<th width="10%" align="center">姓名</th>
					<th width="10%" align="center">年龄</th>
					<th width="10%" align="center">性别</th>
					<th width="10%" align="center">生日</th>
					<th width="10%" align="center">地址</th>
					<th width="10%" align="center">工作</th>
					<th width="10%" align="center">操作</th>
				</tr>
				<c:forEach items="${userInfo}" varStatus="stat" var="item">
					<tr>
						<td><input type="checkbox" name="qqIds"
							value="<c:out value='${item[0]}'/>"
						</td>
						<td><c:out value="${item[1] }" />
						</td>
						<td><c:out value="${item[2] }" />
						</td>
						<td><c:out value="${item[5] }" />
						</td>
						<td><c:out value="${item[3] }" />
						</td>
						<td><c:out value="${item[4] }" />
						</td>
						<td><c:out value="${item[6] }" />
						</td>
						<td><a
							href="javascript:userInfoDetail('<c:out value="${item[0] }"/>')"><font
								size="2">查看</font> </a> &nbsp;<a
							href="javascript:goUserInfoEdit('<c:out value="${item[0] }"/>')"><font
								size="2">编辑</font> </a> &nbsp;<!--<a
							href="javascript:goUserRoleEdit('<c:out value="${item[0] }"/>')"><font size="2">角色</font></a>-->
						</td>
					</tr>
				</c:forEach>
			</table>
			<div align="center">
				<input type="button" id="todelete" value="删除"
					style="margin-top:15px;" onclick="javascript:toDelete();"
					class="btn btn-primary" /><input type="button" id="add" value="增加"
					style="margin-top:15px;margin-left:200px" onclick="toAdd()"
					class="btn btn-primary" />
			</div>
			<input type="hidden" name="qqId" />
		</form>
	</div>
	<script type="text/javascript">
		var flag = true;
		function selectAll() {
			if (flag) {
				var inputs = document.getElementsByTagName("INPUT");
				for ( var i = 0; i < inputs.length; i++) {
					if (inputs[i].type == "checkbox"
							&& inputs[i].id != "checkAll"
							&& inputs[i].disabled == false) {
						inputs[i].checked = true;
					}
				}
				flag = false;
			} else {
				var inputs = document.getElementsByTagName("INPUT");
				for ( var i = 0; i < inputs.length; i++) {
					if (inputs[i].type == "checkbox"
							&& inputs[i].id != "checkAll") {
						inputs[i].checked = false;
					}
				}
				flag = true;
			}
		}
		function toSearch() {
			var frm = document.userInfoList;
			frm.submit();
		}
		function toReset() {
			var inputs = document.getElementsByTagName("input");
			for ( var i = 0; i < 4; i++) {
				inputs[i].value = "";
			}
		}
		$("#datepicker").datepicker({
			dateFormat : "yymmdd",
			maxDate : "+0d",
			gotoCurrent : true,
			yearRange : "1970:2015",
			showAnim : "fold"
		});
		function toDelete() {
			if ($(":checked").length == 0) {
				alert("please select one at least!");
			} else {
				if (confirm("确定删除所选吗？")) {
					var frm = document.infoList;
					frm.action = "deleteUserInfo.do";
					frm.submit();
				}
			}
		}
		function toAdd() {
			window.location = "goUserInfoAdd.do";
		}
		function goUserInfoEdit(id) {
			infoList.qqId.value = id;
			infoList.action = "goUserInfoEdit.do";
			infoList.submit();
		}
		/*function goUserRoleEdit(id)
		{
			infoList.qqId.value=id;
			infoList.action="user/goUserRoleEdit.do";
			infoList.submit();
		}*/
		function userInfoDetail(id) {
			infoList.qqId.value = id;
			infoList.action = "userInfoDetail.do";
			infoList.submit();
		}
	</script>
</body>
</html>
