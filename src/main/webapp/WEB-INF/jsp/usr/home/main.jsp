<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="MAIN" />
<%@ include file="../common/head.jspf"%>
<style>
#imgbox {
	width: 350px
}

#no {
	width: 100px;
}

#menu {
	width: 200px;
}

th {
	border: 1px solid #000;
	background-color: rgb(250, 87, 87);
}

.menulist:hover {
	background-color: rgb(250, 87, 87);
	transition: 1s;
	opacity: 0.5;;
}

.menulist>td>a {
	display: block;
	text-align: center;
}

img {
	transition: 2s;
}

#maingrid {
	display: grid;
	grid-template-columns: 10% 30% 20% 30% 10%;
	grid-template-rows: repeat(5, 20%);
	padding: 20px;
	height: 600px;
}

#rankbox {
	grid-column: 2/3;
	grid-row: 2/5;
}
#imgbox{
	position: absolute;
	width: 400px;
	height: 400px;
	right: 100px;
	margin-top: 120px;
}
/* #imgbox {
	grid-column: 4;
	grid-row: 2/5;
} */
#clockbox{
    width: 300px;
	grid-column:1/3;
	grid-row:1;
}
</style>
<section id="maingrid" class="mainrank w-full bottom-32 ">
		<div id="clockbox" class="btn btn-outline btn-success gap-2">
		<div id="ampm" class="badge badge-primary badge-outline"></div>
		<div id="hours"></div>시
		<div id="minutes"></div>분
		<div id="seconds"></div>초
		</div>
		<div id="rankbox" class=" h-100p">
				<table class="table w-full">
						<caption id="ranktitle"><div class="btn btn-outline mb-1">오늘의 메뉴</div></caption>
						<thead>
								<th id="no" class="text-center">Top</th>
								<th id="menu" class="text-center">menu</th>
						</thead>
						<tbody>
								<tr class="menulist">
										<td class="text-center">1</td>
										<td>
												<a rel="rankfoodimg1" onmousemove="pickimage(this)" id="1stRankval" href="/usr/today/where?menu=${mainRankLists[0].menuname }">${mainRankLists[0].menuname }</a>
										</td>
								</tr>
								<tr class="menulist">
										<td class="text-center">2</td>
										<td>
												<a rel="rankfoodimg2" onmousemove="pickimage(this)" id="2ndRankval" href="/usr/today/where?menu=${mainRankLists[1].menuname }">${mainRankLists[1].menuname }</a>
										</td>
								</tr>
								<tr class="menulist">
										<td class="text-center">3</td>
										<td>
												<a rel="rankfoodimg3" onmousemove="pickimage(this)" id="3rdRankval" href="/usr/today/where?menu=${mainRankLists[2].menuname }">${mainRankLists[2].menuname }</a>
										</td>
								</tr>
								<tr class="menulist">
										<td class="text-center">4</td>
										<td>
												<a rel="rankfoodimg4" onmousemove="pickimage(this)" id="4thRankval" href="/usr/today/where?menu=${mainRankLists[3].menuname }">${mainRankLists[3].menuname }</a>
										</td>
								</tr>
								<tr class="menulist">
										<td class="text-center">5</td>
										<td>
												<a rel="rankfoodimg5" onmousemove="pickimage(this)" id="5thRankval" href="/usr/today/where?menu=${mainRankLists[4].menuname }">${mainRankLists[4].menuname }</a>
										</td>
								</tr>
						</tbody>
				</table>
		</div>
		<div id="imgbox" class="carousel carousel-center max-w-md p-4 space-x-4 bg-neutral rounded-box mt-10 ">
				<div id="item1" class="carousel-item ">
						<img id="rankfoodimg1" class="h-full"
								src="https://blog.kakaocdn.net/dn/YPxRW/btrzhpNljHH/Zv9tsjGi82dNOjpLdkflh0/img.jpg" alt="" />
				</div>
				<div id="item2" class="carousel-item ">
						<img id="rankfoodimg2" class="h-full"
								src="https://blog.kakaocdn.net/dn/YPxRW/btrzhpNljHH/Zv9tsjGi82dNOjpLdkflh0/img.jpg" alt="" />
				</div>
				<div id="item3" class="carousel-item ">
						<img id="rankfoodimg3" class="h-full"
								src="https://blog.kakaocdn.net/dn/YPxRW/btrzhpNljHH/Zv9tsjGi82dNOjpLdkflh0/img.jpg" alt="" />
				</div>

				<div id="item4" class="carousel-item ">
						<img id="rankfoodimg4" class="h-full"
								src="https://blog.kakaocdn.net/dn/YPxRW/btrzhpNljHH/Zv9tsjGi82dNOjpLdkflh0/img.jpg" alt="" />
				</div>
				<div id="item5" class="carousel-item ">
						<img id="rankfoodimg5" class="h-full"
								src="https://www.newiki.net/w/images/thumb/d/d9/Jjajangmyeon.jpg/450px-Jjajangmyeon.jpg" alt="" />
				</div>
		</div>
</section>

<script>
function pickimage(element) {
	location.replace('http://localhost:8081/usr/home/main'+'#'+$(element).attr('rel'));
    //alert($(element).attr('rel'));
}
$(document).ready(function(){
	$('#rankfoodimg1').attr('src', imageArray.get($('#1stRankval')[0].textContent));
	$('#rankfoodimg2').attr('src', imageArray.get($('#2ndRankval')[0].textContent));
	$('#rankfoodimg3').attr('src', imageArray.get($('#3rdRankval')[0].textContent));
	$('#rankfoodimg4').attr('src', imageArray.get($('#4thRankval')[0].textContent));
	$('#rankfoodimg5').attr('src', imageArray.get($('#5thRankval')[0].textContent));
});
  		$('.menulist').mouseover(function () {
  			$(this).css('background-color','gold');
        });
  		$('.menulist').mouseleave(function () {
  			$(this).css('background-color','white');
      });
        function showDish(){
        	$('.menulist')
        	alert(${mainRankList[1].menuname});
        	alert();
        }
        function startTime(){
        	var today= new Date();
        	var h=today.getHours();
        	var m=today.getMinutes();
        	var s=today.getSeconds();
        	var session="AM";
        	if(h==0){
        		h=12;
        	}
        	if(h>12){
        		h=h-12;
        		session="PM"
        	}
        	$('#ampm').text(session);
        	$('#hours').text(h); 
        	$('#minutes').text(m); 
        	$('#seconds').text(s);
        	var t=setTimeout(function(){startTime(), 1000});
        }
        startTime();
        </script>

<%@ include file="../common/foot.jspf"%>