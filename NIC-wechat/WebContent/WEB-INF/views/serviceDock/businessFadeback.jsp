<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-cn">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
<meta name="renderer" content="webkit">
<title></title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/pintuer.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/admin.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap-3.3.0/css/bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap-3.3.0/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap-3.3.0/css/bootstrap-theme.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap-3.3.0/css/bootstrap-theme.min.css">

<script src="${pageContext.request.contextPath }/js/jquery.js"></script>
<script src="${pageContext.request.contextPath }/js/pintuer.js"></script>
<!-- 可输入下拉框 --> 
 <script src="${pageContext.request.contextPath }/js/jquery.editable-select.min.js"></script>
<script type="text/javascript">
//搜索
$(function(){
	$("#searchArticleForm").off();
	$("#searchArticleForm").bind("submit",function(){
		var key=$(this).find("select[name=key]").val();
		
		var val1=$(this).find("select[name=val]").val();
		var val2=$(this).find("input[name=val]").val();
		if(val1==null)
			{

			$(".panel").load("${pageContext.request.contextPath }/feedback/searchLists",{
				key:key,
				val:val2
			});  
			
			}
		else{
			$(".panel").load("${pageContext.request.contextPath }/feedback/searchLists",{
				key:key,
				val:val1
			}); 
		}
		
		//阻止表单默认行为 （提交）
		return false;
	});
	
});
/* alert("hhhhhhhhhhh"); */
 //二级联动
		
	function btnChange(){
		var childs=new Array();
		var departname=new Array();
		
		<c:forEach items="${dpNameList }" var="item">
		/* alert("${item}"); */
		departname.push("${item}");
		/* alert("${item}"); */
		</c:forEach>
		var parentEle=document.getElementById("parent");	
   
	 /*   alert("进入了change方法"); */
	 var childEle=document.getElementById("child");
	childEle.innerHTML="";//每次进来先清空子搜索列表
	/* alert("进入了"+parentEle.innerHTML) */;
	var parentValue=parentEle.options[parentEle.selectedIndex].value;
	/* alert("进入了123"+parentValue); */
	var ddl=document.getElementById("child");
	switch(parentValue){
	case "service":
		ddl.style.display="inline-block";
		$("#inputsearch").hide();
	     childs=['技术支持','设备报修','日常运维'];
		break;
	case"department":
		ddl.style.display="inline-block";
		$("#inputsearch").hide();
		childs=departname;
		break;
	default:
	   ddl.style.display="none";
	    $("#inputsearch").show();
	    $("#inputsearch").style.display="inline-block";
		
	}
	 
	   for(var i=0;i<childs.length;i++){
		   /* alert("for"); */
           var option=document.createElement('option'); //先创建option
           
           var textNode=document.createTextNode(childs[i]); //再把城市名作为子节点填入，也可用innerHTML
           childEle.appendChild(option);
           option.text = childs[i];
        
       } 
} 
</script>
</head>
<body>
	<%-- <form method="post" action="${pageContext.request.contextPath }/serviceDock/searchLists" id="listform">  --%>
	<div class="panel admin-panel">
		<div class="panel-head">
    </div>
   <form role="search" id="searchArticleForm" class="load" method="post" action="${pageContext.request.contextPath }/feedback/searchLists">
    <div class="padding border-bottom ">
      <ul class="search" style="padding-left:10px;">
      
          <li>
            <select  id="parent" onchange='btnChange();' name="key" class="input" style="width:200px; line-height:17px;">
              <option value="">请选择分类</option> 
              <option value="service">业务类型</option>
              <option value="department">部门</option>
              <option value="address">地点</option>
              <option value="uptime">提交时间</option>
             <!--  <option value="keyword">关键字筛选</option> -->
            </select>
          </li>
        <li>
         <select id="child" type="text" name="val" class="input" style="width:250px;line-height:17px;display:inline-block;" >
          <option value="">请下拉选择</option> 
         </select>
          <input id="inputsearch" type="text" placeholder="请输入搜索关键字" name="val" style="font-size:14px;padding:10px;border:solid 1px #ddd;border-radius:3px;width:250px; line-height:17px;display: none;" />
          <input type="submit" style="width: 60px;" class="button border-main icon-search" value="查询" />
          </li>
      </ul>
    </div>
</form>

		<div id="divtable">
			<table class="table table-hover text-center"
				style="margin: 0 auto; align: center; margin-top: 10px;">
				<tr>
					<th style="text-align: left; padding-left: 20px;">序号</th>
					<th><input type="hidden" 技术支持编号></th>
					<th>联系人</th>
					<th>业务类型</th>
					<th>设备名称</th>
					<th>部门</th>
					<th>具体地点</th>
					<th>提交时间</th>
					<th>进度</th>
					<th>处理人</th>
					<th colspan="2">操作</th>
				</tr>
				<c:forEach items="${tsList }" var="s" varStatus="a">
					<form method="post"
						action="${pageContext.request.contextPath }/feedback/toUpdateStatus"
						id="update">
					<tr>
						<td>${a.index+1}</td>
						<td><input type="hidden" name="techsupportId"
							value="${s.techsupportId}"></td>
						<td>${tsUser[a.index]}</td>
						<td>技术支持</td>
						<td>${s.techsupportDevicename}</td>
						<td>${s.techsupportDepartment}</td>
						<td>${s.techsupportLocation}</td>
						<%--  <td> ${s.techsupportDescribe}</td> --%>
						<td>${s.techsupportUptime}</td>
						<td colspan="1"
							style="text-align-last: center; text-align: center;"><select
							name="status_name" id="status_name" style="margin-center: 87%;">
								<option value="0">-请选择-</option>
								<c:forEach items="${listStatus}" var="item" varStatus="status">
									<option value="${item.statusName}">${item.statusName}</option>
								</c:forEach>
						</select></td>
						<td colspan="1"
							style="text-align-last: center; text-align: center;"><select
							name="manager_name" id="manager_name" style="">
								<option value="0">-请选择-</option>
								<c:forEach items="${listManager }" var="item" varStatus="status">
									<option value="${item.managerName}">${item.managerName}</option>
								</c:forEach>
						</select></td>
						<td>
							<div class="button-group">
									<a class="button border-main" style="padding: 2px 2px;" 
									 href="" name="submit" onclick="document.getElementById('subform').submit();return false"> 
									<span class="icon-edit"></span>提交</a>
									<a class="button border-red" style="padding: 2px 2px;" 
									href="${pageContext.request.contextPath }/feedback/toaddinfo?techsupportId=${s.techsupportId}"> <span class="icon-edit"></span>反馈
									</a>
								</div>
							</td>
					</tr>
					</form>
				</c:forEach>
				<c:forEach items="${rpList }" var="s" varStatus="b">
					<form method="post"
						action="${pageContext.request.contextPath }/feedback/toUpdateStatus"
						id="subform">
						<tr>
							<!--   <td style="text-align:left; padding-left:20px;"><input type="checkbox" name="id[]" value="" />
           1</td> -->
							<td id="rp">${(b.index+1)+(tsLen)}</td>
							<td><input type="hidden" name="repairId"
								value="${s.repairId}"></td>
							<td>${rpUser[b.index]}</td>
							<td>设备报修</td>
							<td>${s.repairDevicename}</td>
							<td>${s.repairDepartment}</td>
							<td>${s.repairLocation}</td>
							<td>${s.repairUptime}</td>
							<td colspan="1"
								style="text-align-last: center; text-align: center;"><select
								name="status_name" id="status_name" style="margin-center: 87%;">
									<option value="0">-请选择-</option>
									<c:forEach items="${listStatus}" var="item" varStatus="status">
										<option value="${item.statusName}">${item.statusName}</option>
									</c:forEach>
							</select></td>
							<td colspan="1"
								style="text-align-last: center; text-align: center;"><select
								name="manager_name" id="manager_name" style="">
									<option value="0">-请选择-</option>
									<c:forEach items="${listManager }" var="item"
										varStatus="status">
										<option value="${item.managerName}">${item.managerName}</option>
									</c:forEach>
							</select></td>
							<td>
							<!-- <input id="btnSave" class="btn btn-info" type="submit"
								value="修改" class="submit" /> <a class="btn btn-info">反馈</a> -->
								
								<div class="button-group">
									<a class="button border-main" style="padding: 2px 2px;"  href="" name="submit" onclick="document.getElementById('subform').submit();return false"> 
									<span class="icon-edit"></span>提交</a>
									<a class="button border-red" style="padding: 2px 2px;"
									href="${pageContext.request.contextPath }/feedback/toaddinfo?repairId=${s.repairId}"> <span class="icon-edit"></span>反馈
									</a>
								</div>
							</td>
						</tr>
					</form>
				</c:forEach>
				<c:forEach items="${mtList }" var="s" varStatus="c">
					<form method="post"
						action="${pageContext.request.contextPath }/feedback/toUpdateStatus"
						id="update">
						<tr>
							<td id="mt">${(c.index+1)+(tsLen)+(rpLen)}</td>
							<td><input type="hidden" name="maintenanceId"
								value="${s.maintenanceId}"></td>
							<td>${mtUser[c.index]}</td>
							<td>日常运维</td>
							<td>${s.maintenanceDevicename}</td>
							<td>${s.maintenanceDepartment}</td>
							<td>${s.maintenanceLocation}</td>
							<%--   <td>${s.maintenanceDescribe}</td> --%>
							<td>${s.maintenanceUptime}</td>

							<td colspan="1"
								style="text-align-last: center; text-align: center;"><select
								name="status_name" id="status_name" style="margin-center: 87%;">
									<option value="0">-请选择-</option>
									<c:forEach items="${listStatus}" var="item" varStatus="status">
										<option value="${item.statusName}">${item.statusName}</option>
									</c:forEach>
							</select></td>
							<td colspan="1"
								style="text-align-last: center; text-align: center;"><select
								name="manager_name" id="manager_name" style="">
									<option value="0">-请选择-</option>
									<c:forEach items="${listManager }" var="item"
										varStatus="status">
										<option value="${item.managerName}">${item.managerName}</option>
									</c:forEach>
							</select></td>
							<td>
							<div class="button-group">
									<a class="button border-main" style="padding: 2px 2px;"  href="" name="submit" onclick="document.getElementById('subform').submit();return false"> 
									<span class="icon-edit"></span>提交</a>
									<a class="button border-red" style="padding: 2px 2px;"
									href="${pageContext.request.contextPath }/feedback/toaddinfo?maintenanceId=${s.maintenanceId}"> <span class="icon-edit"></span>反馈
									</a>
								</div>
							</td>
						</tr>
					</form>
				</c:forEach>
			</table>
		</div>
	
	<!-- <div>
		<table class="table table-hover text-center">
			<tr>
				<td colspan="8"><div class="pagelist">
						<a href="">上一页</a> <span class="current">1</span><a href="">2</a><a
							href="">3</a><a href="">下一页</a><a href="">尾页</a>
					</div></td>
			</tr>
		</table>
	</div> -->
	<!-- </form> -->
	</div>
</body>
</html>