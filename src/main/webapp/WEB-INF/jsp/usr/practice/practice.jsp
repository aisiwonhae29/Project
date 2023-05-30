<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN" />
<%@ include file="../common/head.jspf" %>
<hr />
<script src="https://cdn.tailwindcss.com"></script>
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.51.6/dist/full.css" rel="stylesheet" type="text/css" />
<div>여기는 연습페이지이다</div>
<input value="버튼" onclick="location.href='/practice/home/historyback';" type="button" />
<a href="/practice/home/historyback">버튼이 안눌리넹;;</a>
<div class="border">
</div>
<div>
<a href="../home/main">확인버튼 입니다</a>
<div>${v }asd</div>
<form action="../practice/ex">
	<input type="text" name="hi"/>
</form>
</div>
<div>
<c:set var="pmp" value="4"></c:set>
<c:forEach begin="1" end="${pmp }" var="i">
	<div>1</div>
</c:forEach>
</div>

<!-- AJAX Test -->
<a href="../practice/whopaypr">AJAX test</a>
<img src="/images/gora.png" alt="Your Image">
<img src="${pageContext.request.contextPath}/static/gora.png" alt="Your Image">
<img src="${pageContext.request.contextPath}/static/${java.net.URLEncoder.encode('gora.png', 'UTF-8')}" alt="Your Image">
<hr />
<button onclick="testajax()">testajax</button>
<script>
	function testajax(){
	    $.ajax({
            type: "post",
            url: "../practice/ajaxmsg",
            data: {msg : "sdf" , sss: "qwe"},
            dataType: "text",
            success: function (response) {
                alert(response);
            }
        });
	}
</script>
<%@ include file="../common/foot.jspf"%>
<!-- <form action="../practice/postexample" method="POST">
<input type="text" name="id" />
<input type="submit" />
</form> -->
<%-- <div><!-- ajax test -->
$.ajax({
	url : "/main/nuewsAjax.do",
	type : "post",
	dataType : "json",
	data : Pparam : "${boardIDList} }", num: thisIndex},
	traditional : true,
	success : function(Result)
})
</div> --%>