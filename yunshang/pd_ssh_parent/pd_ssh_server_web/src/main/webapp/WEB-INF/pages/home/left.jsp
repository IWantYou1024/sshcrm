<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../base.jsp" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link rel="stylesheet" rev="stylesheet" type="text/css" href="${ctx}/skin/default/css/left.css" media="all"/>

	<script language="javascript" src="${ctx}/js/common.js"></script>
	<script language="javascript" src="${ctx}/js/ajax/setFastMenu.js"></script>
	<script language="javascript" src="${ctx}/js/pngfix_map.js"></script>
	<script type="text/javascript" src="${ctx}/components/jquery-ui/jquery-1.2.6.js"></script>
	<script type="text/javascript" src="${ctx}/skin/default/js/toggle.js"></script>
 
	
    <script language="javascript">
    	/*ajax 加载快捷菜单*/
    	$(function() {
    		refreshMenu();
    	});
    	
    	function refreshMenu() {
    		$("#fastMenuUl").empty();
    		$("#customerMenuUl").empty();
    		
    		var url = "${ctx}/home/menuAction_fastMenu";
    		$.post(url,null,function(data) {
    			$(data).each(function(i,n) {
    				var li = "<li><a href='${ctx}/" + n.CURL + "' onclick='linkHighlighted(this)' target='main' id='aa_1'>" + n.CPERMISSION + "</a></li>";
    				$("#fastMenuUl").append(li);
    			});
    		},"json");
    		
    		url = "${ctx}/home/menuAction_customerMenu";
    		$.post(url,null,function(data) {
    			if(data != null) {
    				$("#customerMenuTip").hide();
	    			$(data).each(function(i,n) {
	    				var li = "<li><a href='${ctx}/" + n.CURL + "' onclick='linkHighlighted(this)' target='main' id='aa_1'>" + n.CPERMISSION + "</a></li>";
	    				$("#customerMenuUl").append(li);
	    			});
    			}
    		},"json");
    	}
    	
    	$().ready(function(){
			$(fastMenu).hide();
			//document.getElementById('aa_3').click();	//默认打开我的留言板页面
    	});
    	
    	function showMenu( who ){
    		if(who=="fastMenu"){
    			$(fastMenu).show();
    			$(customerMenu).hide();
    		}else if(who=="customerMenu"){
    			$(customerMenu).show();
    			$(fastMenu).hide();
    		}
    	}
    </script>
 
    
</head>
 
<body id="left_frame">
<div class="PositionFrame_black" id="PositionFrame"></div>
 
 
<div id="sidebar" class="sidebar">
	<div class="sidebar_t">
		<div class="sidebar_t_l"></div>
		<div class="sidebar_t_c"></div>
		<div class="sidebar_t_r"></div>
	</div>
	   <div class="panel">
	       <div class="panel_icon"><img src="${ctx}/skin/default/images/icon/user2.png" /></div>
	       <div class="panel-header">
	        <div class="panel-title">个人工作台</div>
	        <div class="panel-content">
				<ul>
					<li><a href="${ctx}/home/messageAction_list.action" target="main" id="aa_3" onclick="linkHighlighted(this)">我的留言板</a></li>
					<li><a href="${ctx}/home/taskAction_list.action" target="main" id="aa_2" onclick="linkHighlighted(this)">我的代办任务</a></li>
					<li><a href="${ctx}/home/feedBackAction_touser.action" target="main" id="aa_1" onclick="linkHighlighted(this)">意见反馈</a></li>
				</ul>
	        </div>
	        
	       </div>
	   </div>
    <div class="sidebar_t">
		<div class="sidebar_b_l"></div>
		<div class="sidebar_t_c"></div>
		<div class="sidebar_b_r"></div>
	</div>
</div>
 
 
 
 
 
<div id="sidebar" class="sidebar">	
	<div class="sidebar_t">
		<div class="sidebar_t_l"></div>
		<div class="sidebar_t_c"></div>
		<div class="sidebar_t_r"></div>
	</div>
 	    <div class="panel">
	        <div class="panel_icon"><img src="${ctx}/skin/default/images/icon/cubes.png" /></div>
	        <div class="panel-header">
		    	<div class="panel-title">我的常用功能</div>
					<div style="margin-top:5px;"></div>
					<!-- 以上为永久固定栏目，以下为活动栏目 -->
	        <div style="border-bottom:1px dotted #cee1df;"> 
	         切换:<a href="#" onmousemove="javascript:showMenu('fastMenu');">快捷菜单</a>
	        /
	        <a href="${ctx}/home/menuAction_customerMenuAdd.action" target="main" onmousemove="javascript:showMenu('customerMenu');">自定义菜单</a>
	        <a href="#" onclick="refreshMenu()"><img alt="裂了" src="${ctx}/skin/default/images/button/refresh.gif" title="刷新菜单"/></a>
	        </div>
		        	<div id="fastMenu">
		        	<div class="panel-content">
		        		<ul id="fastMenuUl"></ul>
		        	</div><a href="${ctx}/home/menuAction_fastMenuClear.action" class="DelFastMenu" target="_self"><font color="gray">清除常用功能列表</font></a>
		        	</div>
		        	
		        	<div id="customerMenu">
		        		<div class="panel-content">
		        			<ul id="customerMenuUl"></ul>
		        		</div>
		        	<div id="customerMenuTip" class="FastMenu"><img src="${ctx}/skin/default/images/notice.gif" style="margin-right:5px;" border="0" /><font color="gray"><a href="main.jsp" target="main">您还没定义您的菜单</a></font></div>
		        	</div>
	        </div>
	    </div>
	 <div class="sidebar_t">
		<div class="sidebar_b_l"></div>
		<div class="sidebar_t_c"></div>
		<div class="sidebar_b_r"></div>
	</div>    
</div>
 
 
<!-- begin1  -->
<div id="sidebar" class="sidebar">
	<div class="sidebar_t">
		<div class="sidebar_t_l"></div>
		<div class="sidebar_t_c"></div>
		<div class="sidebar_t_r"></div>
	</div>
    <div class="panel">
    	<div class="panel_icon"><img src="${ctx}/skin/default/images/icon/businessman2.png" /></div>
        <div class="panel-header">
        <div class="panel-title">
		用户设定
        </div>
        
        <div class="panel-content">
			<ul>
				<li><a href="${ctx}/sysadmin/userAction_toselfupdate.action" target="main" id="aa_2" onclick="linkHighlighted(this)">个人信息修改</a></li>						
				<li><a href="${ctx}/home/feedBackAction_tosystem.action" target="main" id="aa_2" onclick="linkHighlighted(this)">系统使用反馈</a></li>						
			</ul>
        </div>
    </div>
    </div>
    <div class="sidebar_t">
		<div class="sidebar_b_l"></div>
		<div class="sidebar_t_c"></div>
		<div class="sidebar_b_r"></div>
	</div>
</div>
<!-- end1 -->
 
</body>
</html>