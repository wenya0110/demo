<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="head.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>JEECMS Administrator's Control Panel</title>
<script type="text/javascript">
if(top!=this) {
	top.location=this.location;
}
$(function() {
	$("#username").focus();
	$("#jvForm").validate();
});
</script>
<style type="text/css">
body{margin:0;padding:0;font-size:12px;background:url(<%=basePath%>admin/images/login/bg.jpg) top repeat-x;}
.input{width:150px;height:17px;border-top:1px solid #404040;border-left:1px solid #404040;border-right:1px solid #D4D0C8;border-bottom:1px solid #D4D0C8;}
</style>
</head>
<body>
<form id="jvForm" action="<%=basePath %>adminuser/login" method="post">
<c:if test="${returnUrl != null }" ><input type="hidden" name="returnUrl" value="${returnUrl}"/></c:if>
<c:if test="${processUrl != null }"><input type="hidden" name="processUrl" value="${processUrl}"/></c:if>
<table width="750" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="200">&nbsp;</td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="423" height="280" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><img src="<%=basePath %>admin/images/login/ltop.jpg" /></td>
              </tr>
              <tr>
                <td><img src="<%=basePath %>admin/images/login/llogo.jpg" /></td>
              </tr>
            </table></td>
          <td width="40" align="center" valign="bottom"><img src="<%=basePath %>admin/images/login/line.jpg" width="23" height="232" /></td>
          <td valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td height="90" align="center" valign="bottom"><img src="<%=basePath %>admin/images/login/ltitle.jpg" /></td>
              </tr>
              <tr>
                <td>
                <div>
<c:if test="${errors !=null }">
	<ul>
	<c:forEach items="${reeors }" var="error">
    <li>${error}</li>
    </c:forEach>
	</ul>
</c:if>
                </div>
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="5">
                    <tr>
                      <td width="91" height="40" align="right"><strong>用户名</strong></td>
                      <td width="211"><input type="input" id="username" name="username" vld="{required:true}" maxlength="100" class="input"/></td>
                    </tr>
                    <tr>
                      <td height="40" align="right"><strong>密 码</strong></td>
                      <td><input name="password" type="password" id="password" maxlength="32" vld="{required:true}" class="input"/></td>
                    </tr>
                    <c:if test="${errorRemaining != null && errorRemaining<=0}">
                    <tr>
                    	<td colspan="2" align="center"><img src="${base}/captcha.svl" onclick="this.src='${base}/captcha.svl?d='+new Date()*1"/></td>
                    </tr>
                    <tr>
                      <td height="40" align="right"><strong>login.captcha</strong></td>
                      <td><input name="captcha" type="text" id="captcha" vld="{required:true}" class="input"/></td>
                    </tr>
                    </c:if>
                    <tr>
                      <td height="40" colspan="2" align="center">
					    <input type="image" src="<%=basePath %>admin/images/login/login.jpg" name="submit" />
                        &nbsp; &nbsp; <img name="reg" style="cursor: pointer" src="<%=basePath %>admin/images/login/reset.jpg" onclick="document.forms[0].reset()" /> </td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
</form>

</body>
</html>
