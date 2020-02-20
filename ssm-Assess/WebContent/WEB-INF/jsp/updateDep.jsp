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
		//校验部门名是否可用
		//监听焦点移开事件
	$(function(){//页面加载完成
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
	                  $("#updateDep").attr("disabled",true);
	              }else if(result.state ==true){
	            	  $("#inputDep").next("span").text(" ");
					  $("#updateDep").attr("disabled",false);
	              }
	            }
	          });
		});	
		//部门修改
	 	$("#updateDep").click(function(){
			 $.ajax({
				url:"${path}/updatedep.action",
				type:"POST",
				data:$("#updateinput form").serialize(),
				success:function(result){
					alert("修改成功");
					//跳转部门页面
					window.location.href='${path }/dep.action'
				}
			});
		});	
	});
	</script>
</head>

<body>

	<div class="page-header" id="updateinput">
			<div class="content-nav" align="center"><h2>修改部门</h2></div>
			<form class="form-horizontal">
				<fieldset>
					<legend >部门信息</legend>
					<div class="form-group">
					    <label class="col-sm-6 control-label">部门名称</label>
					      <input type="hidden" name="DEP_ID" value="${dep[0].DEP_ID }">
					    <div class="col-sm-2">
					      <input type="text" id="inputDep" class="form-control" name="DEP_NAME" value="${dep[0].DEP_NAME }">
					      <span class="help-block"></span>
					    </div>
					</div>
					
					<div class="form-group" >
					   <label class="col-sm-6 control-label">部门描述</label>
					   <div class="col-sm-2">
						 <%-- <input type="text" class="form-control" name="DEP_DESC" value="${dep[0].DEP_DESC }"> --%>
						  <textarea rows="5" cols="29" class="form-control" name="DEP_DESC" >${dep[0].DEP_DESC }</textarea>
					   </div>
					</div>  
					
					<div align="center">
				        <button type="button" id="updateDep" class="btn btn-primary">确定修改</button>
				    </div>
				    
				</fieldset>
			</form>
		</div>

</body>
</html>