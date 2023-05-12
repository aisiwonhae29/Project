<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="flex justify-around">
<c:forEach begin="1" end ="${num }" var="i">
	<div >
	<div id="<c:out value = "${i}"/>">as</div>
	<form action="">
		<div><input type="hidden" value="${i}" name="id" /></div>
		<div><input type="text" value="" name="date" /></div>
		<div><input type="text" value=" " name="location" /></div>
		<div><input type="text" value=" " name="menu" /></div>
		<div><input type="text" value="man" name="gender" /></div>
		<div><input type="text" value="33" name="age" /></div>
		<script>
	
		</script>
	</form>
	</div>
</c:forEach>
</section>
<!-- to make in this page automatically make array about list[map{}] format
	 with each input data based on ${num } value with concat method-->
	 	<!-- $(document).ready(function(){
			/* $('input').attr('name',$('input').attr('name')+1); */
			$('input').attr('value',$('input').attr('name'));
		}) -->