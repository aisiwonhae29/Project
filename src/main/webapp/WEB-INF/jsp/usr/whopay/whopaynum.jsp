<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div class="flex justify-around">
<c:forEach begin="1" end ="${num }" var="i">
	<div id="<c:out value = "${i}"/>">as</div>
</c:forEach>
</div>