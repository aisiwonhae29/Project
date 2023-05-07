<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="pageTitle" value="who pay?"/>
<%@ include file="../common/head.jspf" %>
<hr />
	
	<div>
		<div> < </div>
		<form action="">
		
		<c:set var="a" value="1"/>
		<input type="text" value="${a} " />
		<c:if test="true">
		
		</c:if>
		</form>
		
		<div>></div>
	</div>
	
	<div>
	<table>
		<colgroup>
		
		</colgroup>
		<thead>
		
		</thead>
		<tbody>
			
		</tbody>
	</table>
	</div>
	
	<section>
	<table>
  <thead>
    <th>Inputs</th>
    <th>HTML Out</th>
    <th>Value Out</th>
  </thead>
  
  
  <tr>
    <td>
      <input id="name" 
             onkeyup="myFunction(this.id,this.value)"
      />
    </td>
    <td id="txtname">
    </td>
    <td>
      <input id="inname" />
    </td>
  </tr>
  <script>
  var a=5;
  </script>
  
  <c:forEach var="i" begin="1" end="${a }">
  sdfsdf
  
  </c:forEach>
  
  <tr>
    <td>
      <input id="lastname" 
             onkeyup="myFunction(this.id,this.value)"
      />
    </td>
    <td class="t" id="txtlastname">
    </td>
    <td>
      <input id="inlastname" />
    </td>
  </tr>
</table>


	
	</section>
	
	<script>
	function myFunction(A,B) {
		  var syncValue = B;
		  document.getElementById("txt"+A).innerHTML = syncValue;
		  document.getElementById("in"+A).value = syncValue;
		}
	</script>
<%@ include file="../common/foot.jspf" %>
