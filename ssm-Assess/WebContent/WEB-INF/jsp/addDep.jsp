<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
			//部门校验
			$("#inputDep").blur(function(){
				//发送ajax请求校验用户名是否可用
				$.ajax({
		             url:"${path}/checkDep.action",
		             type:"POST",
		             data:{depname:$("#inputDep").val()},
		             dataType:"json",
		            success:function(result){
		               if (result.state == false ) {
		                  $("#inputDep").next("span").text("该部门已存在");
		                  $("#addDep").attr("disabled",true);
		              }else if(result.state ==true){
		            	  $("#inputDep").next("span").text(" ");
						  $("#addDep").attr("disabled",false);
		              }
		            }
		          });
			});	
			
			//部门添加
			$("#addDep").click(function(){
				$.ajax({
					url:"${path}/addDep.action",
					type:"POST",
					data:$("#addDepName form").serialize(),
					success:function(){
						alert("添加成功")
						//跳转到尾页
						window.location.href='${path }/dep.action'
					}
				});
			});
		});
	</script>
	
</head>
<body>
		<div class="page-header" id="addDepName">
			<div class="content-nav" align="center"><h2>添加部门</h2></div>
			<form class="form-horizontal"  method="post">
				<fieldset>
					<legend >添加部门</legend>
					<div class="form-group">
					    <label class="col-sm-6 control-label">部门名称</label>
					    <div class="col-sm-2">
					      <input type="text" id="inputDep" class="form-control" name="DEP_NAME" >
					      <span class="help-block"></span>
					    </div>
					</div>
					
					<div class="form-group" >
					   <label class="col-sm-6 control-label">部门描述</label>
					   <div class="col-sm-2">
						 <!-- <input type="text" class="form-control" name="DEP_DESC" > -->
						 <textarea rows="5" cols="29" class="form-control" name="DEP_DESC"></textarea>
					   </div>
					</div>  
					
					<div align="center">
				        <button type="button" id="addDep" class="btn btn-primary">确定</button>
				    </div>
				    
				</fieldset>
			</form>
		</div>

</body>
</html>