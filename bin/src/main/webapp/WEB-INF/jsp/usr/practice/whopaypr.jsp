<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="pageTitle" value="who pay?"/>
<%@ include file="../common/head.jspf" %>
<hr />
	  <h1>AJAX Example</h1>
 <div id="result"></div>

<script>
$(document).ready(function(){
	$("button").click(function(){$.ajax({
		url : '/usr/practice/txt',
		type : 'GET',
		data : { number : "hello"},
		contentType : 'application/json; charset=utf-8',
		success : function(v){
			alert(v);
		}
	});
	});
});
</script>
<div id="div1">its test for activate </div>
<button>button</button>

<%@ include file="../common/foot.jspf" %>


<!-- /* $(document).ready(function() {
    $.ajax({
      type: "GET",
      url: "pmp.txt",
      dataType: "text",
      success: function(response) {
        $("#div1").text(response);
      },
      error: function(xhr, status, error) {
        console.log("Error: " + status + " - " + error);
      }
    });
  });
 */
/* $(document).ready(function(){
	$("button").click(function(){
		 $("#div1").load("pmp.txt");
	 	$("#div1").text("asdasd"); 
	});
});
 */ -->
<!--   <script>
    $(document).ready(function() {
      $.ajax({
        type: "GET",
        url: "data.txt",
        dataType: "text",
        success: function(response) {
          $("#result").text(response);
        },
        error: function(xhr, status, error) {
          console.log("Error: " + status + " - " + error);
        }
      });
    });
  </script> -->
<%--     <%
            String jspPath = session.getServletContext().getRealPath("/");
            String txtFilePath = jspPath+ "/WEB-INF/jsp/usr/practice/pmp.txt";
            BufferedReader reader = new BufferedReader(new FileReader(txtFilePath));
            StringBuilder sb = new StringBuilder();
            String line;

            while((line = reader.readLine())!= null){
                sb.append(line+"\n");
            }
            out.println(sb.toString());
        %> --%>
