<%@ page language ="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
    <%=session.getAttribute("SESS_USER_ID")%>
    ${userId}
</head>
<body>
<div>
    <form action="#" id="myForm" onsubmit="javascript:return login();">
        <input type="text" id="userId"/>
        <input type="password" id="userPassword"/>
        <input type="submit" value="submit"/>
    </form>
</div>
</body>
<script src="webjars/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
    function login(){
        $.ajax({
            url : "/login",
            method : "POST",
            data : {
                "userId" : $("#userId").val(),
                "userPassword" : $("#userPassword").val()
            },
            success : function(data){
                window.location.href="/";
            },
            error : function(data){

            }
        });
        return false;
    }
</script>
</html>