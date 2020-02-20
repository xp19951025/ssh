<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set value="${pageContext.request.contextPath}" var="path"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${path }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${path }/static/js/jquery-1.12.4.min.js"></script>
<script src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
	
</head>
<body >
	
	<div align="center">
		
		
		  <div align="center">
				<table class="table table-bordered">
		  			<thead align="center">
						<tr>
							<th style="text-align:center;">员工编号</th>
							<th style="text-align:center;">姓名</th>
							<th style="text-align:center;">性别</th>
							<th style="text-align:center;">所属部门</th>
							<th style="text-align:center;">员工状态</th>
						</tr>
					</thead>
						<c:forEach items="${requestScope.user}" var="user">
							<tbody align="center">
							<tr >
								<td>${user.USER_ID}</td>
								<td>${user.USER_NAME}</td>
								<td>${user.USER_SEX}</td>
								<td>${user.department.DEP_NAME}</td>
								<td>${user.USER_STATE == "0"?"有效":"删除"}</td>							
							</tr>												
							</tbody>					
						</c:forEach>
				</table>		
			</div>
	</div>
	
</body>
</html>