<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath}" var="path"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="http://localhost:8080/xp/" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8" />

<link href="${path }/static/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="${path }/static/js/jquery-1.12.4.min.js"></script>
<script src="${path }/static/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path }/static/easyUI/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${path }/static/easyUI/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="${path }/static/easyUI/easyui.css">
<script type="text/javascript">
	$(function() {
		   //查询部门中是否有员工
		 function checkout(depId){
			 $.ajax({
				 async:false,
				 url:"${path}/checkout.action",
				 data:{depid:depId},
				 type:"POST",
				 dataType:"json",
				 success:function(result){
		              if(result.dep ==false){
		            	  alert("第"+depId+"个部门有员工,禁止删除");
		            	window.location.reload();//刷新当前页面
		              }
		            }
			 });
		 } 
		
		 //删除部门
		 $("#deleteDep").click(function(){
			var dep=$("input[name=boxs]:checked");
			var arr = new Array();
			for(var i=0;i<dep.length;i++){
				var val = dep[i].value;
				arr.push(val);
			}
			if(dep.length == 0){
				alert("请选择需要删除的部门!");
		    }else if(checkout(val)){}
		     else{
		    	$.messager.confirm('提示信息', '是否确认删除?', function(data){
	  				if (data){   
					    alert("删除成功")
					    window.location.href = "${path}/deleteDep.action?deletes="+arr;
					}else{
						 window.location.reload();//刷新当前页面
					}
				  }); 
			   	} 
			
			});
			
			//绑定全选点击事件
			$("#depAll").click(function() {
				//获取所有多选框的checked属性
				var allChecked=this.checked;
				//获取所有name属性为ids的input标签
				$("input[name=boxs]").each(function(){
					this.checked=allChecked;
				});
			});
		
	  });
</script>
</head>

<body>
	<form class="form-inline" action="${path }/selectbyname.action" method="post">
		<div  style="margin: 0px; padding: 5px;" align="center">
			<label>部门名称:</label> 
			<input type="text" class="form-control"	name="DEP_NAME"  placeholder="请输入部门名称" /> 
			<input type="submit" class="btn btn-default" value="查询"> 
			<span class="btn btn-default"><a href="${path }/add.action">添加部门</a></span>
			<input type="button" class="btn btn-default" id="deleteDep" value="删除部门">
		</div>
		<div class="row" style="padding: 15px;">
			<table class="table table-hover table-condensed" border="1"	align="center">
				<tbody>
					<tr>
					<td style="text-align:center;"><input type="checkbox" id="depAll" /></td>
					<th style="text-align:center;">部门编号</th>
					<th style="text-align:center;">部门名称</th>
					<th style="text-align:center;">部门备注</th>
					<th style="text-align:center;">部门状态</th>
					<th style="text-align:center;">操作</th>					
					</tr>
				</tbody>

				<c:forEach items="${requestScope.deps }" var="listDep">
					<tbody align="center">
						<tr class="odd">
							<td><input type='checkbox' name="boxs" id="depId" value="${listDep.DEP_ID }"/></td>
							<td>${listDep.DEP_ID }</td>
							<td>${listDep.DEP_NAME }</td>
							<td>${listDep.DEP_DESC }</td>
							<td>${listDep.DEP_STATE == "0"?"有效":"删除"}</td>

							<td>
								<c:if test="${listDep.DEP_STATE == 0}"><span class="btn btn-default btn-xs"><a href="${path }/selectdep.action?depid=${listDep.DEP_ID }">修改</a></span></c:if>
								<c:if test="${listDep.DEP_STATE == 0}"><span class="btn btn-default btn-xs"><a href="${path }/depId.action?depid=${listDep.DEP_ID }">查看员工</a></span></c:if>
							</td>
						</tr>

					</tbody>

				</c:forEach>
			</table>
			
			<a href="${path }/indexDep.action">跳转至主界面</a>

		</div>
	</form>
</body>
</html>