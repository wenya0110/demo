<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<link href="<%=basePath %>admin/css/admin.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath %>admin/css/theme.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath %>admin/css/jquery.validate.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath %>admin/css/jquery.treeview.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath %>admin/css/jquery.ui.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="<%=basePath %>admin/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" src="<%=basePath %>admin/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script src="<%=basePath %>admin/js/jquery.js" type="text/javascript"></script>
<script src="<%=basePath %>admin/js/jquery.ext.js" type="text/javascript"></script>
<script src="<%=basePath %>admin/js/jquery.form.js" type="text/javascript"></script>
<script src="<%=basePath %>admin/js/itcast.js" type="text/javascript"></script>
<script src="<%=basePath %>admin/js/admin.js" type="text/javascript"></script>

<link rel="stylesheet" href="<%=basePath %>admin/css/style.css" />
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


