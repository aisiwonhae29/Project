<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN" />
<%@ include file="../common/head.jspf"%>
<hr />
<div>여기는 연습페이지이다</div>
<input value="버튼" onclick="location.href='/practice/home/historyback';" type="button" />
<a href="/practice/home/historyback">버튼이 안눌리넹;;</a>
<div class="border">
<form action="../practice/postexample" method="POST">
<input type="text" name="id" />
<input type="submit" />
</form>
</div>
<%@ include file="../common/foot.jspf"%>
