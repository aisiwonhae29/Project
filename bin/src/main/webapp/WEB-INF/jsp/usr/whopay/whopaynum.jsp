<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<section class="flex justify-around">
<c:forEach begin="1" end ="${getpeople }" var="i">
	<div >
	<div id="<c:out value = "${i}"/>">as</div>
	<!-- <form onsubmit="confirmclick; return false;"> -->
		<div><input class="${i}" type="hidden" value="${i}" name="id" /></div>
		<div><input class="${i}" type="text" value="23/05/13" name="date" /></div>
		<div><input class="${i}" type="text" value="월평동" name="location" /></div>
		<div><input class="${i}" type="text" value="제육볶음" name="menu" /></div>
		<div><input class="${i}" type="text" value="man" name="gender" /></div>
		<div><input class="${i}" type="text" value="33" name="age" /></div>
		<script>
		
		$(document).ready(
				function(){
				 $('#confirmData').click(function(){
					var array=[];
					$('.'+${i}).each(function(){
						var key=$(this).attr('name');
						var value=$(this).val().trim();
						var map={};
						map[key]=value;
						array.push(map);
						
					 });
					eatmember.push(array);
					 }) 
				
				})
		</script>
	<!-- </form> -->
	</div>
</c:forEach>
</section>
<!-- to make in this page automatically make array about list[map{}] format
	 with each input data based on ${num } value with concat method-->
	 	<!-- $(document).ready(function(){
			/* $('input').attr('name',$('input').attr('name')+1); */
			$('input').attr('value',$('input').attr('name'));
		}) -->