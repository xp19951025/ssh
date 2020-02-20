<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isELIgnored="false"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="path"></c:set>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="${path }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${path }/static/js/jquery-1.12.4.min.js"></script>
<script src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript">
	   $(function(){
		 
			//校验修改表单的员工姓名
			function validateUser(){
				var userName = $("#inputUpdateName").val();//获取员工姓名
				var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
				if(!regName.test(userName)){
					$("#inputUpdateName").parent().addClass("has-error");
					$("#inputUpdateName").next("span").text("用户名为2-5位中文或者6-16位英文和数字");
					return false;
				}else{
					$("#inputUpdateName").parent().addClass("has-success");
					$("#inputUpdateName").next("span").text(" ");
				}
				return true;
			}
			
			//校验用户名是否可用
			//监听焦点移开事件
			$("#inputUpdateName").blur(function(){
				//发送ajax请求校验用户名是否可用
				$.ajax({
		             url:"${path}/checkuser.action",
		             type:"POST",
		             data:{username:$("#inputUpdateName").val()},
		             dataType:"json",
		            success:function(result){
		               if (result.state == false ) {
		                  $("#inputUpdateName").next("span").text("该员工已存在");
		                  $("#updateUser").attr("disabled",true);
		              }else if(result.state ==true){
		            	  $("#inputUpdateName").next("span").text(" ");
						  $("#updateUser").attr("disabled",false);
		              }
		            }
		          });
			});
		  
		  //修改员工信息
		  $("#updateUser").click(function(){
				//先进行校验
				if(!validateUser()){
					return false;
				}
				 $.ajax({
					url:"${path}/updateUser.action",
					type:"POST",
					data:$("#updateinput form").serialize(),
					success:function(result){
						alert("修改成功");
						//跳转到当前页面
						window.location.href='${path }/list.action?currentPage=${requestScope.pagemsg.currPage}'
					}
				});
			});	
	  }); 
	 	
	</script>
</head>
<body>

	<div class="page-header" id="updateinput">

		<div class="content-nav" align="center"><h2>修改员工</h2></div>
		<form class="form-horizontal">
			<fieldset>
				<legend >员工信息</legend>
				<div class="form-group" >
				    <label  class="col-sm-6 control-label">员工姓名</label>
				      <input type="hidden" name="USER_ID" value="${update[0].USER_ID }">
				    <div class="col-sm-1">
				      <input type="text" class="form-control" id="inputUpdateName" name="USER_NAME" value="${update[0].USER_NAME }">
				      <span class="help-block" ></span>
				    </div>
				  </div>
				  
				   <div class="form-group" >
					    <label class="col-sm-6 control-label">所属部门</label>
					    <div class="col-sm-4" >
					      <!-- 显示部门名称下拉框 -->
					      <select name="DEP_ID">
						      <option value="${update[0].DEP_ID }">${update[0].department.DEP_NAME }</option>
							<c:forEach items="${requestScope.dep}" var="depl">
								<option value="${depl.DEP_ID }">${depl.DEP_NAME}</option>
							</c:forEach>
					      </select>
					    </div>
					  </div>
					  
					  <div class="form-group" >
					    <label class="col-sm-6 control-label">性别</label>
					    <div class="col-sm-6">
					      <label class="radio-inline">
							 <input type="radio" name="USER_SEX" value="男" <c:if test="${update[0].USER_SEX eq '男'}"> checked="checked"</c:if>/>男 
							</label>
							<label class="radio-inline">
							  <input
								type="radio" name="USER_SEX" value="女" <c:if test="${update[0].USER_SEX eq '女'}"> checked="checked"</c:if>/>女
							</label>
					    </div>
					   </div>
					   <div align="center" >
				        <button type="button" class="btn btn-primary" id="updateUser">确定修改</button>
				      </div>
			</fieldset>
		</form>
	</div>

</body>
</html>