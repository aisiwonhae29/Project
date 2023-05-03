<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN" />
<%@ include file="../common/head.jspf"%>
<hr />
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
<%@ include file="../common/foot.jspf"%>
<!-- <form action="../practice/postexample" method="POST">
<input type="text" name="id" />
<input type="submit" />
</form> -->
