<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="who pay?" />
<%@ include file="../common/head.jspf"%>
<style>
table {
	width: 200px;
}
.poke{
	width: 150px;
	height: 200px;
	
}
</style>
<table style="width: 200px;" class="table mx-auto">
		<colgroup>
				<col style="width: 50px;">
				<col style="width: 100px;">
				<col style="width: 50px;">
				<col style="width: 80px;">
				<col style="width: 80px;">
		</colgroup>
	
		<tr>
				<td>
						<button id="down" class="badge badge-error"><<</button>
				</td>
				<td>
						<input id="num" type="text" value="1" name="number" class="text-center" />
				</td>
				<td>
						<button id="up" class="badge badge-info">>></button>
				</td>
				<td>
						<button id="getpeople" type="submit" class="btn btn-outline btn-success" style="width: 80px;"
						 onclick="showrandomgame()">확인</button>
				</td>
				<td>
						<button id="retry" onclick="rerandom()" class="btn btn-outline btn-error" style="width: 80px;">다시</button>
				</td>
		</tr>

</table>




<div></div>
<div id="content"></div>
<div id="confirm" class="hidden"></div>
<div id="choice"></div>
<div class="text-center">
	<button id="start" class="hidden"
		style="width: 200px; height: 100px;">돌려돌려돌림판~</button>
</div>
<div>
	
</div>
<script>
	var pokeimage=['/고라파덕','/꼬부기','/냐옹이','/뮤','/브케인','/이브이','/이상해씨','/치코리타','/토게피','/파이리','/푸린'];
	var eatmember = [];
	var random = []
	var cofirm;
	function showrandomgame(){
		$('#start').attr('class','btn btn-active btn-primary text-center');
	}
	function rerandom() {
		random = Array.from(Array(20 + Math.floor(Math.random() * 35)).keys());
	}
	$('#retry').click(function () {
		rerandom();
	})
var randompictureindex;
	//set people num and pass data to bring jsp page
	$("#getpeople").click(
		function () {
			if (parseInt($('#num').val()) < 2 ||
				parseInt($('#num').val()) > 8) {
				alert('두명에서 여덜명까지 적어주세요..');
				return false;
			}
			randompictureindex = Array.from(Array(11).keys()).sort(function(a, b){return Math.random()-0.5});
			$.ajax({
				url: '/usr/today/whopaynum',
				type: 'GET',
				data: {
					array : JSON.stringify(randompictureindex), 
					number: $('#num').val()
				},
				contentType: 'text/html; charset=utf-8',
				success: function (v) {
					$('#content').html(v);
						for(var i=1; i-1<parseInt($('#num').val()); i++){
							$('#'+i+'img').attr('src',pokeimage[randompictureindex[i]]);
							$('#'+i+'pokename').text(pokeimage[randompictureindex[i]].substring(1))
						}	
					
				}
			});
		});
	
	$('#up').click(function () {
		$('#num').val(parseInt($('#num').val()) + 1);
	});
	
	$('#down').click(function () {
		$('#num').val(parseInt($('#num').val()) - 1);
	});
	$(document).ready(function () {
		rerandom();
	});
	
	
			
			$('#retry').click(function () {
				$('#1').css('background-color', 'red');
			})
			
			/* $('#start').click(function () {
				$.ajax({
					url: '/usr/today/doEat',
					type: 'POST',
					data: JSON.stringify(eatmember),
					contentType: 'application/json',
					success: function (response) {
						console.log(response);
					},
					error: function (error) {
						console.error(error);
					}
				})
			}) */
			
			$('#start').click(function loop() {
				var choice = Math.floor(Math.random() * 8);
				random.pop();
				$("#" + (random.length % parseInt($('#num').val()) + 1+"this")).css('background-color', 'rgb(280,87,87)');
				setTimeout(
					function () {
						setTimeout(
							function () {
								if (random.length == parseInt(choice)) {
									return;
								}
							 	$("#" + (random.length % parseInt($('#num').val()) + 1+"this")).css(
									'background-color', 'white');
							}, 50);
						$('#confirm').html(random.length);
						setTimeout(function () {
							if (random.length > parseInt(choice)) {
								loop();
							}
						}, 50);
					}, 50)
				/* $('#'+choice%parseInt($('#num').val()).css('background-color','gold'); */
				/* $('#1').css('background-color','gold'); */
			})
	/*                 const box = document.createElement("div");
	 $("div").text("Asdasd");
	 document.body.appendChild(box); */
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
<!-- /* 			random.pop();
			$('#1').css('background-color','red');
			setTimeout(function() {
				$('#1').css('background-color','gold');	
			}, 1000); */ -->