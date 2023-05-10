<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="who pay?" />
<%@ include file="../common/head.jspf"%>
<hr />

<div class="flex">
		<button id="down"><<</button>

		<input id="num" type="text" value="1" name="number" />
		<button id="up">>></button>
</div>
<div>
		<button id="submit" type="submit">확인</button>
</div>
<div>
		<button id="red">asdsad</button>
</div>
<div id="content"></div>
<script>
	$(document).ready(
			function() {
				$("#submit").click(
						function() {
							if (parseInt($('#num').val()) < 2
									|| parseInt($('#num').val()) > 8) {
								alert('두명에서 여덜명까지 적어주세요..');
								return false;
							}
							$.ajax({
								url : '/usr/today/whopaynum',
								type : 'GET',
								data : {
									number : $('#num').val()
								},
								contentType : 'text/html; charset=utf-8',
								success : function(v) {
									$('#content').html(v);
								}
							});
						});
				$('#down').click(function() {
					$('#num').val(parseInt($('#num').val()) - 1);
				});
			});

	$(document).ready(function() {
		$('#up').click(function() {
			$('#num').val(parseInt($('#num').val()) + 1);
		});
		$('#red').click(function() {
			$('#1').css('background-color', 'red');
		})
	})
	var random =Array.from(Array( 10 + Math.floor(Math.random() * 35)).keys());
	
</script>

<%@ include file="../common/foot.jspf"%>
<!-- </script>
	<div class="flex">
		<button id="down"> << </button>
		
		<form action="" method="POST" onsubmit="return numchk(this)" >
		<input id="num" type="text" value="1" name="number"/>
		<button type="submit" >확인</button>
		</form>
		
		<button id="up">>></button>
	</div>
	
<script> -->