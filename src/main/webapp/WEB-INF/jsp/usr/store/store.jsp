<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="${board.code}" />
<%@ include file="../common/head.jspf"%>

<script async src="https://cse.google.com/cse.js?cx=b6a7634c0d3d04555">
</script>
    <div class="gcse-search"></div>

	<div onclick="a()">click</div>
	<script>
		
			location.replace('../home/main');
		
	</script>
<%@ include file="../common/foot.jspf"%>