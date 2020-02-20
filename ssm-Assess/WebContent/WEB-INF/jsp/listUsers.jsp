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
<script type="text/javascript" src="${path }/static/easyUI/jquery.easyui.min.js"></script>
<script type="text/javascript" src="${path }/static/easyUI/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" href="${path }/static/easyUI/easyui.css">
	
	<script type="text/javascript">
	$(function(){//页面加载完成
	
		$("#user_add_modal_btn").click(function(){
			//弹出模态框
			$("#userAddModal").modal({
				backdrop:"static",
			});
		});
		
		//校验添加表单的员工姓名
		function validateUser(){
			var userName = $("#inputName").val();//获取员工姓名
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if(!regName.test(userName)){
				$("#inputName").parent().addClass("has-error");
				$("#inputName").next("span").text("用户名为2-5位中文或者6-16位英文和数字");
				return false;
			}else{
				$("#inputName").parent().addClass("has-success");
				$("#inputName").next("span").text(" ");
			}
			return true;
		}
		
		//校验用户名是否可用
		//监听焦点移开事件
		$("#inputName").blur(function(){
			//发送ajax请求校验用户名是否可用
			  $.ajax({
	             url:"${path}/checkuser.action",
	             type:"POST",
	             data:{username:$("#inputName").val()},
	             dataType:"json",
	             success:function(map){
	               if (map.state == false ) {
	                  $("#inputName").next("span").text("该员工已存在");
	                  $("#userAddEmp").attr("disabled",true);
	              }else if(result.state ==true){
	            	  $("#inputName").next("span").text(" ");
					  $("#userAddEmp").attr("disabled",false);
	              }
	            }
	          }); 
		});
		
		
		//员工添加
		$("#userAddEmp").click(function(){
			//先进行校验
			if(!validateUser()){
				return false;
			}
			$.ajax({
				url:"${path}/addUsers.action",
				type:"POST",
				data:$("#userAddModal form").serialize(),
				success:function(){
					alert("添加成功")
					//关闭模态框
					$("userAddModal").modal('hide');
					//跳转到尾页
					window.location.href='${path }/list.action?currentPage=${requestScope.pagemsg.totalPage}'
				}
			});
		});	
		
		//删除员工
		$("#deleteUser").click(function(){
			var cks=$("input[name=boxs]:checked");
			if(cks.length == 0){
				alert("请选择需要删除的用户信息!");
		    }else{
	  			$.messager.confirm('提示信息', '是否确认删除?', function(data){
				if (data){
					   var arr = new Array();
					   for(var i=0;i<cks.length;i++){
						   var val = cks[i].value;
						   arr.push(val);
					   }
					   alert("删除成功")
					   window.location.href = "${path}/deleteUser.action?deletes="+arr;
					}else{
						window.location.href = "${path}/list.action?currentPage=${requestScope.pagemsg.currPage }"
					}
				  });
			   	}  
			});
		
		//为全选绑定点击事件
  	   $("#checkAll").click(function(){
			//获取所有多选框的checked属性
			var allChecked=this.checked;
			//获取所有name属性为ids的input标签
			$("input[name=boxs]").each(function(){
				this.checked=allChecked;
			});
  	   });
	
	})
	</script>
		
</head>
<body >
	
	<div align="center">
		<form class="form-inline" action="${path }/emps.action" method="post" >
		    <label >员工名称</label>
		    <input type="text" name="USER_NAME" class="form-control"  placeholder="请输入员工名称">
		  
		  	<label>所属部门:</label>
		  	<select class="form-control" name="DEP_ID">
		  		<option value="0">请选择部门</option>
		  		<c:forEach items="${requestScope.dep}" var="dep">
		  			<option value="${dep.DEP_ID }"> ${dep.DEP_NAME }</option>
		  		</c:forEach>
		  	</select>
          
		  <input type="submit" class="btn btn-default" value="查询">
		  <button type="button" class="btn btn-default" id="user_add_modal_btn">添加</button>
		  <button type="button" class="btn btn-default" id="deleteUser">删除</button>
		</form>
		
		  <div align="center">
				<table class="table table-bordered">
		  			<thead align="center">
						<tr>
							<td><input type="checkbox" id="checkAll" /></td>
							<th style="text-align:center;">员工编号</th>
							<th style="text-align:center;">姓名</th>
							<th style="text-align:center;">性别</th>
							<th style="text-align:center;">所属部门</th>
							<th style="text-align:center;">员工状态</th>
							<th style="text-align:center;">操作</th>
						</tr>
					</thead>
						<c:forEach items="${requestScope.pagemsg.list}" var="user" >
							<tbody align="center">
							<tr >
								<td><input type='checkbox' name="boxs" value="${user.USER_ID }"/></td>
								<td>${user.USER_ID}</td>
								<td>${user.USER_NAME}</td>
								<td>${user.USER_SEX}</td>
								<td>${user.department.DEP_NAME}</td>
								<td>${user.USER_STATE == "0"?"有效":"删除"}</td>							
								<td>
									<c:if test="${user.USER_STATE == 0}"><span class="btn btn-default btn-xs"><a id="updateUser" href="${path}/update.action?userid=${user.USER_ID}&currentPage=${requestScope.pagemsg.currPage}">修改</a></span></c:if>
								</td>
							</tr>												
							</tbody>
						</c:forEach>
				</table>		
			</div>
	</div>
	
	<div align="center">
		<table  border="0" cellspacing="0" cellpadding="0"  width="900px" align="right">
			<tr>
			<td class="td2">
			   <span>总共${requestScope.pagemsg.totalPage}页</span>
			   <span>当前${requestScope.pagemsg.currPage }页</span>
			   <span>总记录数：${requestScope.pagemsg.totalCount };每页显示:${requestScope.pagemsg.pageSize}</span>
			   <span>
			       <c:if test="${requestScope.pagemsg.currPage != 1}">
			           <a href="${path }/list.action?currentPage=1">[首页]</a>
			           <a href="${path }/list.action?currentPage=${requestScope.pagemsg.currPage-1}">[上一页]</a>
			       </c:if>
			
			       <c:if test="${requestScope.pagemsg.currPage != requestScope.pagemsg.totalPage}">
			           <a href="${path }/list.action?currentPage=${requestScope.pagemsg.currPage+1}">[下一页]</a>
			           <a href="${path }/list.action?currentPage=${requestScope.pagemsg.totalPage}">[尾页]</a>
			       </c:if>
			   </span>
			</td>
			</tr>
		</table>
	</div>
	
	<a href="${path }/indexUser.action">跳转至主界面</a>
	
	<!-- 员工添加的模态框 -->
	<div class="modal fade" id="userAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">员工添加</h4>
	      </div>
	      
	      <div class="modal-body">
	        <form class="form-horizontal" >
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label">员工姓名</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="inputName" name="USER_NAME" placeholder="请输入姓名">
			      <span class="help-block" ></span>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">所属部门</label>
			    <div class="col-sm-4" >
			      <!-- 显示部门名称下拉框 -->
			      <select name="DEP_ID">
				      <c:forEach items="${requestScope.dep}" var="dep">
				      	<option value="${dep.DEP_ID }">${dep.DEP_NAME }</option>
				      </c:forEach>
			      </select>
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">性别</label>
			    <div class="col-sm-10">
			      <label class="radio-inline">
					  <input type="radio" name="USER_SEX" id="gender1_add_input" value="男" checked="checked"> 男
					</label>
					<label class="radio-inline">
					  <input type="radio" name="USER_SEX" id="gender2_add_input" value="女"> 女
					</label>
			    </div>
			   </div>
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
	        <button type="button" class="btn btn-primary" id="userAddEmp">确定</button>
	      </div>
	    </div>
	  </div>
	</div>
	
</body>
</html>